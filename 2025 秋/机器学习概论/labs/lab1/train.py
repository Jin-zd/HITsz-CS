"""ID3 decision tree training script.
	)

	if not dataset:
		raise ValueError("Training data is empty; unable to build a decision tree.")
"""

from __future__ import annotations

import argparse
import csv
import json
import math
from collections import Counter
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, Iterable, List, Optional


@dataclass
class TreeNode:
	"""Represents a node in the decision tree."""

	attribute: Optional[str] = None
	children: Dict[str, "TreeNode"] = field(default_factory=dict)
	prediction: Optional[str] = None
	majority_label: Optional[str] = None

	def is_leaf(self) -> bool:
		return self.prediction is not None


class DecisionTreeID3:
	"""A simple ID3 implementation supporting JSON serialization."""

	def __init__(self) -> None:
		self.root: Optional[TreeNode] = None
		self.target_attribute: Optional[str] = None

	# ------------------------------------------------------------------
	# Public API
	# ------------------------------------------------------------------
	def fit(
		self,
		dataset: List[Dict[str, str]],
		target_attribute: str,
		attributes: Optional[Iterable[str]] = None,
	) -> "DecisionTreeID3":

		self.target_attribute = target_attribute
		if attributes is None:
			attributes = [key for key in dataset[0] if key != target_attribute]
		else:
			attributes = [attr for attr in attributes if attr != target_attribute]

		self.root = self._build_tree(dataset, list(attributes))
		return self

	def predict(self, records: List[Dict[str, str]]) -> List[str]:
		if self.root is None or self.target_attribute is None:
			raise RuntimeError("Model has not been trained or target attribute is unset.")

		return [self._predict_single(record) for record in records]

	def score(self, records: List[Dict[str, str]]) -> float:
		predictions = self.predict(records)
		actual = [record[self.target_attribute] for record in records]
		correct = sum(1 for pred, truth in zip(predictions, actual) if pred == truth)
		return correct / len(records)

	def export_tree(self) -> str:
		"""Returns an ASCII representation of the tree."""

		if self.root is None:
			return "<empty tree>"

		lines: List[str] = []

		def _render(node: TreeNode, indent: str = "") -> None:
			prefix = "└─" if indent else ""
			if node.is_leaf():
				lines.append(f"{indent}{prefix}Prediction: {node.prediction}")
			else:
				lines.append(
					f"{indent}{prefix}Attribute: {node.attribute} (Majority: {node.majority_label})"
				)
				child_items = sorted(
					((value, child) for value, child in node.children.items()),
					key=lambda pair: pair[0],
				)
				for idx, (value, child) in enumerate(child_items):
					last_child = idx == len(child_items) - 1
					branch_indent = indent + ("   " if not indent else ("   " if last_child else "│  "))
					connector = "└─" if last_child else "├─"
					lines.append(f"{indent}{connector}{value}")
					_render(child, branch_indent)

		_render(self.root)
		return "\n".join(lines)

	def save(self, path: Path) -> None:
		if self.root is None or self.target_attribute is None:
			raise RuntimeError("Model has not been trained; cannot persist to disk.")

		payload = {
			"target": self.target_attribute,
			"tree": self._node_to_dict(self.root),
		}
		path.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")

	@classmethod
	def load(cls, path: Path) -> "DecisionTreeID3":
		payload = json.loads(path.read_text(encoding="utf-8"))
		model = cls()
		model.target_attribute = payload["target"]
		model.root = cls._node_from_dict(payload["tree"])
		return model

	# ------------------------------------------------------------------
	# Internal helpers
	# ------------------------------------------------------------------
	def _build_tree(self, dataset: List[Dict[str, str]], attributes: List[str]) -> TreeNode:
		labels = [row[self.target_attribute] for row in dataset]
		label_counts = Counter(labels)
		majority_label = self._majority_label(label_counts)

		if len(label_counts) == 1:
			return TreeNode(prediction=labels[0], majority_label=labels[0])

		if not attributes:
			return TreeNode(prediction=majority_label, majority_label=majority_label)

		best_attribute, best_gain = self._best_attribute(dataset, attributes)

		if best_attribute is None or best_gain <= 0:
			return TreeNode(prediction=majority_label, majority_label=majority_label)

		node = TreeNode(attribute=best_attribute, majority_label=majority_label)
		remaining_attributes = [attr for attr in attributes if attr != best_attribute]

		for value, subset in self._split_by_attribute(dataset, best_attribute).items():
			if not subset:
				node.children[value] = TreeNode(
					prediction=majority_label, majority_label=majority_label
				)
			else:
				node.children[value] = self._build_tree(subset, remaining_attributes)

		return node

	def _predict_single(self, record: Dict[str, str]) -> str:
		node = self.root
		while node is not None:
			if node.is_leaf():
				return node.prediction  # type: ignore[return-value]

			value = record.get(node.attribute, None)
			child = node.children.get(value) if value is not None else None
			if child is None:
				# Unseen attribute value; fall back to the majority label at this node.
				if node.majority_label is None:
					raise RuntimeError("Node is missing its majority label; prediction failed.")
				return node.majority_label
			node = child

		raise RuntimeError("Encountered an invalid node during traversal; prediction failed.")

	def _best_attribute(
		self, dataset: List[Dict[str, str]], attributes: Iterable[str]
	) -> tuple[Optional[str], float]:
		base_entropy = self._entropy([row[self.target_attribute] for row in dataset])
		best_gain = -math.inf
		best_attribute: Optional[str] = None

		for attribute in attributes:
			gain = base_entropy - self._conditional_entropy(dataset, attribute)
			if gain > best_gain or (math.isclose(gain, best_gain) and attribute < (best_attribute or "")):
				best_gain = gain
				best_attribute = attribute

		if best_attribute is None:
			return None, 0.0

		return best_attribute, best_gain

	def _conditional_entropy(self, dataset: List[Dict[str, str]], attribute: str) -> float:
		subsets = self._split_by_attribute(dataset, attribute)
		total_count = len(dataset)
		entropy = 0.0
		for subset in subsets.values():
			if not subset:
				continue
			weight = len(subset) / total_count
			entropy += weight * self._entropy([row[self.target_attribute] for row in subset])
		return entropy

	@staticmethod
	def _split_by_attribute(
		dataset: List[Dict[str, str]], attribute: str
	) -> Dict[str, List[Dict[str, str]]]:
		subsets: Dict[str, List[Dict[str, str]]] = {}
		for row in dataset:
			subsets.setdefault(row[attribute], []).append(row)
		return subsets

	@staticmethod
	def _entropy(labels: Iterable[str]) -> float:
		label_counts = Counter(labels)
		total = sum(label_counts.values())
		if total == 0:
			return 0.0
		entropy = 0.0
		for count in label_counts.values():
			probability = count / total
			entropy -= probability * math.log2(probability)
		return entropy

	@staticmethod
	def _majority_label(label_counts: Counter) -> str:
		if not label_counts:
			raise RuntimeError("Cannot determine a majority class from an empty label set.")

		# Sort by frequency and then lexicographically to guarantee deterministic output.
		return sorted(label_counts.items(), key=lambda item: (-item[1], item[0]))[0][0]

	@classmethod
	def _node_to_dict(cls, node: TreeNode) -> Dict[str, object]:
		return {
			"attribute": node.attribute,
			"prediction": node.prediction,
			"majority_label": node.majority_label,
			"children": {k: cls._node_to_dict(v) for k, v in node.children.items()},
		}

	@classmethod
	def _node_from_dict(cls, payload: Dict[str, object]) -> TreeNode:
		node = TreeNode(
			attribute=payload.get("attribute"),
			prediction=payload.get("prediction"),
			majority_label=payload.get("majority_label"),
		)
		children_payload = payload.get("children", {})
		if isinstance(children_payload, dict):
			for value, child_payload in children_payload.items():
				node.children[value] = cls._node_from_dict(child_payload)  # type: ignore[arg-type]
		return node


def load_dataset(path: Path) -> List[Dict[str, str]]:
	with path.open("r", encoding="utf-8", newline="") as file:
		reader = csv.DictReader(file)
		return [dict(row) for row in reader]


def main() -> None:
	default_train_path = Path(__file__).with_name("train.csv")
	default_model_path = Path(__file__).with_name("model.json")

	parser = argparse.ArgumentParser(description="Train a decision tree model using the ID3 algorithm")
	parser.add_argument("--input", type=Path, default=default_train_path, help="Training data CSV path")
	parser.add_argument("--model", type=Path, default=default_model_path, help="Model output JSON path")
	parser.add_argument("--target", default="weather", help="Name of the target attribute column")
	parser.add_argument(
		"--show-tree",
		action="store_true",
		help="Print the decision tree structure after training",
	)

	args = parser.parse_args()

	dataset = load_dataset(args.input)
	if not dataset:
		raise SystemExit("Training dataset is empty; please verify the input file.")

	tree = DecisionTreeID3().fit(dataset, args.target)

	accuracy = tree.score(dataset)
	tree.save(args.model)

	print("Training complete ✅")
	print(f"Number of training samples: {len(dataset)}")
	print(f"Training accuracy: {accuracy:.4f}")
	print(f"Model saved to: {args.model}")

	if args.show_tree:
		print("\nDecision tree structure:\n")
		print(tree.export_tree())


if __name__ == "__main__":
	main()

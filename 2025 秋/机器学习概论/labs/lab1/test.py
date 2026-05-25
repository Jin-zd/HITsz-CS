"""Prediction script using the trained ID3 decision tree model."""

from __future__ import annotations

import argparse
import csv
from pathlib import Path
from typing import Dict, List

from train import DecisionTreeID3, load_dataset


def save_predictions(
	records: List[Dict[str, str]],
	predictions: List[str],
	output_path: Path,
) -> None:
	if not records:
		raise ValueError("Prediction data is empty; cannot create a result file.")

	fieldnames = list(records[0].keys()) + ["weather"]
	with output_path.open("w", encoding="utf-8", newline="") as file:
		writer = csv.DictWriter(file, fieldnames=fieldnames)
		writer.writeheader()
		for record, prediction in zip(records, predictions):
			row = dict(record)
			row["weather"] = prediction
			writer.writerow(row)


def main() -> None:
	default_predict_path = Path(__file__).with_name("predict.csv")
	default_model_path = Path(__file__).with_name("model.json")
	default_output_path = Path(__file__).with_name("result.csv")

	parser = argparse.ArgumentParser(description="Run weather predictions with a trained decision tree model")
	parser.add_argument("--input", type=Path, default=default_predict_path, help="Prediction data CSV path")
	parser.add_argument("--model", type=Path, default=default_model_path, help="Trained model JSON path")
	parser.add_argument("--output", type=Path, default=default_output_path, help="Prediction output CSV path")

	args = parser.parse_args()

	if not args.model.exists():
		raise SystemExit("Model file not found; run train.py first to generate it.")

	predict_data = load_dataset(args.input)
	if not predict_data:
		raise SystemExit("Prediction dataset is empty; please check the input file.")

	model = DecisionTreeID3.load(args.model)
	predictions = model.predict(predict_data)

	save_predictions(predict_data, predictions, args.output)

	print("Prediction complete ✅")
	print(f"Number of predictions: {len(predictions)}")
	print(f"Prediction results saved to: {args.output}")
	print("Preview of predictions:")
	for sample, pred in zip(predict_data, predictions):
		features = ", ".join(f"{k}={v}" for k, v in sample.items())
		print(f" - {features} => weather={pred}")


if __name__ == "__main__":
	main()

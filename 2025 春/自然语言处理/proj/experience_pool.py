import faiss
import numpy as np
import logging
import torch
from sentence_transformers import SentenceTransformer

logging.getLogger("openai").setLevel(logging.WARNING)


TEXT_MODEL_ID = "checkpoints/BAAI/bge-m3"

class ExperiencePool:
    def __init__(self, text_dim=1024):

        self.experiences = {}  # id -> experience_text
        self.text_index = faiss.IndexFlatL2(text_dim)  # text embedding index
        self.text_model = SentenceTransformer(TEXT_MODEL_ID, device="cuda", model_kwargs={"torch_dtype": torch.bfloat16})
        self.next_id = 0
        self.text_dim = text_dim

    def __len__(self):
        return len(self.experiences)
    
    def get_text_embedding(self, text):
        """
        Get the text embedding using BGE-M3 model.

        Args:
            text (str): Input text.        
            Returns: np.ndarray: Text embedding.
        """
        logging.info(f"Getting embedding for text...")
        embedding = self.text_model.encode([text])
        logging.info(f"Got embedding for text.")
        norm = np.linalg.norm(embedding)
        if norm > 0:
            embedding = embedding / norm
        return embedding
    
    def add_experience(self, new_experience, key_text):
        """
        Add a new experience to the pool.

        Args:
            new_experience (str): New experience description.
            key_text (str): Text key for the new experience.
        """
        
        text_embedding = self.get_text_embedding(key_text)
        
        self.experiences[self.next_id] = new_experience
        self.text_index.add(text_embedding)
        self.next_id += 1
        return

        
    
    def search(self, query_text, top_k=5, threshold=0):
        """
        Search function using text embeddings to find similar experiences.

        Args:
            query_text (str): Text query.
            top_k (int): Number of top results to return.
            threshold (float): Similarity threshold for results.
        Returns:
            list: List of similar experiences (Sorting by similarity).
        """

        text_embedding = self.get_text_embedding(query_text)

        if len(self.experiences) == 0:
            return []

        text_distances, text_indices = self.text_index.search(text_embedding, len(self.experiences))

        top_results = []
        for i, idx in enumerate(text_indices[0]):
            if idx < len(self.experiences):
                l2_distance = text_distances[0][i]
                text_cos_sim = 1.0 - (l2_distance * l2_distance) / 2.0
                text_cos_sim = max(min(text_cos_sim, 1.0), -1.0)
                
                if text_cos_sim > threshold:
                    top_results.append({
                        'id': idx,
                        'experience': self.experiences[idx],
                        'similarity_score': text_cos_sim
                    })
                    if len(top_results) >= top_k:
                        break

        return top_results





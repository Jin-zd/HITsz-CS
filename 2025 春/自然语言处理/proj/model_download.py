cache_dir = "./checkpoints"

from modelscope import snapshot_download

model_dir = snapshot_download("BAAI/bge-m3", cache_dir=cache_dir)
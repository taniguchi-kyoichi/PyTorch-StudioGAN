#!/bin/bash

# 実行するPythonスクリプト
python src/main.py \
  -t -cfg src/configs/config_reacgan.yaml \
  -data data/HAM10000_resized \
  -save checkpoints -metrics is fid prdc \
  -ref "train" -mpc --post_resizer "friendly" \
  --eval_backbone "InceptionV3_tf"

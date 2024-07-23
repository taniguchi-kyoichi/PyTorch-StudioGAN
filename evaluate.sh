#!/bin/bash

# GPUデバイスの指定
#CUDA_VISIBLE_DEVICES=0
#
# 設定ファイルのパス
CONFIG_PATH="src/configs/config_reacgan.yaml"

# チェックポイントディレクトリのパス
CKPT_DIR="checkpoints"

# データセットのディレクトリのパス
DATA_PATH="data/HAM10000"

# 生成された画像の保存ディレクトリのパス
SAVE_PATH="outputs/generated_images"

# コマンドの実行
python3 src/main.py -knn -cfg $CONFIG_PATH -ckpt $CKPT_DIR -data $DATA_PATH -save $SAVE_PATH

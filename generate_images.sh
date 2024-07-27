#!/bin/bash

# Constants
CONFIG_PATH="src/configs/config_reacgan.yaml"
DATA_PATH="data/HAM10000_resized"
CKPT_PATH="checkpoints"
OUTPUT_DIR="fake_images"
NUM_IMAGES_PER_CLASS=100

# Check if all required directories exist
if [ ! -f "$CONFIG_PATH" ]; then
    echo "Config file not found at $CONFIG_PATH"
    exit 1
fi

if [ ! -d "$DATA_PATH" ];then
    echo "Data directory not found at $DATA_PATH"
    exit 1
fi

if [ ! -d "$CKPT_PATH" ]; then
    echo "Checkpoint directory not found at $CKPT_PATH"
    exit 1
fi

if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Output directory not found at $OUTPUT_DIR. Creating it..."
    mkdir -p $OUTPUT_DIR
fi

# Export CUDA visible devices (if using CUDA)
# export CUDA_VISIBLE_DEVICES=0

# Run the main.py script with the provided arguments
python3 src/main.py \
    --cfg_file $CONFIG_PATH \
    --data_dir $DATA_PATH \
    --ckpt_dir $CKPT_PATH \
    --output_dir $OUTPUT_DIR \
    --num_images_per_class $NUM_IMAGES_PER_CLASS \
    --generate_images

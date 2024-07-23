import os
from PIL import Image
import torchvision.transforms as transforms


def resize_and_save_image(image_path, output_path, size):
    # Open an image file
    with Image.open(image_path) as img:
        # Resize image
        transform = transforms.Resize(size)
        img_resized = transform(img)
        # Save the image
        img_resized.save(output_path)


def process_directory(input_dir, output_dir, size=(256, 256)):
    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)

    for root, _, files in os.walk(input_dir):
        for file in files:
            if file.endswith(('.jpg', '.jpeg', '.png')):
                # Define the input and output paths
                input_path = os.path.join(root, file)
                relative_path = os.path.relpath(input_path, input_dir)
                output_path = os.path.join(output_dir, relative_path)

                # Ensure the output directory exists
                os.makedirs(os.path.dirname(output_path), exist_ok=True)

                # Resize and save the image
                resize_and_save_image(input_path, output_path, size)
                print(f"Processed and saved: {output_path}")


def main():
    base_dir = "data/HAM10000"
    output_base_dir = "data/HAM10000_resized"
    size = (256, 256)

    for split in ["train", "valid"]:
        input_dir = os.path.join(base_dir, split)
        output_dir = os.path.join(output_base_dir, split)
        process_directory(input_dir, output_dir, size)


if __name__ == "__main__":
    main()

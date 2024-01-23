#!/bin/bash

# Define a counter and base directory for output
count=0
output_dir="$HOME/screenshot_ocr_output"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Infinite loop, press Ctrl+C to stop
while true; do
    # Increment the counter
    ((count++))

    # Take a full-screen screenshot
    gnome-screenshot -f "$output_dir/screenshot_$count.png"

    # Perform OCR on the screenshot
    tesseract "$output_dir/screenshot_$count.png" "$output_dir/screenshot_$count" -l eng

    # Remove the screenshot image to save disk space
    rm "$output_dir/screenshot_$count.png"

    # Wait for 1 second
    sleep 1
done

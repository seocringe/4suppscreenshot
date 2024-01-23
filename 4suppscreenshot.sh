#!/usr/bin/env sh

# Define a counter and base directory for output
count=0
duration=9
output_dir="$HOME/screenshot_ocr_output"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Get the start time
start_time=$(date +%s)

# Loop for the duration
while [ $(($(date +%s) - start_time)) -lt $duration ]; do
    # Increment the counter
    count=$((count + 1))

    # Take a full-screen screenshot
    gnome-screenshot -f "${output_dir}/screenshot_${count}.png"

    # Perform OCR on the screenshot
    tesseract "${output_dir}/screenshot_${count}.png" "${output_dir}/screenshot_${count}" -l eng

    # Remove the screenshot image to save disk space
    rm "${output_dir}/screenshot_${count}.png"

    # Wait for 1 second
    sleep 1
done

# Compress the OCR output files into an archive with xz compression
tar -cJf "${output_dir}/ocr_output.tar.xz" -C "$output_dir" .

#!/bin/bash

current_date=$(date +"%Y-%m-%d")
# Directory where videos are stored
VIDEO_DIR="/opt/robotframework/results/$current_date"
# Desired new filename prefix
NEW_NAME_PREFIX="video_$current_date"

# Counter for file renaming
COUNTER=1

# Loop through each video file in the directory
for VIDEO_FILE in "$VIDEO_DIR"/*.webm; do
  # Extract the file extension
  EXTENSION="${VIDEO_FILE##*.}"
  # Create the new filename
  NEW_NAME="${VIDEO_DIR}/${COUNTER}_${NEW_NAME_PREFIX}.${EXTENSION}"
  # Rename the file
  mv "$VIDEO_FILE" "$NEW_NAME"
  # Increment the counter
  COUNTER=$((COUNTER + 1))
done

echo "Videos have been renamed successfully."

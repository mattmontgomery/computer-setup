#!/bin/bash

# Specify the directory to organize
TARGET_DIR="$1"

# Check if the directory is provided
if [ -z "$TARGET_DIR" ]; then
  echo "Usage: $0 /path/to/directory"
  exit 1
fi

# Check if the directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Directory does not exist: $TARGET_DIR"
  exit 1
fi

# Loop through all files in the target directory
for file in "$TARGET_DIR"/*; do
  # Check if it's a file
  if [ -f "$file" ]; then
    # Get the modification year and month
    year=$(date -r "$file" +%Y)
    month=$(date -r "$file" +%m)

    # Create the target subdirectory
    mkdir -p "$TARGET_DIR/$year-$month"

    # Move the file to the appropriate subdirectory
    mv "$file" "$TARGET_DIR/$year-$month/"
  fi
done

echo "Files organized by year and month."
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 directory"
    exit 1
fi

directory="$1"

# Ensure the directory exists
if [ ! -d "$directory" ]; then
    mkdir -p "$directory"
fi

# Create original files
echo "This is file 1" > "$directory/file1.txt"
echo "This is file 2" > "$directory/file2.txt"
echo "This is file 3" > "$directory/file3.txt"

# Create duplicate files
cp "$directory/file1.txt" "$directory/file1_duplicate.txt"
cp "$directory/file2.txt" "$directory/file2_duplicate1.txt"
cp "$directory/file2.txt" "$directory/file2_duplicate2.txt"
cp "$directory/file3.txt" "$directory/file3_duplicate.txt"

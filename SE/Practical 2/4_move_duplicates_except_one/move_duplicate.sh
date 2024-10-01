#!/bin/bash
if [ $# -ne 2 ]; then
echo "Usage: $0 source_directory target_directory"
exit 1
fi
source_directory="$1"
target_directory="$2"
if [ ! -d "$target_directory" ]; then
mkdir -p "$target_directory"
fi
find "$source_directory" -type f -exec md5sum {} + | sort | uniq -w32 -dD | while read -r hash file;
do
mv "$file" "$target_directory"
done    
#!/bin/bash
# star_pattern.sh
# Usage: ./star_pattern.sh <number_of_rows>

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <number_of_rows>"
  exit 1
fi

# Check if input is a positive integer
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "Error: Input must be a positive integer."
  exit 1
fi

rows=$1

# Generate the star pattern
for ((i = 1; i <= rows; i++)); do
  for ((j = 1; j <= i; j++)); do
    echo -n "* "
  done
  echo ""
done

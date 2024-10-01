#!/bin/bash

rows=5  # You can change this number for a different height

echo "Additional Pyramid Patterns"

# Dollar Sign Pyramid
echo "Task 1: Dollar Sign Pyramid"
for (( i=1; i<=rows; i++ ))
do
  for (( j=i; j<rows; j++ ))
  do
    echo -n " "  # Print spaces
  done
  for (( k=1; k<=2*i-1; k++ ))
  do
    echo -n "$"  # Print dollar signs
  done
  echo  # New line
done
echo

# ---------------------------------------------------------
# Task 2: Star Pattern with Alternating Rows
# ---------------------------------------------------------
echo "Task 2: Star Pattern with Alternating Rows"
for (( i=1; i<=rows; i++ ))
do
  for (( j=i; j<rows; j++ ))
  do
    echo -n " "  # Print spaces
  done
  for (( k=1; k<=2*i-1; k++ ))
  do
    if (( i % 2 == 0 )); then
      echo -n "*"  # Print stars for even rows
    else
      echo -n "+"  # Print plus signs for odd rows
    fi
  done
  echo  # New line
done
echo

# ---------------------------------------------------------
# Task 3: Increasing Number Pyramid
# ---------------------------------------------------------
echo "Task 3: Increasing Number Pyramid"
for (( i=1; i<=rows; i++ ))
do
  for (( j=i; j<rows; j++ ))
  do
    echo -n " "  # Print spaces
  done
  for (( k=1; k<=i; k++ ))
  do
    echo -n "$k "  # Print increasing numbers
  done
  echo  # New line
done
echo

# ---------------------------------------------------------
# Task 4: Alphabet Pyramid in Reverse Order
# ---------------------------------------------------------
echo "Task 4: Alphabet Pyramid in Reverse Order"
char=Z  # Start with 'Z'
for (( i=1; i<=rows; i++ ))
do
  for (( j=i; j<rows; j++ ))
  do
    echo -n " "  # Print spaces
  done
  for (( k=1; k<=i; k++ ))
  do
    echo -n "$char "  # Print characters
  done
  char=$(echo "$char" | tr "A-Z" "Y-X")  # Move to the previous character
  echo  # New line
done
echo

# ---------------------------------------------------------
# Task 5: Custom Symbol Pyramid with Increasing Size
# ---------------------------------------------------------
echo "Task 5: Custom Symbol Pyramid with Increasing Size"
symbols=("*" "@" "#" "$" "%")  # Array of custom symbols
for (( i=1; i<=rows; i++ ))
do
  for (( j=i; j<rows; j++ ))
  do
    echo -n " "  # Print spaces
  done
  for (( k=1; k<=i; k++ ))
  do
    echo -n "${symbols[$(( (k-1) % ${#symbols[@]} ))]} "  # Print custom symbols in cycle
  done
  echo  # New line
done

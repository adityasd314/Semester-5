#!/bin/bash

# Task 1: Trim Whitespace
echo "Task 1: Trim Whitespace"
string="   Hello, World!   "
echo "Original string: '$string'"
trimmed_string=$(echo "$string" | xargs)
echo "Trimmed string: '$trimmed_string'"
echo

# Task 2: Check if String Contains a Substring
echo "Task 2: Check if String Contains a Substring"
string="Hello, World!"
substring="World"
if [[ $string == *"$substring"* ]]; then
  echo "String contains '$substring'"
else
  echo "String does not contain '$substring'"
fi
echo

# Task 3: Split String by Delimiter
echo "Task 3: Split String by Delimiter"
string="apple,banana,cherry"
IFS=',' read -r -a array <<< "$string"
echo "Splitting string '$string' by delimiter ','"
for element in "${array[@]}"; do
  echo "$element"
done
echo

# Task 4: Compare Two Strings
echo "Task 4: Compare Two Strings"
string1="Hello"
string2="World"
if [ "$string1" = "$string2" ]; then
  echo "Strings are equal"
else
  echo "Strings are not equal"
fi
echo

# Task 5: Get Character at a Specific Position
echo "Task 5: Get Character at a Specific Position"
string="Hello, World!"
position=7
echo "Character at position $position: ${string:$position:1}"

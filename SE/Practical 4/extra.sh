#!/bin/bash


echo "Additional String Manipulation Tasks"

# ---------------------------------------------------------
# Task 1: Convert String to Uppercase
# ---------------------------------------------------------
echo "Task 1: Convert String to Uppercase"
string="Hello, World!"
uppercase_string=$(echo "$string" | tr '[:lower:]' '[:upper:]')
echo "Original string: '$string'"
echo "Uppercase string: '$uppercase_string'"
echo

# ---------------------------------------------------------
# Task 2: Convert String to Lowercase
# ---------------------------------------------------------
echo "Task 2: Convert String to Lowercase"
string="HELLO, WORLD!"
lowercase_string=$(echo "$string" | tr '[:upper:]' '[:lower:]')
echo "Original string: '$string'"
echo "Lowercase string: '$lowercase_string'"
echo

# ---------------------------------------------------------
# Task 3: Remove All Digits from a String
# ---------------------------------------------------------
echo "Task 3: Remove All Digits from a String"
string="Hello123, World456!"
string_no_digits=$(echo "$string" | tr -d '0-9')
echo "Original string: '$string'"
echo "String without digits: '$string_no_digits'"
echo

# ---------------------------------------------------------
# Task 4: Reverse a String
# ---------------------------------------------------------
echo "Task 4: Reverse a String"
string="Hello, World!"
reversed_string=$(echo "$string" | rev)
echo "Original string: '$string'"
echo "Reversed string: '$reversed_string'"
echo

# ---------------------------------------------------------
# Task 5: Count Occurrences of a Substring
# ---------------------------------------------------------
echo "Task 5: Count Occurrences of a Substring"
string="Hello, World! Hello again!"
substring="Hello"
count=$(echo "$string" | grep -o "$substring" | wc -l)
echo "String: '$string'"
echo "Occurrences of '$substring': $count"

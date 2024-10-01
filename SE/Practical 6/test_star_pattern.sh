#!/bin/bash
# test_star_pattern.sh
# Conformance test for the star pattern script

# Function to test the star pattern output
run_test() {
  expected_output="$1"
  input="$2"

  # Capture the output of the star_pattern script
  output=$(./star_pattern.sh "$input" 2>&1)

  # Compare the output with the expected output
  if [ "$output" == "$expected_output" ]; then
    echo "Test passed for input '$input'."
  else
    echo "Test failed for input '$input'."
    echo "Expected:"
    echo "$expected_output"
    echo "Got:"
    echo "$output"
  fi
}

# Test cases

# Test case for 1 row
run_test "$(printf "* \n")" 1

# Test case for 2 rows
run_test "$(printf "* \n* * \n")" 2

# Test case for 3 rows
run_test "$(printf "* \n* * \n* * * \n")" 3

# Test case for 4 rows
run_test "$(printf "* \n* * \n* * * \n* * * * \n")" 4

# Additional tests for edge cases

# Test case for 0 rows (should produce no output)
run_test "" 0

# Test case for non-numeric input (should return an error)
run_test "Error: Input must be a positive integer." "abc"

# Test case for negative input (should return an error)
run_test "Error: Input must be a positive integer." -3

#!/bin/bash
# test_calculator.sh
# Test conformance for calculator.sh

# Function to run a single test case
run_test() {
  expected_output="$1"
  num1="$2"
  operation="$3"
  num2="$4"

  # Capture the output of the calculator script
  output=$(./calculator.sh "$num1" "$operation" "$num2" 2>&1)

  # Compare the output with the expected output
  if [ "$output" == "$expected_output" ]; then
    echo "Test passed: $num1 $operation $num2"
  else
    echo "Test failed: $num1 $operation $num2"
    echo "Expected: $expected_output"
    echo "Got: $output"
  fi
}

# Test cases

# Addition
run_test "Result: 7" 3 + 4

# Subtraction
run_test "Result: 1" 5 - 4

# Multiplication
run_test "Result: 12" 3 \* 4

# Division
run_test "Result: 2.50" 5 / 2

# Division by zero
run_test "Error: Division by zero is not allowed." 5 / 0

# Invalid operation
run_test "Error: Unsupported operation. Use +, -, *, or /." 5 ^ 3

# Non-numeric input
run_test "Error: Inputs must be numbers." 5 + abc

# Test with negative numbers
run_test "Result: -6" -2 \* 3

# Test with decimal numbers
run_test "Result: 5.5" 2.5 + 3

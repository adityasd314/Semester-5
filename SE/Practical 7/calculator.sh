#!/bin/bash
# calculator.sh
# Usage: ./calculator.sh <number1> <operation> <number2>

# Check if exactly three arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <number1> <operation> <number2>"
    exit 1
fi

# Assign command-line arguments to variables
num1=$1
operation=$2
num2=$3

# Ensure num1 and num2 are valid numbers (integer or floating-point)
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ && "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Inputs must be numbers."
    exit 1
fi

# Perform the arithmetic operation using case and awk for floating-point calculations
case "$operation" in
    +)
        result=$(awk "BEGIN {print $num1 + $num2}")
        ;;
    -)
        result=$(awk "BEGIN {print $num1 - $num2}")
        ;;
    \*)
        result=$(awk "BEGIN {print $num1 * $num2}")
        ;;
    /)
        if [ "$num2" == "0" ]; then
            echo "Error: Division by zero is not allowed."
            exit 1
        fi
        result=$(awk "BEGIN {print $num1 / $num2}")
        ;;
    *)
        echo "Error: Unsupported operation. Use +, -, *, or /."
        exit 1
        ;;
esac

# Display the result
echo "Result: $result"

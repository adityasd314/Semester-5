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

# Ensure num1 and num2 are numbers
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ && "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Inputs must be numbers."
    exit 1
fi

# Perform the arithmetic operation using case
case "$operation" in
    +)
        result=$(echo "$num1 + $num2" | bc)
        ;;
    -)
        result=$(echo "$num1 - $num2" | bc)
        ;;
    \*)
        result=$(echo "$num1 * $num2" | bc)
        ;;
    /)
        if [ "$num2" == "0" ]; then
            echo "Error: Division by zero is not allowed."
            exit 1
        fi
        result=$(echo "scale=2; $num1 / $num2" | bc)
        ;;
    *)
        echo "Error: Unsupported operation. Use +, -, *, or /."
        exit 1
        ;;
esac

# Display the result
echo "Result: $result"


#!/bin/bash

echo "Enter the first number:"
read num1

echo "Enter the second number:"
read num2
function operation(){
    
echo "Enter the operation (+, -, *, /):"
read op

case $op in
    +)
        result=$((num1 + num2))
        echo "The result of $num1 + $num2 is $result"
        ;;
    -)
        result=$((num1 - num2))
        echo "The result of $num1 - $num2 is $result"
        ;;
    \*)
        result=$((num1 * num2))
        echo "The result of $num1 * $num2 is $result"
        ;;
    /)
        if [ $num2 -ne 0 ]; then
            result=$((num1 / num2))
            echo "The result of $num1 / $num2 is $result"
        else
            echo "Division by zero is not allowed"
        fi
        ;;
    *)
        echo "Invalid operation"
        ;;
esac

}
while true 
do
    operation
    echo "Do you want to perform another operation? (y/n)"
    read choice
    if [ $choice != "y" ]; then
        break
    fi
    echo "Enter the first number:"
    read num1

    echo "Enter the second number:"
    read num2
done

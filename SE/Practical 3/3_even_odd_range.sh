#!/bin/bash

echo "Enter the start of the range:"
read start

echo "Enter the end of the range:"
read end

echo "Even numbers between $start and $end are:"
for (( num=$start; num<=$end; num++ ))
do
    if [ $((num % 2)) -eq 0 ]; then
        echo -n "$num "
    fi
done

echo ""

echo "Odd numbers between $start and $end are:"
for (( num=$start; num<=$end; num++ ))
do
    if [ $((num % 2)) -ne 0 ]; then
        echo -n "$num "
    fi
done

echo ""

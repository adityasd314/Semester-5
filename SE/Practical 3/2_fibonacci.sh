#!/bin/bash
fibonacci(){
    echo -n "Enter the number of terms:"
    read n
    if [ $n -le 0 ]; then
        echo "Invalid input"
        exit 1
    fi
    if [ $n -eq 1 ]; then
        echo "The Fibonacci series is: 0"
        exit 0
    fi
    a=0
    b=1
    echo "The Fibonacci series is:"
    echo -n "$a $b "
    for (( i=3; i<=n; i++ ))
    do
        c=$((a + b))
        echo -n "$c "
        a=$b
        b=$c
    done
    echo ""
}

fibonacci

factorial() {
    num=$1
    fact=1
    while [ $num -gt 0 ]
    do
        fact=$((fact * num))
        num=$((num - 1))
    done
    echo $fact
}

echo "Enter the first number:"
read num1

echo "Enter the second number:"
read num2

fact1=$(factorial $num1)
fact2=$(factorial $num2)

echo "Factorial of $num1 is $fact1"
echo "Factorial of $num2 is $fact2"

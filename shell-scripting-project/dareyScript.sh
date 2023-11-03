#!/bin/bash

# Variable assignment

# NAME="Chris"

# echo "My name is $NAME"

# if-else statement
# script to check if a number is negative, zero or positive

# read -p "Enter a number: " num

# if [ $num -gt 0 ]; then
#     echo "The number is positive"
# elif [ $num -lt 0 ]; then 
#     echo "The number is negative"
# else
#     echo "The number is zero"
# fi

# FOR LOOP
# Print numbers from 1 to 5 using for loop

# for (( i=1; i<=5; i++))
# do
#     echo $i
# done

# FUNCTIONS
# Define a function to greet users

function greet() {
    echo "Hello $1, Welcome to $2"
}
greet "Chris" "Darey"
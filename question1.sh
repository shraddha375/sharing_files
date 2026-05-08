#!/bin/bash

# displays date and time
#echo $(date)

#displays who is the user
#who
#echo $USER

#echo displays the home directory
#echo ~
#echo $HOME

#present working directory
#pwd

#lists all the names of files in a directory without using ls
#for i in *
#do
#echo $i
#done

#functions in linux
#add_number(){
#    sum=$(($1 + $2))
#    echo $sum
#}

#read num1
#addNumber1=$(add_number 2 3)
#addNumber2=$(add_number 2 $num1)
#echo "$addNumber1"
#echo $addNumber2

# to check if a file_name in string is a valid file or directory

#echo "Enter a valid filename:"
#read $filename

#if [ -f $filename ]; then
#    echo "Its a valid file"
#else
#    echo "No its not"
#fi

#if [ -d $filename ]; then
#    echo "Its a valid file"
#else
#    echo "No its not"
#fi

# to check if a number is odd or even

#oddEven(){
#    if (( $1 % 2 == 0 )); then
#        echo "Even"
#    else
#        echo "Odd"
#    fi
#}

#read num
#echo "$(oddEven $num)"

# to know if a user is the root

#if [ $USER = "root" ]; then
#    echo "Yes its root"
#else
#    echo "No its not"
#fi

# to find max number out of three

#maxNumbers(){
#    if (( $1 > $2 && $1 > $3 )); then
#        echo "$1 is the highest"
#    elif (( $2 > $1 && $2 > $3 )); then
#        echo "$2 is the highest"
#    else
#        echo "$3 is the highest"
#    fi
#}

#read num1
#read num2
#read num3

#echo $(maxNumbers $num1 $num2 $num3)

# create a folder and store files in that folder

#folder_dir="./toCopy"

#if [ -d $folder_dir ]; then
#    rm -rf $folder_dir
#fi

#mkdir $folder_dir
#cp *.txt $folder_dir

# count the number of files in a folder

#count=0
#for i in *; do
#    count=$((count + 1))
#done

#echo $count

# service status of sshd

#systemctl status ssh
#systemctl start ssh
#systemctl restart ssh

# use of case statement

#case $choice in
#    1) echo $(date);;
#    2) pwd;;
#    3) ls -l;;
#    *) echo "Exiting program...."
#esac

# find all .txt files

#find . -name "*.txt"
#find /home -user alice

# to compare userid and passwd

#read user_id
#read -s password

#if [ $user_id = "star" ]; then
#    if [[ $user_id = "star" && $password = "1234" ]]; then
#        echo "passed match"
#    else
#        echo "passwd dont match"
#    fi
#fi

#lscpu
#free -h
#df -h
#uptime
#users

# paramters passed and count

#for i in "$@"; do
#    echo $i
#done

#echo $#

# add numbers \
#read n
#sum=0
#for (( i = 1; i <= n; i++ )); do
#    (( sum += i ))
#done

#echo $sum

#si=$(($p * $r * $t ))

# reverse string

#read str

#reversed=""
#len=${#str}

#for (( i = $len - 1; i >= 0; i-- )); do
#    reversed="$reversed${str:$i:1}"
#done

#echo $reversed

# Arithmetic
num1=5
num2=10
sum=$(($num1 + $num2))
echo "The sum is $sum"

# String example
greeting="Hello, World!"
name="Alice"
full_greeting="$greeting, $name!"
echo $full_greeting

# Array example
fruits=("apple" "banana" "cherry")
for fruit in "${fruits[@]}"; do
    echo $fruit
done

# Associative array example
declare -A colors
colors[apple]="red"
colors[banana]="yellow"
colors[grape]="purple"
unset colors[banana]
echo ${colors[apple]}  # red
echo ${colors[grape]}  # purple

# Basic if statement
num=15
if [ $num -gt 10 ]; then
    echo "Number is greater than 10"
fi

# IF...elif...else statement
num=10
if [ $num -gt 10 ]; then
    echo "Number is greater than 10"
elif [ $num -eq 10 ]; then
    echo "Number is exactly 10"
else
    echo "Number is less than 10"
fi

# Nested if statement
num=5
if [ $num -gt 0 ]; then
    if [ $num -lt 10 ]; then
        echo "Number is between 1 and 9"
    fi
fi

# For loop example
for i in {1..5}; do
    echo "Iteration $i"
done

# While loop example
count=1
while [ $count -le 5 ]; do
    echo "Count is $count"
    ((count++))
done

# Until loop example
count=1
until [ $count -gt 5 ]; do
    echo "Count is $count"
    ((count++))
done

# Break and continue example
for i in {1..5}; do
    if [ $i -eq 3 ]; then
        continue
    fi
    echo "Number $i"
    if [ $i -eq 4 ]; then
        break
    fi
done

add() {
    local sum=$(($1 + $2))
    echo $sum
}

result=$(add 5 3)
echo "The sum is $result"

my_array=("value1" "value2" "value3")
echo ${my_array[0]}
echo ${my_array[1]}
my_array[1]="new_value"


#!/bin/bash


USERID=$(id -u)
#echo "Your user ID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run the script with root privileges"
fi
dnf install git -y
echo "starting installation..."



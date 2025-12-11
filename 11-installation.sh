#!/bin/bash

sudo ./11-installation.sh

USERID=$(id -u)
#echo "Your user ID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run the script with root privileges."
    exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it now.."
    dnf install git -y
    echo "Git installation completed."
else
    echo "Git is already installed."
fi



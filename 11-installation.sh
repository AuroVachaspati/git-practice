#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"


if [ $USERID -ne 0 ]
then
    echo "Please run this script with root priveleges"
    exit 1
fi



dnf list installed git # Just checking whether installed or not

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y # here installing

    if [ $? -ne 0 ]
    then
        echo "Git installation is not success...check it"
        exit 1
    else
        echo "Git installation is success"
    fi

else
    echo "Git is already installed, nothing to do.."
fi




#Check whether git is the latest version
installed=$(git --version 2>/dev/null | awk '{print $3}')
repo=$(dnf info git 2>/dev/null | awk '/Version/ {print $3}')

echo "Installed Git : ${installed:-none}"
echo "Repo Git      : $repo"
echo

# If not installed
if [ -z "$installed" ]; then
    echo "Git is not installed. Installing..."
    sudo dnf install -y git
    exit 0
fi

# If versions differ → update
if [ "$installed" != "$repo" ]; then
    echo "Updating Git..."
    sudo dnf update -y git
    echo "Updated Git to: $(git --version | awk '{print $3}')"
else
    echo "Git is already up to date."
fi

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
    echo "Git is already installed, will check for latest version"
fi



echo "Checking Git status..."
echo

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing..."
    sudo dnf install -y git
    exit 0
fi

# Show current version
current_version=$(git --version)
echo "Current: $current_version"

# Check for updates (dnf check-update returns 0 if no updates, 100 if updates available)
if sudo dnf check-update git &> /dev/null; then
    echo "Git is already up to date."
else
    echo "Update available. Updating Git..."
    sudo dnf update -y git
    echo
    echo "Updated: $(git --version)"
fi

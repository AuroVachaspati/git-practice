#!/bin/bash

NUMBER=$1
if [ $NUMBER -gt 20]
then
    echo "The $NUMBER you gave is greater than 20"
else
    echo "The $NUMBER you gave is lessthan 20"
fi
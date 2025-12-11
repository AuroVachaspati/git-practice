#!/bin/bash
 

echo "all the variables passed to the script: $@"

echo "number of variables passed to the script: $#"

echo "name of the your script: $0"
echo "script's process id is: $$"
echo "current working directory is: $PWD"
echo "Home diretory of the current use is : $HOME"
sleep 100 & 
echo "process id of the last background command is: $!"

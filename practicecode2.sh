#!/bin/bash

echo "Has the student written the exam (yes/no)? :" 
read exam_written

#LEVEL1 - Check if the student wrote the exam
if [ $exam_written = "yes" ]
then
    echo "Student has written the exam. Thanks"
    echo "Please enter the marks secured :"
    read marks

#LEVEL2 - Check whether the student has passed the exam
    if [ $marks -gt 33 ]
    then 
        echo "You have passed the exam!"
        #LEVEL3 - Check whether the student has passed the exam with distinction
        if [ $marks -gt 70 ]
        then 
            echo "You have passed the exam in distinction"
        else
            echo "Distinction is between 70-90"
            if [ $marks -gt 90 ]
            then 
                echo "Congratulations! You have passed the exam in first class"
            else
                echo "Great, Try to get first class, you have already passed in distinction"
            fi
            #LEVEL4 END
        fi
        #LEVEL2 END
    else
        echo "You have not passed the exam, please check"
    fi
    #LEVEL2 END
else
    echo "Student has not attended the exam, please see"
fi
#LEVEL1 END
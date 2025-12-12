#!/bin/bash

echo "Has the student written the exam (yes/no)? :" 
read exam_written

#LEVEL1 - Check if the student wrote the exam
if [ "$exam_written" = "yes" ]
then
    echo "Student has written the exam. Thanks"
    echo "Please enter the marks secured :"
    read marks

    #LEVEL2 - Check whether the student has passed the exam
    if [ "$marks" -gt 33 ]
    then 
        echo "You have passed the exam!"

        #LEVEL3 - Check for First Class (>90)
        if [ "$marks" -gt 90 ]
        then 
            echo "Congratulations! FIRST CLASS with $marks marks! 🏆"
            
            #LEVEL4 - Check for Outstanding (>95)
            if [ "$marks" -gt 95 ]
            then
                echo "OUTSTANDING! You're a top scorer!"
            else
                echo "Excellent work! Keep it up!"
            fi
            #LEVEL4 END
            
        #LEVEL3 - Check for Distinction (>70)
        elif [ "$marks" -gt 70 ]
        then
            echo "You have passed the exam with DISTINCTION!"
        else
            echo "You passed! Good job!"
        fi
        #LEVEL3 END
        
    else
        echo "You have not passed the exam (need >33), please check"
    fi
    #LEVEL2 END
else
    echo "Student has not attended the exam, please see"
fi
#LEVEL1 END
#!/bin/bash

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}   STUDENT EXAM EVALUATION SYSTEM${NC}"
echo -e "${CYAN}========================================${NC}\n"

# Input: Has student written the exam?
echo -e "${BLUE}Has the student written the exam? (yes/no)${NC}"
read exam_written

# ┌─────────────────────────────────────────────────────────┐
# │ LEVEL 1: Check if exam was written                     │
# └─────────────────────────────────────────────────────────┘
if [ "$exam_written" = "yes" ]
then
    echo -e "\n${GREEN}✓ Student has written the exam.${NC}"
    
    # Get marks
    echo -e "\n${BLUE}Enter the marks obtained (0-100):${NC}"
    read marks
    
    # ┌─────────────────────────────────────────────────────┐
    # │ LEVEL 2: Check if passed (marks > 33)              │
    # └─────────────────────────────────────────────────────┘
    if [ $marks -gt 33 ]
    then
        echo -e "\n${GREEN}✓✓ Congratulations! Student has PASSED with $marks marks.${NC}"
        
        # ┌─────────────────────────────────────────────────┐
        # │ LEVEL 3: Check for Distinction (marks >= 75)   │
        # └─────────────────────────────────────────────────┘
        if [ $marks -ge 75 ]
        then
            echo -e "${YELLOW}✓✓✓ Excellent! Student scored DISTINCTION grade!${NC}"
            
            # ┌─────────────────────────────────────────────┐
            # │ LEVEL 4: Check for Outstanding (marks>=90) │
            # └─────────────────────────────────────────────┘
            if [ $marks -ge 90 ]
            then
                echo -e "${MAGENTA}✓✓✓✓ OUTSTANDING Performance! Top scorer! 🏆${NC}"
                echo -e "${MAGENTA}     Student qualifies for scholarship!${NC}"
            else
                echo -e "${YELLOW}     Marks range: 75-89 (Distinction)${NC}"
            fi
            # End of LEVEL 4
            
        else
            echo -e "${GREEN}     Grade: First Class (34-74 marks)${NC}"
        fi
        # End of LEVEL 3
        
    else
        echo -e "\n${RED}✗✗ Sorry, Student has FAILED with $marks marks.${NC}"
        echo -e "${RED}   Need more than 33 marks to pass.${NC}"
    fi
    # End of LEVEL 2
    
else
    echo -e "\n${RED}✗ Student has NOT written the exam yet.${NC}"
fi
# End of LEVEL 1

echo -e "\n${CYAN}========================================${NC}"
echo -e "${CYAN}   Evaluation Complete!${NC}"
echo -e "${CYAN}========================================${NC}"
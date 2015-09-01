#!/bin/bash

for d in */ ; do
    echo -e "\n\n\n\n============================== $d =============================="
    ../myhtml2txt < $d/test.in > $d/out.txt
    diff -c $d/out.txt $d/test.out >$d/diff.out 2>&1
    if [ $? -eq 0 ]
    then
        echo "$d Passed"
    else
        echo -e "$d Failed\n"
        cat $d/diff.out
    fi

done

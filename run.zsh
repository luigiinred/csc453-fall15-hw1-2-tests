#!/bin/bash

for d in */ ; do


    echo -e "\n============ $d ============"

    ../myhtml2txt < $d/test.in > $d/out.txt 2> $d/err.out
    exit_code=$?

    # I am expecting an error
    if [ -f $d/test.err ];
    then

      # I get an Error
      if [[ $exit_code -eq 1 ]]; then
        diff -c $d/err.out $d/test.err >$d/diff.out 2>&1
        if [ $? -eq 0 ]
        then
            echo "$d Passed"
        else
          echo -e "$d Failed\Errors do not match \ndiff.out:\n"
          cat $d/diff.out
          echo -e "\n"
        fi

      # I do not get an error
      else
        echo -e "$d Failed\nNo error when expected\nout.txt:\n"
              cat $d/out.txt

      fi

    # I am not expecting an error
    else
      # I get an Error
      if [[ $exit_code -eq 1 ]]; then
        echo -e "$d Failed\nUnexpected Error\nerr.out:\n"
        cat $d/err.out
        echo -e "\n"

      # I do not get an error
      else
        diff -c $d/out.txt $d/test.out >$d/diff.out 2>&1
          if [ $? -eq 0 ]
          then
              echo "$d Passed"
          else
              echo -e "$d Failed\nOutputs do not match \ndiff.out:\n"
              cat $d/diff.out
              echo -e "\n"
          fi
      fi
    fi

done

#!/bin/bash
                    fx= 'cat cloud.deployment | grep "env"'
                    for filename in ${fx}
                    do
                    fx1=`echo $filename | cut -f1 -d ','`
                    fx2=`echo $filename | cut -f2 -d ','`
                    fx3=`echo $filename | cut -f3 -d ','`
                    fx4=`echo $filename | cut -f4 -d ','`
                    done
                    
                    echo $fx1
                    echo $fx2
                    echo $fx3
                    echo $fx4

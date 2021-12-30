#!/bin/bash -x

echo "Welcome to Flip Coin Combination Problem"

coinFlip=$(( RANDOM%2 ));
Head=1;

 if [[ $coinFlip -eq $Head ]]
    then
        echo "It's Head"
    else
        echo "It's Tail"
 fi
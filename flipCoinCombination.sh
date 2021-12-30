#!/bin/bash -x

echo "Welcome to Flip Coin Combination Problem"

Head=1;
Limit=150;

hCount=0;
tCount=0;
totalCount=0;

declare -A result

while [ $totalCount -lt $Limit ]
 do
         coinFlip=$(( RANDOM%2 ));

        if [[ $coinFlip -eq $Head ]]
           then
                   let hCount++
           else
                  let tCount++
       fi
       let totalCount++
 done

   headPercentage=`echo $hCount $Limit | awk '{h=$1/$2*100} {print h}'`

   tailPercentage=`echo $tCount $Limit | awk '{t=$1/$2*100} {print t}'`

  result[h]=#headPercentage
  result[t]=$tailPercentage

   echo ${result[@]}

echo "Head percentage $headPercentage%"
echo "Tail percentage $tailPercentage%"
   
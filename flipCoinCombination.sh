#!/bin/bash -x

echo "Welcome to Flip Coin Combination Problem"

Head=1;
Limit=100;

hh=0;
ht=0;
th=0;
tt=0;
flag=0;

declare -A result

while [ $flag -lt $Limit ]
 do
         flip1=$(( RANDOM%2 ));
         flip2=$(( RANDOM%2 ));

        if [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ]
           then
                   let hh++
           elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ]
           then
                  let ht++
           elif [ $flip1 -eq 0 ] && [ $flip2 -eq 1 ]
           then
                  let th++
           else 
                  let tt++
       fi
       let flag++
 done

   hhPercentage=`echo $hh $Limit | awk '{hh=$1/$2*100} {print hh}'`
   htPercentage=`echo $ht $Limit | awk '{ht=$1/$2*100} {print ht}'`
   thPercentage=`echo $th $Limit | awk '{th=$1/$2*100} {print th}'`
   ttPercentage=`echo $tt $Limit | awk '{tt=$1/$2*100} {print tt}'`

  result[hh]=$hhPercentage
  result[ht]=$htPercentage
  result[th]=$thPercentage
  result[tt]=$ttPercentage

   echo ${result[@]}

echo "Combination of HH is $hhPercentage%"
echo "Combination of HT is  $htPercentage%"
echo "Combination of TH is $thPercentage%"
echo "Combination of TT is  $ttPercentage%"
   
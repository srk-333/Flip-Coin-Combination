#!/bin/bash -x

echo "Welcome to Flip Coin Combination Problem"

Head=1;
Limit=100;

hhh=0;
hht=0;
hth=0;
ttt=0;
tth=0;
tht=0;
flag=0;

declare -A result

while [ $flag -lt $Limit ]
 do
         flip1=$(( RANDOM%2 ));
         flip2=$(( RANDOM%2 ));
         flip3=$(( RANDOM%2 ));

        if [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 1 ]
           then
                   let hhh++

           elif [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 0 ]
           then
                  let hht++

           elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 1 ]
           then
                  let hth++

             elif [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 0 ]
           then
                  let ttt++

           elif [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 1 ]
           then
                  let tth++

           else 
                  let tht++
       fi
       let flag++
 done

   hhhPercentage=`echo $hhh $Limit | awk '{hhh=$1/$2*100} {print hhh}'`
   hhtPercentage=`echo $hht $Limit | awk '{hht=$1/$2*100} {print hht}'`
   hthPercentage=`echo $hth $Limit | awk '{hth=$1/$2*100} {print hth}'`
   tttPercentage=`echo $ttt $Limit | awk '{ttt=$1/$2*100} {print ttt}'`
   tthPercentage=`echo $tth $Limit | awk '{tth=$1/$2*100} {print tth}'`
   thtPercentage=`echo $tht $Limit | awk '{tht=$1/$2*100} {print tht}'`

  result[hhh]=$hhhPercentage
  result[hht]=$hhtPercentage
  result[hth]=$hthPercentage
  result[ttt]=$tttPercentage
  result[tth]=$tthPercentage
  result[tht]=$thtPercentage

   echo ${result[@]}

echo "Combination of HHH is $hhhPercentage%"
echo "Combination of HHT is  $hhtPercentage%"
echo "Combination of HTH is $hthPercentage%"
echo "Combination of TTT is  $tttPercentage%"
echo "Combination of TTH is  $tthPercentage%"
echo "Combination of THT is  $thtPercentage%"   
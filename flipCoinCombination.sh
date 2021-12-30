#!/bin/bash -x

echo "Welcome to Flip Coin Combination Problem"

Limit=100;

#Triplet Coin Flip

hhh=0;
hht=0;
hth=0;
ttt=0;
tth=0;
tht=0;
tp=0;

declare -A triplet

while [ $tp -lt $Limit ]
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
       let tp++
 done

   hhhPercentage=`echo $hhh $Limit | awk '{hhh=$1/$2*100} {print hhh}'`
   hhtPercentage=`echo $hht $Limit | awk '{hht=$1/$2*100} {print hht}'`
   hthPercentage=`echo $hth $Limit | awk '{hth=$1/$2*100} {print hth}'`
   tttPercentage=`echo $ttt $Limit | awk '{ttt=$1/$2*100} {print ttt}'`
   tthPercentage=`echo $tth $Limit | awk '{tth=$1/$2*100} {print tth}'`
   thtPercentage=`echo $tht $Limit | awk '{tht=$1/$2*100} {print tht}'`

  triplet[hhh]=$hhhPercentage
  triplet[hht]=$hhtPercentage
  triplet[hth]=$hthPercentage
  triplet[ttt]=$tttPercentage
  triplet[tth]=$tthPercentage
  triplet[tht]=$thtPercentage

   echo ${triplet[@]}

#soring Triplet Coin Flip in ascending order

VALUES=()
count=0;

for DATA in "${triplet[@]}"
  do
           VALUES+=("${DATA##*:}")
            let count++
  done

for (( i=0;i<count;i++ ))
 do
        arr[i]=${VALUES[i]}
 done

size=${#arr[@]}

function sortArray() {
            for (( i=0;i<size;i++ )) {
                   for ((j=i+1;j<size;j++ )) {
                         if [ ${arr[i]} -gt ${arr[j]} ]
                             then
                                     temp=${arr[i]}
                                     arr[i]=${arr[j]}
                                     arr[j]=$temp
                         fi
                    }
               }
           echo ${arr[@]}
}

sortArray ${arr[@]}

echo "Winning Combination of Triplet is " ${arr[5]}

#Doublet Coin Flip

hh=0;
ht=0;
th=0;
tt=0;
db=0;

declare -a doublet

while [ $db -lt $Limit ]
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
     let db++
done

   hhPercentage=`echo $hh $Limit | awk '{hh=$1/$2*100} {print hh}'`
   htPercentage=`echo $ht $Limit | awk '{ht=$1/$2*100} {print ht}'`
   thPercentage=`echo $th $Limit | awk '{th=$1/$2*100} {print th}'`
   ttPercentage=`echo $tt $Limit | awk '{tt=$1/$2*100} {print tt}'`

  doublet[hh]=$hhPercentage
  doublet[ht]=$htPercentage
  doublet[th]=$thPercentage
  doublet[tt]=$ttPercentage

   echo ${doublet[@]}

#sorting Doublet in ascending order

VALUES=()
count=0;

for DATA in "${doublet[@]}"
  do
           VALUES+=("${DATA##*:}")
            let count++
  done

for (( i=0;i<count;i++ ))
 do
        db[i]=${VALUES[i]}
 done

size=${#db[@]}

function sortArray() {
            for (( i=0;i<size;i++ )) {
                   for ((j=i+1;j<size;j++ )) {
                         if [ ${db[i]} -gt ${db[j]} ]
                             then
                                     temp=${db[i]}
                                     db[i]=${db[j]}
                                     db[j]=$temp
                         fi
                    }
               }
           echo ${db[@]}
}

sortArray ${db[@]}

echo "Winning Combination of Doublet is " ${db[3]}

### Singlet Coin Flip

head=1;
tail=0;

hCount=0;
tCount=0;
sg=0;

declare -A singlet

while [ $sg -lt $Limit ]
  do
         flip1=$(( RANDOM%2 ));

        if [ $flip1 -eq $head ]
           then
              let  hCount++
           else
              let tCount++
        fi
         let sg++
 done

   headPercentage=`echo $hCount $Limit | awk '{h=$1/$2*100} {print h}'`
   tailPercentage=`echo $tCount $Limit | awk '{t=$1/$2*100} {print t}'`

  singlet[h]=$headPercentage
  singlet[t]=$tailPercentage

   echo ${singlet[@]}

#Sorting Singlet in Ascending order

VALUES=()
count=0;

for DATA in "${singlet[@]}"
  do
           VALUES+=("${DATA##*:}")
            let count++
  done

for (( i=0;i<count;i++ ))
 do
        sarr[i]=${VALUES[i]}
 done

size=${#sarr[@]}

function sortArray() {
            for (( i=0;i<size;i++ )) {
                   for ((j=i+1;j<size;j++ )) {
                         if [ ${sarr[i]} -gt ${sarr[j]} ]
                             then
                                     temp=${sarr[i]}
                                     sarr[i]=${sarr[j]}
                                     sarr[j]=$temp
                         fi
                    }
               }
           echo ${sarr[@]}
}

sortArray ${sarr[@]}

echo "Winning Combination of Singlet is " ${sarr[1]}

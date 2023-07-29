#!/bin/bash

num1=$1
num2=$2

# TODO: 入力値のテストを行う(自然数じゃないケースなど)

getCommon() {
  arr=()
  for i in `seq $1 -1 1`
  do
    if [ $(( $1 % $i )) = 0 ]; then
      arr+=($i)
    fi
  done

  echo ${arr[@]}
}

common1=$(getCommon $num1)
common2=$(getCommon $num2)

for c1 in $common1
do
  for c2 in $common2
  do
   if [ $c1 = $c2 ]; then
     echo $c1
     exit 0
   fi
  done
done

exit 1
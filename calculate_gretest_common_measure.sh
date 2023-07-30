#!/bin/bash

num1=$1
num2=$2

# TODO: 入力値のテストを行う(自然数じゃないケースなど)

get_common_measure() {
  arr=()
  for i in `seq $1 -1 1`
  do
    if [ $(( $1 % $i )) = 0 ]; then
      arr+=($i)
    fi
  done

  echo ${arr[@]}
}

validate_args_count() {
  if [ $1 -lt 2 ]; then
   echo "too few argument exptected: 2, found: $1" >&2
   exit 1
  fi

  if [ $1 -gt 2 ]; then
   echo "too many argument exptected: 2, found: $1" >&2
   exit 1
  fi
}

validate_args_count $#


common1=$(get_common_measure $1)
common2=$(get_common_measure $2)

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

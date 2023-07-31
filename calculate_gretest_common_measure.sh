#!/bin/bash

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

validate_args_type() {
  if [[ ! $1 =~ ^[0-9]+$ ]] ||  [[ ! $2 =~ ^[0-9]+$  ]]; then
    echo 'type is invalid. please input natural number' >&2
    exit 1
  fi
}

validate_arg_size() {
  # サイズが大きすぎると計算量が増えるので、int型に絞る
  max_int=2147483647
  if [ $1 -gt $max_int ] || [ $2 -gt $max_int ]; then
    echo 'invalid int size.'
    exit 1
  fi
}

validate_args_count $#
validate_args_type $1 $2
validate_arg_size $1 $2

for num1 in `seq $1 -1 1`
do
  if [ $(( $1 % $num1 )) != 0 ]; then
    continue
  fi

  for num2 in `seq $2 -1 1`
  do
    if [ $(( $2 % $num2 )) != 0 ]; then
      continue
    fi
    
    if [ $num1 = $num2 ]; then
      echo $num1
      exit 0
    fi
  done
done

echo 'unexptected error'
exit 1


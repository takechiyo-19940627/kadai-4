#!/bin/bash

echo === テストを実行します ===

echo ===引数が1つもないケース ===
./calculate_gretest_common_measure.sh && echo "error: this case must be fails" >&2 && exit 1

echo === 引数が自然数かつ1つだけ渡されている場合 ===
./calculate_gretest_common_measure.sh 1  && echo "error: this case must be fails" >&2 && exit 1

echo === 引数が自然数かつ3つ渡されている場合 ===
./calculate_gretest_common_measure.sh 1 2 3 && echo "error: this case must be fails" >&2 && exit 1

echo === 引数が自然数であるが、コンマで区切っている場合 ===
./calculate_gretest_common_measure.sh 1,000 100 && echo "error: this case must be fails" >&2 && exit 1

echo === 引数が文字列の場合 ===
./calculate_gretest_common_measure.sh 数字 数字 && echo "error: this case must be fails" >&2 && exit 1

echo === 引数が負の整数の場合 ===
./calculate_gretest_common_measure.sh -10 -2 && echo "error: this case must be fails" >&2 && exit 1

echo === 引数が小数の場合 ===
./calculate_gretest_common_measure.sh 0.4 0.8 && echo "error: this case must be fails" >&2 && exit 1

echo === 入力された2つの自然数にのうちいずれかがBigIntの場合 ===
./calculate_gretest_common_measure.sh 21474836470000 2147483647 && echo "error: this case must be fails" >&2 && exit 1

echo === 成功するケース ===
result=$(./calculate_gretest_common_measure.sh 24 32)
if [ "$?" != 0 ]; then
  echo "unexpected error" >&2
  exit 1
fi
if [ $result != 8 ]; then
  echo "unexpected error expected: 4 result: $result" >&2
  exit 1
fi
echo "最大公約数: $result"

echo === テストが完了しました ===

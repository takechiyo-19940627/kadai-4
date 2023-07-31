#!/bin/bash
error_exit() {
  echo $1 >&2
  exit 1
}

echo === テストを実行します ===

echo ===引数が1つもないケース ===
./calculate_gretest_common_measure.sh && error_exit "error: this case must be fails"

echo === 引数が自然数かつ1つだけ渡されている場合 ===
./calculate_gretest_common_measure.sh 1  && error_exit "error: this case must be fails"

echo === 引数が自然数かつ3つ渡されている場合 ===
./calculate_gretest_common_measure.sh 1 2 3 && error_exit "error: this case must be fails"

echo === 引数が自然数であるが、コンマで区切っている場合 ===
./calculate_gretest_common_measure.sh 1,000 100 && error_exit "error: this case must be fails"

echo === 引数が文字列の場合 ===
./calculate_gretest_common_measure.sh 数字 数字 && error_exit "error: this case must be fails"

echo === 引数が負の整数の場合 ===
./calculate_gretest_common_measure.sh -10 -2 && error_exit "error: this case must be fails"

echo === 引数が小数の場合 ===
./calculate_gretest_common_measure.sh 0.1 0.1 && error_exit "error: this case must be fails"

echo === 入力された2つの自然数にのうちいずれかがBigIntの場合 ===
./calculate_gretest_common_measure.sh 21474836470000 2147483647 && error_exit "error: this case must be fails"

echo === 最大公約数8を返すケース ===
result=$(./calculate_gretest_common_measure.sh 24 32)
if [ "$result" != 8 ]; then
  error_exit "error: unexpected result"
else
  echo "success: $result"
fi

echo === 最大公約数1を返すケース ===
result=$(./calculate_gretest_common_measure.sh 15 13)
if [ "$result" != 1 ]; then
  error_exit "error: unexpected result"
else
  echo "success: $result"
fi

echo === テストが正常に完了しました ===

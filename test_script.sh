#!/bin/bash

echo === テストを実行します ===

echo 引数が1つもないケース ===

./calculate_gretest_common_measure.sh
echo

echo === 引数が自然数かつ1つだけ渡されている場合 ===
./calculate_gretest_common_measure.sh 1
echo

echo === 引数が自然数かつ3つ渡されている場合 ===
./calculate_gretest_common_measure.sh 1 2 3
echo

echo === 引数が自然数であるが、コンマで区切っている場合 ===
./calculate_gretest_common_measure.sh 1,000 100
echo

echo === 引数が文字列の場合 ===
./calculate_gretest_common_measure.sh 数字 数字
echo

echo === 引数が負の整数の場合 ===
./calculate_gretest_common_measure.sh -10 -2
echo

echo === 引数が小数の場合 ===
./calculate_gretest_common_measure.sh 0.4 0.8
echo

echo === 入力された2つの自然数にのうちいずれかがBigIntの場合 ===
./calculate_gretest_common_measure.sh 21474836470000 2147483647
echo

echo === 成功するケース ===
./calculate_gretest_common_measure.sh 2488132 6444
echo

echo === テストが完了しました ===


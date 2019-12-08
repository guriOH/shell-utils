#!/bin/bash

echo "================Basic 종료/종료 상태==================="
echo hello
echo "결과 : " $? "(\$? 마지막 명령어 성공시 0)"
# $? 마지막 명령어 성공시 0
wrongcommand
echo "결과 : " $?

true
echo "\"true\"의 종료 상태 = $?"     # 0

! true  # "!"을 쓸 때, 빈 칸
echo "\"! true\"의 종료 상태 = $?"   # 1

echo "=======================특수문자======================"
echo "\",\',\\ 문자들은 \# 을 이스케이프 합니다."
echo "진법변환, 매개변수 치환에 사용되는 \#는 주석용도가 아님"

echo ${PATH#*:}
echo $(( 2#101011 ))

echo ";는 한줄에 명령어를 더 쓸수 있게합니다."
echo hello; echo there

echo "variable=abc"
variable="abc"
case "$variable" in
abc)  echo "$variable = abc" ;;
xyz)  echo "$variable = xyz" ;;
esac


let "t2 = ((a = 9, 15 / 3))"  # "a"를 세트하고 "t2"를 계산.

echo ${t2} ${a}


echo "===================명령어 치환(command substitution). [백틱(backticks)]============="
echo "\`명령어\` 를 하면 명령의 결과를 변후에 저장 할 수 있다."


echo "========================변수 치환=========================="

variable1="1"
variable2=10
variable3="zxcasd"
echo $variable1
echo $variable2
echo $variable3

echo "========================명령어 그룹 :()=========================="
(a=hello; echo $a)


echo "========================파이프 :|=========================="

echo ls -l | sh
#  "echo ls -l" 의 출력을 쉘에게 전달하는데,
#+ 그냥 "ls -l" 라고 한 것과 똑같습니다.


echo "=======================백그라운드 실행 : & ========================="
sleep 10 &
#스크립트에서 어떤 명령어를 백그라운드로 돌리게 되면 키가 눌리길 기다리면서 스크립트가 멈춰버립니다. 다행스럽게도 이런 상황을 피해 갈 수 있는 방법이 있습니다.

echo "=======================변수 타입 ======================"

a=2334                   # 정수.
let "a += 1"
echo "a = $a "           # 여전히 정수죠.
echo

b=${a/23/BB}             # 문자열로 변환.
echo "b = $b"            # BB35
declare -i b             # 정수로 선언해도 도움이 되질 않죠.
echo "b = $b"            # 여전히 BB35.

let "b += 1"             # BB35 + 1 =
echo "b = $b"            # 1
echo

c=BB34
echo "c = $c"            # BB34
d=${c/BB/23}             # 정수로 변환.
echo "d = $d"            # 2334
let "d += 1"             # 2334 + 1 =
echo "d = $d"            # 2335

# Bash 의 변수는 본질적으로 타입이 없습니다(untyped).

exit 0
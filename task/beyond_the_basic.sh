#!/bin/bash


echo "=========================변수 재검토(Variables Revisited)====================="
echo "----내부 변수(Internal Variables)"

for n in 0 1 2 3 4 5
do
  echo "BASH_VERSINFO[$n] = ${BASH_VERSINFO[$n]}"
done

# BASH_VERSINFO[0] = 2                      # Major version no.
# BASH_VERSINFO[1] = 04                     # Minor version no.
# BASH_VERSINFO[2] = 21                     # Patch level.
# BASH_VERSINFO[3] = 1                      # Build version.
# BASH_VERSINFO[4] = release                # Release status.
# BASH_VERSINFO[5] = i386-redhat-linux-gnu  # Architecture
                                            # ($MACHTYPE 과 동일).

xyz23 ()
{
  echo "$FUNCNAME now executing."  # xyz23 now executing.
}

xyz23

echo "FUNCNAME = $FUNCNAME"        # FUNCNAME =
                                   # 함수 밖에서는 널 값을 갖습니다.



echo;echo;echo 입력 필드 구분자

output_args_one_per_line()
{
  for arg
  do echo "[$arg]"
  done
}

echo; echo "IFS=\" \""
echo "-------"



echo;echo;echo 문자열조작;


stringZ=abcABC123ABCabc

echo ${#stringZ}                 # 15
echo `expr "$stringZ" : '.*'`    # 15



stringZ=abcABC123ABCabc
#       |------|

echo `expr "$stringZ" : 'abc[A-Z]*.2'`       # 8

stringZ=abcABC123ABCabc
echo `expr index '$stringZ' 'C12'`             # 6
                                             # C 의 위치.

echo `expr index "$stringZ" 1c`              # 3
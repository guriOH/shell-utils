#!/bin/bash

path=$1
logPath=$2

echo "PATH : " ${path}
echo "LOG_PATH : " ${logPath}

#find . -name "*txt" -type f -exec ls -l {} \;
# shellcheck disable=SC2045
function get_result_func () {
	fileList=`find ${1} -name "*txt" -type f`
	echo "${fileList}"
}
#
#if [ -f `ls $logPath`]
#then
#  echo "Not exist"
#else
#  `mkdir $logPath`
#fi

logFName="history_"$(date '+%Y-%m-%d').txt

fileList=`get_result_func ${path}`;
echo > $logPath/${logFName}

for FILE in $fileList
do
        let I=I+1
        echo `rm $FILE`
        echo "$I) $FILE" >> $logPath/${logFName}
done


#!/bin/bash
mkdir ~/Desktop/recondata/$1/headers
mkdir ~/Desktop/recondata/$1/responsebody


for x in $(cat ~/Desktop/recondata/$1/alive.txt)
do
        NAME=$(echo $x | awk -F/ '{print $3}')
	touch ~/Desktop/recondata/$1/headers/$NAME
        curl -X GET -H "X-Forwarded-For: evil.com" $x -I >  ~/Desktop/recondata/$1/headers/$NAME
	touch ~/Desktop/recondata/$1/responsebody/$NAME
        curl -s -X GET -H "X-Forwarded-For: evil.com" -L $x > ~/Desktop/recondata/$1/responsebody/$NAME
done

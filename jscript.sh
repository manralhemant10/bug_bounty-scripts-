#!/bin/bash
mkdir ~/Desktop/recondata/$1/scripts
mkdir ~/Desktop/recondata/$1/scriptsresponse

RED='\033[0;31m'
NC='\033[0m'


for x in $(ls ~/Desktop/recondata/$1/responsebody)
do
        printf "\n\n${RED}$x${NC}\n\n"
        END_POINTS=$(cat ~/Desktop/recondata/$1/responsebody/$x | grep -Eoi "src=\"[^>]+></script>" | cut -d '"' -f 2)
       
	 for end_point in $END_POINTS
         do
                len=$(echo $end_point | grep "http" | wc -c)
                mkdir ~/Desktop/recondata/$1/scriptsresponse/$x/
                URL=$end_point
                if [ $len == 0 ]
                then
                        URL="https://$x$end_point"
                fi
                file=$(basename $end_point)
                curl -X GET $URL -L > ~/Desktop/recondata/$1/scriptsresponse/$x/$file
                echo $URL >> ~/Desktop/recondata/$1/scripts/$x
        done
done

#!/bin/bash
mkdir ~/Desktop/recondata/$1/nmapscans

for domain in $(cat ~/Desktop/recondata/$1/domains.txt)
do
        nmap -sC -sV $domain | tee nmapscans/$domain
done

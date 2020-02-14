#!/bin/bash

#looping through the scriptsresponse directory

mkdir ~/Desktop/recondata/$1/endpoints

for domain in $(ls ~/Desktop/recondata/$1/scriptsresponse)
do
        #looping through files in each domain
        mkdir ~/Desktop/recondata/$1/endpoints/$domain
        
	for file in $(ls ~/Desktop/recondata/$1/scriptsresponse/$domain)
        do
                ruby ~/tools/relative-url-extractor/extract.rb ~/Desktop/recondata/$1/scriptsresponse/$domain/$file >> ~/Desktop/recondata/$1/endpoints/$domain/$file 
        done
done

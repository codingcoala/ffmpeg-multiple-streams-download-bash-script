#!/bin/bash

#Read file with URLs to be downloaded
input="./urls.txt"

#Giving the files a serialized name
pre_string="Recording_Name"

count=1
while IFS= read -r line
do
new_fname="${pre_string}-${count}.mp4"
echo "Start downloading $new_fname"

#Download stream using ffmpeg package
ffmpeg -i "$line" -bsf:a aac_adtstoasc -vcodec copy -c copy -crf 50 "$new_fname"
echo "Finished downloading of $new_fname"
count=count+1
done < "$input"


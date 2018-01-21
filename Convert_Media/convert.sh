#!/bin/bash

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` m4v mp4"
  echo "Convert m4v to mp4"
  exit 0
fi

if [ -z "$1" ]
  then
    echo "No argument supplied. Supply file format that you would like to convert. "
    echo "Usage: ./convert.sh m4v mp4"
    exit 0
fi

if [ -z "$2" ]
  then
    echo "No argument supplied. Supply file format that you would like to convert to. "
    echo "Usage: ./convert.sh m4v mp4"
    exit 0
fi

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ffmpeg |grep "install ok installed")
echo Checking for ffmpeg $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No ffmpeg. Please install ffmpeg."
  # sudo apt-get install ffmpeg
fi

mkdir -v output
INPUT="*.$1"

for i in $INPUT;  
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -ss 00:00:05 -i "$i" -frames:v 1 "./output/$name.png"
  # strict 2 might fail with some installations of ffmpeg
  OUTPUT_NAME="./output/$name.$2";
  ffmpeg -i "$i" -strict -2 "$OUTPUT_NAME";
done  

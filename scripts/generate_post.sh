#!/bin/bash

CATEGORY=$1
FILENAME=$2
POSTFILENAMEDATE="$(date "+%Y-%m-%d")"
POSTFRONTMATTERDATE="$(date "+%Y-%m-%d %H:%M:%S" -u) +0900"
POSTFILENAME=$POSTFILENAMEDATE-$FILENAME.md
POSTLOCATION=../_posts/$CATEGORY/$POSTFILENAME

if [ "$1" = "help" ] || [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "" ];then
 echo "generate_post [category] [filename]"
 exit 1
fi 

if [ "$CATEGORY" = "" ];then
 echo category parameter is emtpy
 exit 1
elif [ "$FILENAME" = "" ];then
 echo filename parameter is empty
 exit 1
fi

if [ -e "$POSTLOCATION" ];then
 echo post filename "$POSTFILENAME" already exists
 exit 1
fi

echo "post name '$POSTFILENAME' will be created on category '$CATEGORY'"
#echo $POSTFILENAMEDATE
#echo $POSTFRONTMATTERDATE

sed -i "s/date:.*/date: $POSTFRONTMATTERDATE/" ./post_templates/default.md

cp post_templates/default.md ../_posts/$CATEGORY/$POSTFILENAME

ls -l ../_posts/$CATEGORY

exit 0

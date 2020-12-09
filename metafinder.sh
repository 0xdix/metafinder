#!/bin/bash
if [ "$1" == "" ]
then
	echo "########### LIL DIX - GHDB SCRIPT ###########"
	echo "- - - - - -  - - -  - - - - - - - - - - - - -"
	echo "Support pdf, doc, docx, xls, xlsx, ppt, pptx"
	echo "- - - - - -  - - -  - - - - - - - - - - - - -"
	echo "Example: $0 target.com docx"
else
TARGET="$1"
FILETYPE="$2"

lynx --dump "https://google.com/search?&q=site:$TARGET+ext:$FILETYPE" | grep ".pdf" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > metafiles

for url in $(cat metafiles);
do
wget -q $url;
done
exiftool *.$2
rm -rf *.$2
fi

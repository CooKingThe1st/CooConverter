#!/bin/bash
oldifs=$IFS
IFS=$(echo -en "\n\b")

allfile=$1
curfile=0
tput sc
for f in *; do
if [ -d "$f" ]; then
		cd "$f"
	cekj=`find -type f -name "*.jpg" -printf x | wc -c`
	cekp=`find -type f -name "*.png" -printf x | wc -c`
	if [ $cekp -eq 0 ]&&[ $cekj -eq 0 ]; then
		:
	else
		bash ../../convert.sh $curfile $allfile
		curfile=$(($curfile + $cekj + $cekp))
	fi
		cd ..
	tput rc
	tput ed
fi
done

name=$PWD
base=$(basename -- "$name")
pdftk $(ls -v *.pdf) cat output "../$base.pdf"
rm *.pdf

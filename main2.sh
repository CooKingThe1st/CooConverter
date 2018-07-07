#!/bin/bash
old_ifs=$IFS
IFS=$(echo -en "\n\b")
shopt -s nullglob
if [ -e CooConverter ]; then :
else
        mkdir CooConverter
fi

numfile=$(ls -l . |grep -c ^d)
let numfile=$numfile-1
counter=0
success=0

declare -a col
for (( i = 1; i <= 7; i++)); do
	col[$(($i - 1))]=$i
done
col[7]=208
# echo ${col[*]}
tput sc
chmod +x convert2.sh
for f in *; do
if [ -d "$f" ]; then
	tput rc
	tput ed
        if [ "$f" = "CooConverter" ]; then
                continue
        fi
	rcol=$((RANDOM % 8))
	let counter=$counter+1
	printf "\e[1m""\e[38;5;${col[$rcol]}mConverting $counter/$numfile file"
	if [ $numfile -gt 1 ]; then 
		printf "s" 
	fi
        cd "$f"
	if [ -f *.jpg ] || [ -f *.png ]; then
		../convert2.sh	
		let success=$success+1
	else 
		printf "\nNo Image file found .. Skip Folder"
	fi
        cd ..
	printf "\e[0m"
fi
done
IFS=$old_ifs

mv *.pdf "CooConverter"
bash combine.sh $success $numfile

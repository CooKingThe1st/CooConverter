#!/bin/bash
old_ifs=$IFS
IFS=$(echo -en "\n\b")
shopt -s nullglob
if [ -e CooConverter ]; then :
else
        mkdir CooConverter
fi
if [ -e "Skip_file.log" ]; then :
else 
	touch "Skip_File.log"
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
chmod +x convert.sh
for f in *; do
if [ -d "$f" ]; then
	if [ "$f" = "CooConverter" ]; then
		continue
	fi
	printf "\r\e[2K"
	rcol=$((RANDOM % 8))
	let counter=$counter+1
	printf "\e[1m""\e[38;5;${col[$rcol]}mConverting $counter/$numfile file"
	if [ $numfile -gt 1 ]; then 
		printf "s" 
	fi
	    cd "$f"
	cekj=`find -type f -name "*.jpg" -printf x | wc -c`
	cekp=`find -type f -name "*.png" -printf x | wc -c`
	if [ $cekp -eq 0 ]&&[ $cekj -eq 0 ]; then
		echo "$f" >> "../Skip_File.log"
	else
		ctj=`find -maxdepth 1 -type f -name "*.jpg" -printf x | wc -c`
		ctp=`find -maxdepth 1 -type f -name "*.png" -printf x | wc -c`
		if [ $ctp -eq 0 ]&&[ $ctj -eq 0 ]; then
			bash ../convert_series.sh $(($cekj + $cekp))
		else
			bash ../convert.sh 0 0
		fi
		if [ $? -eq 0 ] ; then
			let success=$success+1
		else 
			echo "$f" >> "../Skip_File.log"
		fi
	fi

        cd ..
	printf "\e[0m"
fi
done
printf "\r\e[2K"
IFS=$old_ifs
mv *.pdf "CooConverter" 2> /dev/null
bash effect.sh $success $numfile

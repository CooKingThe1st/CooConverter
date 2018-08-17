#!/bin/bash
x=$1
a=$2
custom="$x/$a converted"
declare -a col
for (( i = 1; i <= 6; i++)); do
	col[ $(($i - 1)) ]=$i
done
col[6]=208
counter=0

tput sc
while [ true ]; do
	read -t 0.1 -n 1
	if [ $? = 0 ]; then
		break;
	else
		tput rc
		tput ed
		printf "\e[38;5;${col[$(($counter))]}m"
		for (( i = 0; i < ${#custom}; i++)); do
			printf "${custom:$i:1}"
		done
		printf "\e[0m\e[1m\nPress Any Key to Exit"
		printf "\e[0m"
		let counter=$counter+1
		let counter=$counter%7
	fi
done

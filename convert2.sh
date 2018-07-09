#!/bin/bash
function printpercent {
	 # printf "\r\e[2K"
	 tput rc
	 tput ed
         percent=$((($1*100)/($2+1)))
         noob=[$percent%%]
         printf " $noob"
}

oldifs=$IFS
IFS=$(echo -en "\n\b")

counter=0
npart=0
convert="convert "
numfile=`ls -1 *.jpg 2> /dev/null | wc -l`
let numfile=$numfile+`ls -1 *.png 2> /dev/null | wc -l`
tput sc
for f in $( ls -v *.jpg *.png 2> /dev/null)
do
	let counter=$counter+1
	convert=$convert'"'
	convert=$convert"$f"
	convert=$convert'" '
	let realc=$counter+20*$npart
	if [ $counter -eq 20 ] ; then
		printpercent $realc $numfile
		counter=0
		convert=$convert" $npart.pdf "
		eval $convert
		convert="convert "
		let npart=$npart+1
	fi
	if [ $realc -eq $numfile ]; then
		if [ $counter -ne 0 ] ; then
			printpercent $realc $numfile
		        counter=0
	        	convert=$convert" $npart.pdf "
	        	eval $convert
		        let npart=$npart+1
		fi
	fi
done

name=$PWD
base=$(basename -- "$name")
pdftk $(ls -v *.pdf) cat output "../$base.pdf"
rm *.pdf

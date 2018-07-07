#!/bin/bash
oldifs=$IFS
IFS=$(echo -en "\n\b")

counter=0
npart=0
convert="convert "

for f in $( ls -v *.jpg *.png 2> /dev/null)
do
	let counter=$counter+1
	convert=$convert'"'
	convert=$convert"$f"
	convert=$convert'" '
	if [ $counter -eq 20 ] ; then
		counter=0
		convert=$convert" $npart.pdf "
		eval $convert
		convert="convert "
		let npart=$npart+1
	fi
done
if [ $counter -ne 0 ] ; then
	counter=0
	convert=$convert" $npart.pdf "
	eval $convert
	let npart=$npart+1
fi

name=$PWD
base=$(basename -- "$name")
pdftk $(ls -v *.pdf) cat output "../$base.pdf"
rm *.pdf
exit
for (( i = 0; i < $npart; i++)); do
	rm "$i.pdf"	
done

#!/bin/bashs
curfile=0
allfile=0
function printpercent {
	 # printf "\r\e[2K"
	 tput rc
	 tput ed
         percent=$((( ($1+$curfile)*100 )/($2+$allfile+1)))
         noob=[$percent%%]
         printf " $noob"
}

oldifs=$IFS
IFS=$(echo -en "\n\b")

name=$PWD
base=$(basename -- "$name")

convert="pdftk "
counter=0
nfile=`ls -1 *.pdf 2> /dev/null | wc -l`
for f in $( ls -v *.pdf 2> /dev/null)
do
	convert=$convert'"'
	convert=$convert"$f"
	convert=$convert'" '
	let counter=counter+1
	printpercent $counter $nfile
done
convert=$convert" cat output "
convert=$convert'"'
convert=$convert"../$base.pdf"
convert=$convert'"'
eval $convert
# rm *.pdf
IFS=$oldifs
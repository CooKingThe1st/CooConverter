#!/bin/bash
old_ifs=$IFS
IFS=$(echo -en "\n\b")
st="convert "
name=$PWD
base=$(basename -- "$name")
pbase="'$base.pdf'"

for f in `ls -v *.jpg *.png 2> /dev/null`
do
	st=$st'"'
	st=$st"$f"
	st=$st'" '
done
st=$st"$pbase"
eval $st
mv *.pdf ..
IFS=$old_ifs

#!/bin/bash
for f in *.zip; do
	# echo $f
	name=$(basename -- "$f")
	name="${name%.*}"
	st="unzip -d '$name' '$f'"
	eval $st &> /dev/null
done

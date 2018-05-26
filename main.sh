#!/bin/bash
old_ifs=$IFS
IFS=$(echo -en "\n\b")
shopt -s nullglob
chmod +x convert.sh
for f in *; do
if [ -d "$f" ]; then
	cd "$f"
	echo "convert  $f to pdf"
	../convert.sh
	cd ..
fi
done	
IFS=$old_ifs
if [ -e CooConverter ] ; then
	:
else
	mkdir CooConverter
fi
mv *.pdf CooConverter
printf "Done "
read -rn1

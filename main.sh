#!/bin/bash
old_ifs=$IFS
IFS=$(echo -en "\n\b")
shopt -s nullglob
chmod +x convert.sh
if [ -e CooConverter ] ; then
        :
else
        mkdir CooConverter
fi
for f in *; do
if [ -d "$f" ]; then
        if [ "$f" = "CooConverter" ]; then
                continue
        fi
        cd "$f"
        echo "convert  $f to pdf"
        ../convert.sh
        cd ..
fi
done
IFS=$old_ifs
mv *.pdf "CooConverter"
printf "Done "
read -rn1

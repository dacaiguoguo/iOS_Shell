function findxibSystemFontAll(){ 
	for file in `ls $1 | grep xib` 
	do
        find $1"/"$file |xargs grep "fontDescription\" type=\"system\"" && echo $file  && echo "----------end------------------\n"
	done
	for file in `ls $1` 
	do
		if [ -d $1"/"$file ]; then
			findxibSystemFontAll $1"/"$file
		fi
	done
}
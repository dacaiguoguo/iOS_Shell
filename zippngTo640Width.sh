function zippngTo640Width(){ 
	for file in `ls $1 | grep png` 
	do
        sips --resampleWidth 640 $1"/"$file
	done
	for file in `ls $1` 
	do
		if [ -d $1"/"$file ]; then
			zippngTo640Width $1"/"$file
		fi
	done
}
function renamepng(){ 
	for file in `ls .` 
	do
        mv $file $file".png"
	done
}
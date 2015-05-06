function findxibMarginfirstAll(){ 
	for file in `ls $1 | grep xib` 
	do
		find $1"/"$file |xargs grep "Margin" && echo $1"/"$file && echo "--------------------end-------------\n"
	done
	for file in `ls $1` 
	do
		if [ -d $1"/"$file ]; then
			findxibMarginfirstAll $1"/"$file
		fi
	done
}
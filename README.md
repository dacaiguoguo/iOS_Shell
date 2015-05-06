# iOS_Shell
iOS_Shell
```
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
```

```
function provisioningFileToPlist(){
	pwddir=`pwd`
	echo $pwddir
	cd ~/Library/MobileDevice/Provisioning\ Profiles/
	for file in `ls $1`  
	do
		security cms -D -i $file -o $file.plist
		out=`/usr/libexec/PlistBuddy -c "Print :Name" $file.plist 2> /dev/null`
		echo $out
		mv $file.plist $pwddir/"Provisioning"/$out.plist
	done
	cd $pwddir
}
```

```
function findxibBoldSystemFontAll(){ 
	for file in `ls $1 | grep xib` 
	do
        find $1"/"$file |xargs grep "fontDescription\" type=\"boldSystem\"" && echo $file  && echo "----------end------------------\n"
	done
	for file in `ls $1` 
	do
		if [ -d $1"/"$file ]; then
			findxibBoldSystemFontAll $1"/"$file
		fi
	done
}
```

```
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
```

```
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
```


####递归目录压缩图片宽度640，适用UI给的图比较大的时候，预览速度慢的时候
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
#### 把~/Library/MobileDevice/Provisioning\ Profiles 下的文件转为可以看懂的plist文件
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
####递归目录 查找xib中的系统加粗字体
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
####递归目录 查找xib中的系统字体
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
####iOS 8 以下 Autolayout不能用Margin 递归目录  查找xib中的Margin
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

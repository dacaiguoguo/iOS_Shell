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
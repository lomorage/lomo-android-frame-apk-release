#!/bin/bash

echo -e "\033[0;32mDeploying lomorage.apk to GitHub...\033[0m"
 
### mm/dd/yyyy ###
now=$(date +'%Y-%m-%d_%H-%M-%S')
echo $now

rm -fr *.apk

apk_name="com.lomoware.lomoframe-v1(0.1)-release"
echo $apk_name

apk_path="/h/myproject/lomoware/lomo-android-frame/app/release/"
echo $apk_path

cp $apk_path$apk_name.apk ./

mv ./$apk_name.apk ./$apk_name$now.apk

apk_file="./$apk_name$now.apk"

echo $apk_file

tag=$now
hub release delete $now
hub release create -a $apk_file -m "latest release $now" $now
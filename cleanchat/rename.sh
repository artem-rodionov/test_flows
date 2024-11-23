#!/usr/bin/env bash

camelNameOld=$(cat test_flows/cleanchat/config.env | cut -d ' ' -f 1)
lowerNameOld=$(cat test_flows/cleanchat/config.env | cut -d ' ' -f 2)
echo $lowerNameOld
echo $camelNameOld
camelNameNew=$(cat test_flows/cleanchat/config.env | cut -d ' ' -f 3)
lowerNameNew=$(cat test_flows/cleanchat/config.env | cut -d ' ' -f 4)
echo $lowerNameNew
echo $camelNameNew

#---Change in app_config
sed -i "0,/$camelNameOld/s/$camelNameOld/$camelNameNew/" fluffychat/lib/config/app_config.dart

#---Change in web
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/web/index.html

#---Change in android
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/android/app/src/main/AndroidManifest.xml

#---Change in ios (also change in description)
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/ios/Runner/Info.plist
sed -i "s/>$lowerNameOld</>$lowerNameNew</g" fluffychat/ios/Runner/Info.plist

#---Change in linux
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/linux/my_application.cc
sed -i "s/\"$lowerNameOld\"/\"$lowerNameNew\"/g" fluffychat/linux/CMakeLists.txt

#Change in windows
sed -i "s/\"$lowerNameOld\"/\"$lowerNameNew\"/g" fluffychat/windows/CMakeLists.txt
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/windows/runner/main.cpp

#Change in macOS
sed -i "s/= $camelNameOld/= $camelNameNew/g" fluffychat/macos/Runner/Configs/AppInfo.xcconfig
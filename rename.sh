#!/usr/bin/env bash

camelNameOld=$(cat test_flows/config.env | cut -d ' ' -f 1)
lowerNameOld=$(cat test_flows/config.env | cut -d ' ' -f 2)
echo $lowerNameOld
echo $camelNameOld
camelNameNew=$(cat test_flows/config.env | cut -d ' ' -f 3)
lowerNameNew=$(cat test_flows/config.env | cut -d ' ' -f 4)
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

#---Change in windows
sed -i "s/\"$lowerNameOld\"/\"$lowerNameNew\"/g" fluffychat/windows/CMakeLists.txt
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/windows/runner/main.cpp

#---Change in macOS
sed -i "s/= $camelNameOld/= $camelNameNew/g" fluffychat/macos/Runner/Configs/AppInfo.xcconfig

#---Change assets
cp -f test_flows/main_assets/login_wallpaper.png fluffychat/assets/login_wallpaper.png
cp -f test_flows/main_assets/logo.png fluffychat/assets/logo.png
cp -f test_flows/main_assets/banner_transparent.png fluffychat/assets/banner.png #transparent banner in all ways
cp -f test_flows/main_assets/logo_transparent.png fluffychat/assets/logo_transparent.png
cp -f test_flows/main_assets/banner_transparent.png fluffychat/assets/banner_transparent.png
cp -f test_flows/main_assets/favicon.png fluffychat/assets/favicon.png
cp -f test_flows/main_assets/logo.svg fluffychat/assets/logo.svg
cp -f test_flows/main_assets/info-logo.png fluffychat/assets/info-logo.png

#---Change icons
#---web
cp -f test_flows/icons/web/Icon-512.png fluffychat/web/icons/Icon-512.png
cp -f test_flows/icons/web/Icon-512.png fluffychat/web/icons/Icon-192.png
for i in {1..4}; do
    cp -f test_flows/icons/web/logo.png fluffychat/web/splash/img/dark-$i\x.png #need to fix sizes
    cp -f test_flows/icons/web/logo.png fluffychat/web/splash/img/light-$i\x.png
done
cp -f test_flows/icons/web/favicon.png fluffychat/web/favicon.png #splash

#---windows
cp -f test_flows/icons/windows/app_icon.ico fluffychat/windows/runner/resources/app_icon.ico

#---android
#---app icons
cp -f test_flows/icons/android/mipmap/ic_hd.png fluffychat/android/app/src/main/res/mipmap-hdpi/ic_launcher.png #72 px
cp -f test_flows/icons/android/mipmap/ic_md.png fluffychat/android/app/src/main/res/mipmap-mdpi/ic_launcher.png #48 px
cp -f test_flows/icons/android/mipmap/ic_xhd.png fluffychat/android/app/src/main/res/mipmap-xhdpi/ic_launcher.png #96 px
cp -f test_flows/icons/android/mipmap/ic_xxhd.png fluffychat/android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png #144 px
cp -f test_flows/icons/android/mipmap/ic_xxxhd.png fluffychat/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png #192 px

#---splashes
cp -f test_flows/icons/android/drawable/splash_hd.png fluffychat/android/app/src/main/res/drawable-hdpi/splash.png #265 px
cp -f test_flows/icons/android/drawable/splash_md.png fluffychat/android/app/src/main/res/drawable-mdpi/splash.png #177 px
cp -f test_flows/icons/android/drawable/splash_xhd.png fluffychat/android/app/src/main/res/drawable-xhdpi/splash.png #354 px
cp -f test_flows/icons/android/drawable/splash_xxhd.png fluffychat/android/app/src/main/res/drawable-xxhdpi/splash.png #531 px
cp -f test_flows/icons/android/drawable/splash_xxxhd.png fluffychat/android/app/src/main/res/drawable-xxxhdpi/splash.png #709 px

#---notifications
cp -f test_flows/icons/android/drawable/notifications_hd.png fluffychat/android/app/src/main/res/drawable-hdpi/notifications_icon.png #36 px
cp -f test_flows/icons/android/drawable/notifications_md.png fluffychat/android/app/src/main/res/drawable-mdpi/notifications_icon.png #24 px
cp -f test_flows/icons/android/drawable/notifications_xhd.png fluffychat/android/app/src/main/res/drawable-xhdpi/notifications_icon.png #48 px
cp -f test_flows/icons/android/drawable/notifications_xxhd.png fluffychat/android/app/src/main/res/drawable-xxhdpi/notifications_icon.png #72 px
cp -f test_flows/icons/android/drawable/notifications_xxxhd.png fluffychat/android/app/src/main/res/drawable-xxxhdpi/notifications_icon.png #96 px

#---ios
cp -f test_flows/icons/ios/icon_20x1.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png #20 px
cp -f test_flows/icons/ios/icon_20x2.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png #40 px
cp -f test_flows/icons/ios/icon_20x3.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png #60 px
cp -f test_flows/icons/ios/icon_29x1.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png #29 px
cp -f test_flows/icons/ios/icon_29x2.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png #58 px
cp -f test_flows/icons/ios/icon_29x3.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png #87 px
cp -f test_flows/icons/ios/icon_40x1.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png #40 px
cp -f test_flows/icons/ios/icon_40x2.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png #80 px
cp -f test_flows/icons/ios/icon_40x3.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png #120 px
cp -f test_flows/icons/ios/icon_50x1.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-50x50@1x.png #50 px
cp -f test_flows/icons/ios/icon_50x2.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-50x50@2x.png #100 px
cp -f test_flows/icons/ios/icon_57x1.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-57x57@1x.png #57 px
cp -f test_flows/icons/ios/icon_57x2.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-57x57@2x.png #114 px
cp -f test_flows/icons/ios/icon_60x2.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png #120 px
cp -f test_flows/icons/ios/icon_60x3.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png #180 px
cp -f test_flows/icons/ios/icon_72x1.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-72x72@1x.png #72 px
cp -f test_flows/icons/ios/icon_72x2.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-72x72@2x.png #144 px
cp -f test_flows/icons/ios/icon_76x1.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png #76 px
cp -f test_flows/icons/ios/icon_76x2.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png #152 px
cp -f test_flows/icons/ios/icon_83.5x2.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png #167 px
cp -f test_flows/icons/ios/icon_1024.png fluffychat/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png #1024 px


#---macos
cp -f test_flows/icons/macos/icon_16.png fluffychat/macos/Runner/Assets.xcassets/AppIcon.appiconset/16-mac.png #16 px
cp -f test_flows/icons/macos/icon_32.png fluffychat/macos/Runner/Assets.xcassets/AppIcon.appiconset/32-mac.png #32 px
cp -f test_flows/icons/macos/icon_64.png fluffychat/macos/Runner/Assets.xcassets/AppIcon.appiconset/64-mac.png #64 px
cp -f test_flows/icons/macos/icon_128.png fluffychat/macos/Runner/Assets.xcassets/AppIcon.appiconset/128-mac.png #128 px
cp -f test_flows/icons/macos/icon_256.png fluffychat/macos/Runner/Assets.xcassets/AppIcon.appiconset/256-mac.png #256 px
cp -f test_flows/icons/macos/icon_512.png fluffychat/macos/Runner/Assets.xcassets/AppIcon.appiconset/512-mac.png #512 px
cp -f test_flows/icons/macos/icon_1024.png fluffychat/macos/Runner/Assets.xcassets/AppIcon.appiconset/1024-mac.png #1024 px
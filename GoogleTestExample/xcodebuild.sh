#!/bin/sh

# killall Simulator && sleep 5

workspace_path=/Users/wubill/GitMy/iOSSamples
project_name=GoogleTestExample
build_path=$workspace_path/$project_name
scheme_name='iOSGTestApp'
derived_path='output'

# sdk_name="iphonesimulator9.2"
# destination_setting="platform=iOS Simulator,name=iPhone 6s,OS=9.2"
sdk_name="iphoneos"
destination_setting="platform=iOS,id=88dda2712830c2020dfb4f09f08bfe512a1ab935"

echo "== 准备开始打ipa包 =="

echo "第一步，进入项目工程文件: $build_path"
cd $build_path

echo "第二步，执行build clean命令"
xcodebuild -project $project_name.xcodeproj \
           -scheme $scheme_name \
           -configuration Release \
           clean

echo "第三步，执行编译生成.app命令"
# xcodebuild -project $project_name.xcodeproj \
#            -scheme $scheme_name \
#            -sdk $sdk_name \
#            -configuration Release \
#            -derivedDataPath $derived_path \
#            build
           
echo "执行 test 命令"    
xcodebuild -project $project_name.xcodeproj \
           -scheme $scheme_name \
           -sdk $sdk_name \
           -configuration Release \
           -destination $destination_setting \
           -derivedDataPath $derived_path \
           test           

# echo "第四步, 导出ipa包"
# app_name_path=$build_path/$derived_path/Build/Products/Release-iphoneos/${scheme_name}.app
# ipa_name_path=$build_path/$derived_path/Build/Products/Release-iphoneos/${scheme_name}.ipa
# #生成ipa包
# xcrun -sdk iphoneos PackageApplication -v $app_name_path -o $ipa_name_path

# echo "== 制作ipa包完成 =="
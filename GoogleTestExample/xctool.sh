#!/bin/sh

#工程环境路径
workspace_path=/Users/wubill/GitMy/iOSSamples
#项目名称
project_name=GoogleTestExample
#build的路径
build_path=$workspace_path/$project_name
#scheme
scheme_name='iOSGTestApp'
destination_setting='name=iPhone 6s'
sdk_name='iphonesimulator9.2'
# sdk_name='iphoneos'
derived_path='output'

# xcodebuild test -project GoogleTestExample.xcodeproj -scheme iOSGTestApp -destination 'platform=iOS Simulator,name=iPhone 6s,OS=9.2'

#＃＃ The libary's UnitTest will no launch a iphonesimulator, because it has no host application.
# xctool -project GoogleTestExample.xcodeproj -scheme demo-ios -sdk iphonesimulator -destination 'name=iPhone 6' run-tests

# echo "执行 clean 命令"
# xctool -project $project_name.xcodeproj \
#        -scheme $scheme_name \
#        clean

# echo "执行 build-tests 命令"
# xctool -project $project_name.xcodeproj \
#        -scheme $scheme_name \
#        -sdk $sdk_name \
#        -configuration Release \
#        -destination 'name=iPhone 6s' \
#        -derivedDataPath $derived_path \
#        test

echo "执行 run-tests 命令"    
xctool -project $project_name.xcodeproj \
       -scheme $scheme_name \
       -sdk iphonesimulator9.2 \
       -configuration Release \
       -destination 'name=iPhone 6' \
       -derivedDataPath $derived_path \
       run-tests -freshSimulator

# xctool -sdk iphonesimulator9.2 \
#        -destination $destination_setting \
#        run-tests -freshSimulator -logicTest \
#        '/Users/wubill/GitMy/iOSSamples/Googletest/output/Build/Products/Debug-iphonesimulator/TestBundle.xctest'
       
      # -appTest *** :'/Users/wubill/GitMy/iOSSamples/output/Build/Products/Debug-iphonesimulator/iOS_CI.app'
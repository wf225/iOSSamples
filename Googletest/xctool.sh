#!/bin/sh

# echo "执行 clean 命令"
# xctool -workspace iOSSamples.xcworkspace \
#        -scheme iOS_CI \
#        clean
       
# echo "执行 build-tests 命令"
# xctool -project GoogleTestExample.xcodeproj \
#        -scheme demo-ios \
#        -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.2' \
#        -derivedDataPath './output' \
#        build-tests

echo "执行 run-tests 命令"    
# xctool -project GoogleTestExample.xcodeproj \
#        -scheme demo-ios \
#        -sdk iphonesimulator9.2 \
#        -destination 'name=iPhone 6s Plus' \
#        -derivedDataPath './output' \
#        run-tests -freshSimulator

xctool -sdk iphonesimulator9.2 \
       -destination 'name=iPhone 6s Plus' \
       run-tests -freshSimulator -logicTest \
       '/Users/wubill/GitMy/iOSSamples/Googletest/output/Build/Products/Debug-iphonesimulator/TestBundle.xctest'
       
      # -appTest *** :'/Users/wubill/GitMy/iOSSamples/output/Build/Products/Debug-iphonesimulator/iOS_CI.app'
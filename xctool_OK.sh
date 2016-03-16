#!/bin/sh

echo "执行 clean 命令"
xctool -workspace iOSSamples.xcworkspace \
       -scheme iOS_CI \
       clean
       
echo "执行 build-tests 命令"
xctool -workspace iOSSamples.xcworkspace \
       -scheme iOS_CI \
       -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.2' \
       -derivedDataPath './output' \
       build-tests
       
# xctool test -workspace iOSSamples.xcworkspace -scheme iOS_CI -sdk iphonesimulator9.2 -destination 'name=iPhone 6s' -derivedDataPath './output'
# xctool -workspace iOSSamples.xcworkspace \
#        -scheme iOS_CI \
#        -sdk iphonesimulator destination 'name=iPhone 6 Plus' \
#        -derivedDataPath './output' \
#        run-tests -only iOS_CITests
 
# xctool -sdk iphonesimulator destination 'name=iPhone 6 Plus' \
#        -derivedDataPath './output' \
#        run-tests -freshSimulator -appTest iOS_CITests.xctest:iOS_CI.app

echo "执行 run-tests 命令"    
xctool -workspace iOSSamples.xcworkspace \
       -scheme iOS_CI \
       -sdk iphonesimulator9.2 \
       -destination 'name=iPhone 6s Plus' \
       -derivedDataPath './output' \
       run-tests -only iOS_CITests -freshSimulator       
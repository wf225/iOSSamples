#!/bin/sh

echo "执行build clean命令"
xcodebuild -workspace iOSSamples.xcworkspace \
           -scheme iOS_CI \
           -configuration Release \
           clean

echo "执行编译命令"
xcodebuild -workspace iOSSamples.xcworkspace \
           -scheme "iOS_CI" \
           -sdk iphonesimulator \
           -configuration Release \
           -destination 'platform=iOS Simulator,name=iPhone 6s,OS=9.2' \
           -derivedDataPath './output' \
           test
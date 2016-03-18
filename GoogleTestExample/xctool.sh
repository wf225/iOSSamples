#!/bin/sh

# Run the command killall Simulator && sleep 5 before the xctool command to shutdown the simulator and waiting 5 seconds
# killall Simulator && sleep 5

workspace_path=/Users/wubill/GitMy/iOSSamples
project_name=GoogleTestExample
build_path=$workspace_path/$project_name
scheme_name="iOSGTestApp"
derived_path="output"

sdk_name="iphonesimulator9.2"
destination_setting="name=iPhone 6s"
# sdk_name="iphoneos"
# destination_setting="platform=iOS,id=88dda2712830c2020dfb4f09f08bfe512a1ab935"

# xcodebuild test -project GoogleTestExample.xcodeproj -scheme iOSGTestApp -sdk iphonesimulator9.2 -destination 'platform=iOS Simulator,name=iPhone 6s,OS=9.2'
# xcodebuild test -project GoogleTestExample.xcodeproj -scheme iOSGTestApp -sdk iphoneos -destination 'platform=iOS,id=88dda2712830c2020dfb4f09f08bfe512a1ab935'

# xcodebuild test -project iOS_CI.xcodeproj -scheme iOS_CI -destination 'platform=iOS,id=88dda2712830c2020dfb4f09f08bfe512a1ab935'
  # CODE_SIGN_IDENTITY="iPhone Developer: Bill Wu (P8488Y53R7)" PROVISIONING_PROFILE="5f5790af-ed1e-46b9-92c7-e83a621a0505"


#＃＃ The libary's UnitTest will no launch a iphonesimulator, because it has no host application.
# xctool -project GoogleTestExample.xcodeproj -scheme demo-ios -sdk iphonesimulator -destination 'name=iPhone 6' run-tests

# # "Execute clean"
# xctool -project $project_name.xcodeproj \
#        -scheme $scheme_name \
#        clean

# # "Execute执行 build-tests"
# xctool -project $project_name.xcodeproj \
#        -scheme $scheme_name \
#        -sdk $sdk_name \
#        -configuration Release \
#        -derivedDataPath $derived_path \
#        build-tests


# "Execute run-tests"

# xctool -project $project_name.xcodeproj \
#        -scheme $scheme_name \
#        -sdk $sdk_name \
#        -configuration Release \
#        -destination "name=iPhone 6s" \
#        -derivedDataPath $derived_path \
#        run-tests -freshSimulator


app_path=$build_path/$derived_path/Build/Products/Release-iphonesimulator

xctool -sdk $sdk_name \
       -sdk $sdk_name \
       -configuration Release \
       -destination "platform=iOS Simulator,name=iPhone 6" \
       -derivedDataPath $derived_path \
       run-tests -freshSimulator \
                 -appTest $app_path/iOSGTestAppTests.xctest:$app_path/iOSGTestApp.app/iOSGTestApp


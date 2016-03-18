#!/bin/sh

workspace_path=/Users/wubill/GitMy/iOSSamples
project_name=GoogleTestExample
build_path=$workspace_path/$project_name
scheme_name="iOSGTestApp"
derived_path="output"
CONFIG="Debug"

sdk_name="iphoneos"
destination_setting="platform=iOS,id=88dda2712830c2020dfb4f09f08bfe512a1ab935"
app_path=$build_path/$derived_path/Build/Products/$CONFIG-iphoneos

# "Execute clean"
xctool -project $project_name.xcodeproj \
       -scheme $scheme_name \
       clean

# "Execute执行 build-tests"
xctool -project $project_name.xcodeproj \
       -scheme $scheme_name \
       -sdk $sdk_name \
       -configuration $CONFIG \
       -derivedDataPath $derived_path \
       -CODE_SIGN_IDENTITY="iPhone Developer: Bill Wu (P8488Y53R7)" \
       build-tests


# List ids and names of connected devices
ios-deploy -c

# deploy and debug your app to a connected device, uninstall the app first
ios-deploy --uninstall_only --bundle_id com.autodesk.iOSGTestApp
ios-deploy --uninstall_only --bundle_id com.apple.test.iOSGTestAppUITests-Runner

# #  deploy and launch your app to a connected device, but quit the debugger after
# ios-deploy --uninstall --bundle $app_path/iOSGTestApp.app
# ios-deploy --uninstall --justlaunch --bundle $app_path/iOSGTestAppUITests-Runner.app
ios-deploy --bundle $app_path/iOSGTestApp.app
ios-deploy --justlaunch --bundle $app_path/iOSGTestAppUITests-Runner.app

# # Download your app's Documents, Library and tmp folders
ios-deploy --bundle_id "com.apple.test.iOSGTestAppUITests-Runner" --download --to $app_path/"log"
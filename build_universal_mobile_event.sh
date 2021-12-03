mkdir my_build

xcodebuild clean build \
  -project platform/ios/vendor/mapbox-events-ios/MapboxMobileEvents.xcodeproj \
  -scheme "MapboxMobileEvents (All Targets)" \
  -configuration Release \
  -sdk iphonesimulator \
  -derivedDataPath derived_data

mkdir my_build/simulator

cp -r derived_data/Build/Products/Release-iphonesimulator/MapboxMobileEvents.framework my_build/simulator

xcodebuild clean build \
  -project platform/ios/vendor/mapbox-events-ios/MapboxMobileEvents.xcodeproj \
  -scheme "MapboxMobileEvents (All Targets)" \
  -configuration Release \
  -sdk iphoneos \
  -derivedDataPath derived_data

mkdir my_build/devices

cp -r derived_data/Build/Products/Release-iphoneos/MapboxMobileEvents.framework my_build/devices

mkdir my_build/universal

cp -r my_build/devices/MapboxMobileEvents.framework my_build/universal/

lipo -create \
  my_build/simulator/MapboxMobileEvents.framework/MapboxMobileEvents \
  my_build/devices/MapboxMobileEvents.framework/MapboxMobileEvents \
  -output my_build/universal/MapboxMobileEvents.framework/MapboxMobileEvents

cp my_build/simulator/MapboxMobileEvents.framework/Modules/MapboxMobileEvents.swiftmodule/* my_build/universal/MapboxMobileEvents.framework/Modules/MapboxMobileEvents.swiftmodule
XCODEPROJ=MapboxMobileEvents
SCHEME="MapboxMobileEvents (All Targets)"
FWNAME=MapboxMobileEvents
rm -R my_build
echo "+++ Xoa folder my_build cu"
rm -R derived_data
echo "+++ Xoa folder derived_data cu"
mkdir my_build
echo "+++ Tao folder my_build"
mkdir derived_data
echo "+++ Tao folder derived_data"

xcodebuild clean build \
    -project $XCODEPROJ.xcodeproj \
    -scheme "$SCHEME" \
    -configuration Release \
    -sdk iphonesimulator \
    -derivedDataPath derived_data

echo "+++ Tao ban build cho simulator va dua vao derived_data"

mkdir my_build/simulator
echo "+++ Tao folder my_build/simulator"

cp -r derived_data/Build/Products/Release-iphonesimulator/$FWNAME.framework my_build/simulator
echo "+++ Copy file FW cua simulator vao my_buid/simulator"


xcodebuild clean build \
    -project $XCODEPROJ.xcodeproj \
    -scheme "$SCHEME" \
    -configuration Release \
    -sdk iphoneos \
    -derivedDataPath derived_data
    
echo "+++ build fw cho device va nem vao derived_data"

mkdir my_build/devices
echo "+++ Tao folder my_build/devices"

cp -r derived_data/Build/Products/Release-iphoneos/$FWNAME.framework my_build/devices
echo "+++ copy fw device vao my_build/devices"

mkdir my_build/universal
echo "+++ Tao folder my_build/universal"

cp -r my_build/devices/$FWNAME.framework my_build/universal/
echo "+++ Copy file FW device to my_build/universal"

lipo -create \
  my_build/simulator/$FWNAME.framework/$FWNAME \
  my_build/devices/$FWNAME.framework/$FWNAME \
  -output my_build/universal/$FWNAME.framework/$FWNAME

echo "+++ Lipo gop 2 thu vien simulator va device va cap nhat vao universal"

cp -r my_build/simulator/$FWNAME.framework/Modules/$FWNAME.swiftmodule/* my_build/universal/$FWNAME.framework/Modules/$FWNAME.swiftmodule
echo "+++ copy swift module cua simulator vao folder build universal"

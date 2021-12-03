# 1. Biet dc file build framework dang o dau
# $1: path file fw
# $2: Version muon up
FWName=MapboxMobileEvents.framework
PodspecName=VietMapsMobileEvents.podspec

echo "+++ Source Folder: $1"
echo "+++ Git folder: $2"
echo "+++ Version buid: $3"

# 2. Xoa file FW hien tai
rm -R "$2/$FWName"
echo "+++ Delete old FW: rm $2/$FWName"

rm -R "$2/$PodspecName"
echo "+++ Delete old Podspec: rm $2/$PodspecName"

# 3. Copy file moi vao
cp -R "$1/$FWName" "$2"
echo "+++ Copy new file FW from $1/$FWName to $2"

cp -R "$1/$PodspecName" "$2"
echo "+++ Copy new file Podspec from $1/$FWName to $2"
#
cd $2 && git add .
echo "+++ Git add all file local change"

cd $2 && git commit -m "update ver $3"
echo "+++ Add git commit with msg: "update ver $3""

cd $2 && git tag $3
echo "+++ Add git tag: $3"

cd $2 && git push origin master
echo "+++ Push all code to master"

cd $2 && git push --tags origin
echo "+++ Push all tag to master"
#
# 7. push thu vien len cocoapod // chu y co the phai khoi tao phien trc "pod trunk register aic.developer01@gmail.com 'VietMaps' --description="VietMaps""
cd $2 && pod trunk push $PodspecName --allow-warnings
echo "+++ day file podspec to cocoapods"

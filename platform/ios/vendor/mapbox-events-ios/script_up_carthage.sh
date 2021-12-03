# 1. Biet dc file build framework dang o dau
# $1: path file fw
# $2: Version muon up
JSONFile="VietMapsMobileEvents.json"
PrefixName="VietMapsMobileEvents-"
FWName="MapboxMobileEvents.framework"

echo "+++ Source Folder: $1"
echo "+++ Git folder: $2"
echo "+++ Version buid: $3"

# 2. Xoa file FW tai folder git
SearchStr="$PrefixName*.zip"
res=`find $2 -name $SearchStr`
rm $res
echo "+++ Delete old file $res"
# 3. Xoa file JSON tai folder git
rm "$2/$JSONFile"
echo "+++ Delete old file $2/$JSONFile"

folderZip="$1/$PrefixName$3"
# Xoa folder chua fw tai thu muc source
rm -R $folderZip
echo "+++ Delete old zip folder $folderZip"
mkdir $folderZip
echo "+++ Create zip folder $folderZip"
rm "$1/$PrefixName$3.zip"
echo "+++ Xoa file zip cu $1/$PrefixName$3.zip"
#
cp -R "$1/$FWName" $folderZip
echo "+++ Copy file FW vao zip folder $1/$FWName - $folderZip"
#
zip -rq "$folderZip.zip" $folderZip
echo "+++ Zip folder: $folderZip.zip"
#
cp -R "$folderZip.zip" "$2"
echo "+++ copy file zip toi folder git: $folderZip.zip - $2"
#
cp -R "$1/$JSONFile" "$2"
echo "+++ copy file json toi folder git: $1/$JSONFile - $2"
#
cd $2 && git add .
echo "+++ git add local change"

cd $2 && git commit -m "Update $PrefixName$3"
echo "+++ git add commit update version"
#
cd $2 && git push origin master
echo "+++ push lên master"

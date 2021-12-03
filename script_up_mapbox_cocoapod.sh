# 1. Biet dc file build framework dang o dau
# $1: path file fw
# $2: Version muon up
echo "Source Folder: $1"
echo "Git folder: $2"
echo "Version buid: $3"

# 2. Xoa file FW hien tai
echo "Delete old FW: rm $2/Mapbox.framework"
rm -R "$2/Mapbox.framework"

# 3. Copy file moi vao
echo "Copy new file FW"
cp -R "$1/Mapbox.framework" "$2"

# 4. Xoa file podspec hien tai
echo "Delete old Podspec: rm $2/VietMaps.podspec"

# 5. Copy file moi vao
echo "Copy new file Podspec"
cp -R "$1/VietMaps.podspec" "$2"

# 6. cd vao thu muc git
echo "cd git folder"
cd "$2"

# 7. git push
echo "git push new fw + podspec"

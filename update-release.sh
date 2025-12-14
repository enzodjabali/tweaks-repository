#!/bin/bash

cat > Release << EOF
Origin: enzodjabali's Repo
Label: enzodjabali
Suite: stable
Version: 1.0
Codename: ios
Architectures: iphoneos-arm iphoneos-arm64 iphoneos-arm64e
Components: main
Description: enzodjabali's personal tweak repository
EOF

echo "MD5Sum:" >> Release
for file in Packages Packages.bz2 Packages.gz; do
    if [ -f "$file" ]; then
        md5=$(md5 -q "$file")
        size=$(stat -f%z "$file")
        printf " %s %16d %s\n" "$md5" "$size" "$file" >> Release
    fi
done

echo "SHA1:" >> Release
for file in Packages Packages.bz2 Packages.gz; do
    if [ -f "$file" ]; then
        sha1=$(shasum -a 1 "$file" | awk '{print $1}')
        size=$(stat -f%z "$file")
        printf " %s %16d %s\n" "$sha1" "$size" "$file" >> Release
    fi
done

echo "SHA256:" >> Release
for file in Packages Packages.bz2 Packages.gz; do
    if [ -f "$file" ]; then
        sha256=$(shasum -a 256 "$file" | awk '{print $1}')
        size=$(stat -f%z "$file")
        printf " %s %16d %s\n" "$sha256" "$size" "$file" >> Release
    fi
done

echo "Release file updated successfully!"

#!/bin/bash

# Creates Empty Disk: 
hdiutil create -o /tmp/Ventura -size 16384m -volname Ventura -layout SPUD -fs HFS+J

# Mounts created disk: 
hdiutil attach /tmp/Ventura.dmg -noverify -mountpoint /Volumes/Ventura

# Creates install media: 
sudo /Applications/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia --volume /Volumes/Ventura --nointeraction

# Unmounts disk image: 
hdiutil eject -force /Volumes/Install\ macOS\ Ventura

# Creates CDR file: 
hdiutil convert /tmp/Ventura.dmg -format UDTO -o ~/Desktop/Ventura

# Converts CDR to ISO: 
mv -v ~/Desktop/Ventura.cdr ~/Desktop/Ventura.iso

# Cleans up files: 
#rm -fv /tmp/Ventura.dmg
mv /tmp/Ventura.dmg ~/Desktop/Ventura.dmg

#!/bin/bash

# Creates Empty Disk: 
hdiutil create -o /tmp/Monterey -size 16384m -volname Monterey -layout SPUD -fs HFS+J

# Mounts created disk: 
hdiutil attach /tmp/Monterey.dmg -noverify -mountpoint /Volumes/Monterey

# Creates install media: 
sudo /Applications/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/Monterey --nointeraction

# Unmounts disk image: 
hdiutil eject -force /Volumes/Install\ macOS\ Monterey

# Creates CDR file: 
hdiutil convert /tmp/Monterey.dmg -format UDTO -o ~/Desktop/Monterey

# Converts CDR to ISO: 
mv -v ~/Desktop/Monterey.cdr ~/Desktop/Monterey.iso

# Cleans up files: 
#rm -fv /tmp/Monterey.dmg
mv /tmp/Monterey.dmg ~/Desktop/Monterey.dmg


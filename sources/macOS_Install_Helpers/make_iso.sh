#!/bin/bash

function createISO() {
    local installerapp=$1
    local isoname=$2
    
    # Mount the Installer image
    hdiutil attach /Applications/"$installerapp"/Contents/SharedSupport/InstallESD.dmg -noverify -nobrowse -mountpoint /Volumes/install_app
    
    # Based on installer size, create sparseimage with a Single Partition - Apple Partition Map
    case "$installerapp" in
        "Install macOS Sierra.app") hdiutil create -o /tmp/"$isoname".cdr -size 5120m -layout SPUD -fs HFS+J
        "Install OS X El Capitan.app") hdiutil create -o /tmp/"$isoname".cdr -size 6400m -layout SPUD -fs HFS+J
        "Install OS X Yosemite.app") hdiutil create -o /tmp/"$isoname".cdr -size 6144m -layout SPUD -fs HFS+J
    esac
    
    # Mount the sparseimage
    hdiutil attach /tmp/"$isoname".cdr.dmg -noverify -nobrowse -mountpoint /Volumes/install_build
    
    # Restore the Base System into the blank sparseimage
    asr restore -source /Volumes/install_app/BaseSystem.dmg -target /Volumes/install_build -noprompt -noverify -erase
    
    # Remove Packages link and replace with actual files
    rm /Volumes/OS\ X\ Base\ System/System/Installation/Packages
    cp -rp /Volumes/install_app/Packages /Volumes/OS\ X\ Base\ System/System/Installation/
    
    # Copy installer dependencies
    cp -rp /Volumes/install_app/BaseSystem.chunklist /Volumes/OS\ X\ Base\ System/BaseSystem.chunklist
    cp -rp /Volumes/install_app/BaseSystem.dmg /Volumes/OS\ X\ Base\ System/BaseSystem.dmg
    
    # Unmount the installer image
    hdiutil detach /Volumes/install_app
    
    # Unmount the Base System image
    hdiutil detach /Volumes/OS\ X\ Base\ System
    
    # Convert the sparseimage image to iso
    hdiutil convert /tmp/"$isoname".cdr.dmg -format UDTO -o /tmp/"$isoname".iso
    
    # Rename the iso and move to Downloads folder
    mv /tmp/"$isoname".iso.cdr ~/Downloads/"$isoname".iso
    open ~/Downloads
}

echo "    Choose OS version to create ISO (Enter number 1-3):"
echo "        1. macOS 10.12 Sierra"
echo "        2. OS X 10.11 El Capitan"
echo "        3. OS X 10.10 Yosemite"
read osversion

case $osversion in
    1)
        createISO "Install macOS Sierra.app" "macOS 10.12"
        echo "Creating macOS Sierra iso";;
    2)
        createISO "Install OS X El Capitan.app" "OS X 10.11"
        echo "Creating OS X El Capitan iso";;
    3)
        createISO "Install OS X Yosemite.app" "OS X 10.10"
        echo "Creating OS X Yosemite iso";;
    *) echo "Could not find installer for Yosemite (10.10), El Capitan (10.11) or Sierra (10.12)";;
esac
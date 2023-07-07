https://www.funkyspacemonkey.com/how-to-install-macos-catalina-in-a-docker-container-on-linux
https://www.funkyspacemonkey.com/how-to-install-macos-big-sur-with-opencore-on-linux

https://gist.github.com/coolaj86/9834a45a6c21a41e8882698a00b55787
https://gist.github.com/coolaj86/22d08c4b582779485e0df11c5d84063a


https://mrmacintosh.com/macos-ventura-13-full-installer-database-download-directly-from-apple/

https://github.com/BITespresso/createinstalliso#user-content-installation
https://gist.github.com/coolaj86/22d08c4b582779485e0df11c5d84063a?permalink_comment_id=4128680
https://gist.github.com/coolaj86/22d08c4b582779485e0df11c5d84063a
https://gist.github.com/coolaj86/9834a45a6c21a41e8882698a00b55787
https://www.funkyspacemonkey.com/how-to-install-macos-big-sur-with-opencore-on-linux


## macOS in a Docker container:
status: decided to stop, didn't show up as a boot disk after installing.
https://www.funkyspacemonkey.com/how-to-install-macos-catalina-in-a-docker-container-on-linux
https://github.com/sickcodes/Docker-OSX
	docker run --privileged -e "DISPLAY=${DISPLAY:-:0.0}" -v /tmp/.X11-unix:/tmp/.X11-unix sickcodes/docker-osx
	14.3.1
	docker pull sickcodes/docker-osx
	sudo modprobe kvm
	sudo systemctl enable virtlogd.service
	sudo systemctl enable libvirtd.service
	sudo yum install libvirt qemu-kvm -y
	sudo usermod -aG docker $USER
	sudo systemctl enable docker
	sudo systemctl start docker

	sudo systemctl stop docker
	sudo systemctl disable virtlogd.service
	sudo systemctl disable libvirtd.service
	sudo systemctl disable docker



## Native Mac Building ISOs:


Use `` to download the `InstallAssistant.pkg` files corresponding to the OSs you want.

Launch the `.pkg` installer and install on the boot disk. This will install the `Install macOS *.app` to the Applications folder. "Install macOS Ventura"



```bash
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
```



```bash
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
# rm -fv /tmp/Ventura.dmg
mv /tmp/Ventura.dmg ~/Desktop/Ventura.dmg
```
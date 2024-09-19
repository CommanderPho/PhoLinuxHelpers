https://askubuntu.com/questions/346211/tracker-store-and-tracker-miner-fs-eating-up-my-cpu-on-every-startup


# found cause of high fans and CPU usage: tracker-miner-fs which indexes the filesystem and is known to be horrible for coders, etc

* [tracker\-miner\-fs\-3 High CPU\/RAM \: r\/archlinux](https://www.reddit.com/r/archlinux/comments/m5juk3/trackerminerfs3_high_cpuram/ "tracker-miner-fs-3 High CPU/RAM : r/archlinux")
* [top \- what is tracker\-miner\-f and how to stop it \- Unix \& Linux Stack Exchange](https://unix.stackexchange.com/questions/704220/what-is-tracker-miner-f-and-how-to-stop-it "top - what is tracker-miner-f and how to stop it - Unix \& Linux Stack Exchange")
* [12\.04 \- tracker\-store and tracker\-miner\-fs eating up my CPU on every startup \- Ask Ubuntu](https://askubuntu.com/questions/346211/tracker-store-and-tracker-miner-fs-eating-up-my-cpu-on-every-startup "12.04 - tracker-store and tracker-miner-fs eating up my CPU on every startup - Ask Ubuntu")

I disabled it with dconf-editor, which I had to launch from the shell because it seems broken.

gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2
gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false



`sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop`


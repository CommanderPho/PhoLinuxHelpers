
https://superuser.com/questions/385748/binding-superc-superv-to-copy-and-paste
https://unix.stackexchange.com/questions/171190/how-enable-ctrl-v-paste-in-redhat
https://superuser.com/questions/421463/why-does-ctrl-v-not-paste-in-bash-linux-shell
https://forums.linuxmint.com/viewtopic.php?t=368328
https://askubuntu.com/questions/318947/ctrlshiftv-doesnt-paste-to-terminal-now


# Potential tool fix: kinto - Type in linux like it's a mac

https://github.com/rbreaves/kinto


/bin/bash -c "$(wget -qO- https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh || curl -fsSL https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh)"



Kinto install is complete.

If the setup wizard fails to appear then please run this command.
~/.config/kinto/gui/kinto-gui.py

You can then either Google what dependencies you may be missing
or open an issue ticket.

Gnome may not support appindicators well, so by default you may need to install packages before enabling the System Tray.
You may try one of the following extensions.
    1) AppIndicator and KStatusNotifierItem Support
    2) TopIcons Plus

Note: you may want these supporting packages
'sudo apt install gnome-tweaks gnome-shell-extension-appindicator gir1.2-appindicator3-0.1'



  131  cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
  132  sudo cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service



/etc/sysconfig/desktop

# Followed https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/infrastructure-services/TigerVNC/
cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service


    /usr/share/wayland-sessions/: This directory contains the session files for Wayland sessions.

    /usr/share/xsessions/: This directory contains the session files for Xorg sessions.


sudo systemctl disable gdm
sudo systemctl enable sddm
echo "exec startkde" > ~/.xinitrc
DESKTOP="KDE"

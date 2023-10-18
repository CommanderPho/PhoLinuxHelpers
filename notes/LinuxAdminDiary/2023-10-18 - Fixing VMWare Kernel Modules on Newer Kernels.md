git clone https://github.com/mkubecek/vmware-host-modules.git
cd vmware-host-modules
git checkout workstation-16.1.2
make
sudo make install
sudo systemctl restart vmware.service


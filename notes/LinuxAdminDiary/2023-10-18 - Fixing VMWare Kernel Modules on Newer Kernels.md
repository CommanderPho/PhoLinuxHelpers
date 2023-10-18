

# Fix
git clone https://github.com/mkubecek/vmware-host-modules.git
cd vmware-host-modules
git checkout workstation-16.1.2
make
sudo make install
sudo systemctl restart vmware.service


# References
https://github.com/mkubecek/vmware-host-modules/tree/workstation-17.0.2
Not Used, different method: https://docs.fedoraproject.org/en-US/quick-docs/vmware-what-is-it/




# Fix
git clone https://github.com/mkubecek/vmware-host-modules.git
cd vmware-host-modules
git checkout workstation-16.1.2
make
sudo make install
sudo systemctl restart vmware.service

## 2025-04-10 after upgrade
```
halechr@RDLU0039:/usr/local/share/applications$ vmware --version
VMware Workstation 17.5.2 build-23775571

git checkout workstation-17.5.2

```

# References
https://github.com/mkubecek/vmware-host-modules/tree/workstation-17.0.2
Not Used, different method: https://docs.fedoraproject.org/en-US/quick-docs/vmware-what-is-it/


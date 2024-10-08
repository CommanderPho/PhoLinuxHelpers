#diba-lab-workstation #fedora #linux #nvidia 
0000:91:00.0 VGA compatible controller: NVIDIA Corporation GP106GL [Quadro P2200] (rev a1)
```bash
[halechr@LNX00052 ~]$ sudo dnf install akmod-nvidia  
Last metadata expiration check: 0:03:46 ago on Wed 28 Jun 2023 10:13:58 AM EDT.  
Package akmod-nvidia-3:535.54.03-1.fc37.x86_64 is already installed.  
Dependencies resolved.  
Nothing to do.  
Complete!  
[halechr@LNX00052 ~]$ sudo dnf install xorg-x11-drv-nvidia-cuda
[halechr@LNX00052 ~]$ modinfo -F version nvidia  
535.54.03
```

```
[halechr@LNX00052 ~]$ sudo dd if=/dev/zero of=/newswap bs=1024 count=15616000  
15616000+0 records in  
15616000+0 records out  
15990784000 bytes (16 GB, 15 GiB) copied, 35.2198 s, 454 MB/s
mkswap /newswap
```

## Post fstab fixing permissions/ownership

`sudo chown -R halechr:umhs_users gor01/`


```bash
sudo chown -R halechr:umhs_users /media/halechr/MAX/
sudo chown -R halechr:umhs_users /media/halechr/BETAMAX/

## Skip the timeshift and other permissions sensitive directories
sudo chown -R halechr:umhs_users /media/halechr/MAX/Data/
sudo chown -R halechr:umhs_users /media/halechr/MAX/cloud/
sudo chown -R halechr:umhs_users /media/halechr/MAX/Personal/
sudo chown -R halechr:umhs_users /media/halechr/MAX/Projects/
sudo chown -R halechr:umhs_users /media/halechr/MAX/SlowSwap/
sudo chown -R halechr:umhs_users /media/halechr/MAX/VMs/

sudo chown -R halechr:umhs_users /media/halechr/MAX/tmp/
sudo chown -R halechr:umhs_users /media/halechr/MAX/.*

rm -r /tmp/

sudo chown halechr:umhs_users /media/halechr/MAX/

sudo chown halechr:umhs_users /media/halechr/BETAMAX
sudo chown -R halechr:umhs_users /media/halechr/BETAMAX/Data/
```


# FStab Settup
```bash
halechr@LNX00052:~$ sudo blkid
[sudo] password for halechr: 
/dev/nvme0n1p1: UUID="9668-28A2" TYPE="vfat" PARTLABEL="EFI System Partition" PARTUUID="4ca7d55d-32aa-493c-bb74-7d42812a5871"
/dev/nvme0n1p2: UUID="756b5e3c-5bed-4a1e-9c8b-5d7d466c72b3" TYPE="ext4" PARTUUID="dbb34002-3253-4125-9bd7-e8246fa0a9dc"
/dev/nvme0n1p3: UUID="26BWuc-T1gO-FEGE-Sfa4-yR0r-mVTd-06p5gD" TYPE="LVM2_member" PARTUUID="fbe5a93c-b898-42f9-8da7-7f0a6748c958"
/dev/sda1: LABEL="MAX" UUID="655c1eb8-c299-46d7-a4a0-59578491d804" TYPE="ext4" PARTUUID="6efd1cdd-82d3-4c38-aded-97042c77e407"
/dev/sdb2: LABEL="HugePort" UUID="FC74-0E8A" TYPE="exfat" PARTLABEL="Basic data partition" PARTUUID="944d8de6-07ec-479a-959e-0427cc154e19"
/dev/sdc1: UUID="42AA-A6FC" TYPE="vfat" PARTLABEL="EFI System Partition" PARTUUID="6203873e-76a4-4719-9c67-833492008061"
/dev/sdc2: UUID="768073c8-216d-4c2f-9317-5d41e997b9c7" TYPE="ext4" PARTUUID="d08a960d-822b-4961-8118-98859d1e22aa"
/dev/sdc3: LABEL="FedoraSSD" UUID="8d738d05-b51b-46b0-9cb8-3319de2be30f" UUID_SUB="1d23e8d1-b795-43b2-b0bd-c822c1fbeb14" TYPE="btrfs" PARTUUID="d51748ce-d2da-42b4-93e9-ddd6d2ff8084"
/dev/mapper/vg0-swapvol: UUID="d9b175d9-1adc-4d28-bb47-714d2a70505f" TYPE="swap"
/dev/mapper/vg0-rootvol: UUID="b8b0bfe9-1420-4533-8740-c05f2fc76c74" TYPE="ext4"
/dev/mapper/vg0-homevol: UUID="48bf92d9-0045-469c-a4e1-b9a6f83f19cc" TYPE="ext4"
/dev/mapper/vg0-appvol: UUID="0b3dab9c-5043-4911-8c05-3bc01c415017" TYPE="ext4"
/dev/mapper/vg0-tmpvol: UUID="9e91a049-ba39-4ef9-b6f4-2c2c63caccb2" TYPE="ext4"
/dev/mapper/vg0-varvol: UUID="17f83ea4-9516-4324-afad-036eea0a84b0" TYPE="ext4"
/dev/mapper/vg0-varlogvol: UUID="2d494f6f-9c3c-43f0-9a58-3f986c0cb1e3" TYPE="ext4"
/dev/mapper/vg0-varlogauditvol: UUID="cfa07a55-cc57-4a5a-b680-5bcf52b47fc8" TYPE="ext4"
/dev/mapper/vg0-vartmpvol: UUID="39da4dd1-5edd-4435-9863-33515e4b7182" TYPE="ext4"
```

# Old Fedora System
```bash
#
# /etc/fstab
# Created by anaconda on Wed May 17 11:39:18 2023
#
# Accessible filesystems, by reference, are maintained under '/dev/disk/'.
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info.
#
# After editing this file, run 'systemctl daemon-reload' to update systemd
# units generated from this file.
#
UUID=8d738d05-b51b-46b0-9cb8-3319de2be30f                /                btrfs   subvol=root,compress=zstd:1                                                         0 0 
UUID=768073c8-216d-4c2f-9317-5d41e997b9c7                /boot            ext4    defaults                                                                            1 2 
UUID=42AA-A6FC                                           /boot/efi        vfat    umask=0077,shortname=winnt                                                          0 2 
UUID=8d738d05-b51b-46b0-9cb8-3319de2be30f                /home            btrfs   subvol=home,compress=zstd:1                                                         0 0 
/dev/disk/by-uuid/655c1eb8-c299-46d7-a4a0-59578491d804   /media/MAX       auto    nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=MAX                                     0 0 
#/dev/disk/by-uuid/FC74-0E8A /media/HugePort auto nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=HugePort 0 0
/dev/disk/by-id/wwn-0x5000cca2b3c44b29-part1             /mnt/BETAMAX     auto    nosuid,nodev,nofail,x-gvfs-name=BETAMAX,x-gvfs-show                                 0 0 
/dev/disk/by-id/wwn-0x5000cca2b3c3f6f7-part1             /mnt/GAMMAMAX    auto    nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=GAMMAMAX                                0 0 
/dev/disk/by-uuid/FC74-0E8A                              /mnt/DELTAMAX    exfat   uid=1000,gid=1002,umask=0002,nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=DELTAMAX   0 0 
/dev/nvme0n1p3                                           /mnt/SecondSSD   auto    nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=Fedora37SSD                             0 0 
/dev/nvme0n1p2                                           none             ext4    noauto                                                                              0 0 



```


# New Ubuntu System
```bash
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
/dev/mapper/vg0-rootvol /               ext4    errors=remount-ro 0       1
/dev/mapper/vg0-appvol /app            ext4    nodev           0       2
# /boot was on /dev/nvme0n1p2 during installation
UUID=756b5e3c-5bed-4a1e-9c8b-5d7d466c72b3 /boot           ext4    defaults        0       2
# /boot/efi was on /dev/nvme0n1p1 during installation
UUID=9668-28A2  /boot/efi       vfat    umask=0077      0       1
/dev/mapper/vg0-homevol /home           ext4    nodev           0       2
/dev/mapper/vg0-tmpvol /tmp            ext4    nodev,nosuid    0       2
/dev/mapper/vg0-varvol /var            ext4    nodev           0       2
/dev/mapper/vg0-varlogvol /var/log        ext4    nodev           0       2
/dev/mapper/vg0-varlogauditvol /var/log/audit  ext4    nodev           0       2
/dev/mapper/vg0-vartmpvol /var/tmp        ext4    nodev,nosuid,noexec 0       2
/dev/mapper/vg0-swapvol none            swap    sw              0       0
tmpfs                   /dev/shm        tmpfs   defaults,nodev,nosuid,noexec  0 0
/dev/disk/by-uuid/655c1eb8-c299-46d7-a4a0-59578491d804   /media/halechr/MAX       auto    nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=MAX                                     0 0 
/dev/disk/by-uuid/FC74-0E8A /media/halechr/HugePort auto nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=HugePort 0 0
/dev/disk/by-uuid/8d738d05-b51b-46b0-9cb8-3319de2be30f /media/halechr/FedoraSSD btrfs nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=FedoraSSD 0 0
```

## New entries
```bash
/dev/disk/by-uuid/655c1eb8-c299-46d7-a4a0-59578491d804   /media/halechr/MAX       auto    nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=MAX                                     0 0 
/dev/disk/by-uuid/FC74-0E8A /media/halechr/HugePort auto nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=HugePort 0 0
/dev/disk/by-uuid/8d738d05-b51b-46b0-9cb8-3319de2be30f /media/halechr/FedoraSSD btrfs nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=FedoraSSD 0 0
```

/dev/sda1: LABEL="MAX" UUID="655c1eb8-c299-46d7-a4a0-59578491d804" TYPE="ext4" PARTUUID="6efd1cdd-82d3-4c38-aded-97042c77e407"
/dev/sdb2: LABEL="HugePort" UUID="FC74-0E8A" TYPE="exfat" PARTLABEL="Basic data partition" PARTUUID="944d8de6-07ec-479a-959e-0427cc154e19"


/dev/sdc3: LABEL="FedoraSSD" UUID="8d738d05-b51b-46b0-9cb8-3319de2be30f" UUID_SUB="1d23e8d1-b795-43b2-b0bd-c822c1fbeb14" TYPE="btrfs" PARTUUID="d51748ce-d2da-42b4-93e9-ddd6d2ff8084"

# 2024-06-05  Ubuntu
```
[root@RDLU0039 ~]# blkid
/dev/mapper/vg0-homevol: UUID="0d4c9892-97e5-466f-8194-a3ed568b376a" BLOCK_SIZE="4096" TYPE="ext4"
/dev/nvme0n1p3: UUID="Bc4i4d-YU7N-yTUn-1yWw-6HQ4-6LcE-Awf5k3" TYPE="LVM2_member" PARTUUID="f0c7e95d-95ed-4f3d-93cd-281060f9ba42"
/dev/nvme0n1p1: UUID="9462-8F27" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="4a719091-2609-471a-a442-05dba9151cc0"
/dev/nvme0n1p2: UUID="e9cebfc5-4b22-4227-8dea-0c5cab7a8a86" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="0cdd11fb-4f90-43bf-a1e6-470e371da187"
/dev/mapper/vg0-swapvol: UUID="9265889d-d345-4a19-a01a-bf9dd504eb9b" TYPE="swap"
/dev/sdb1: LABEL="MAX" UUID="655c1eb8-c299-46d7-a4a0-59578491d804" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="6efd1cdd-82d3-4c38-aded-97042c77e407"
/dev/mapper/vg0-tmpvol: UUID="57d254ef-80a7-43de-8a82-61a35bd8b647" BLOCK_SIZE="4096" TYPE="ext4"
/dev/mapper/vg0-varlogauditvol: UUID="8b7542a3-636f-446f-96e0-047eec6a528c" BLOCK_SIZE="4096" TYPE="ext4"
/dev/mapper/vg0-varvol: UUID="910e60c5-49ca-4303-8742-a0aedf6234e7" BLOCK_SIZE="4096" TYPE="ext4"
/dev/mapper/vg0-rootvol: UUID="fd7dc5d0-b795-410c-8837-e123b1e35d9c" BLOCK_SIZE="4096" TYPE="ext4"
/dev/mapper/vg0-vartmpvol: UUID="dd7487db-c9ea-493f-920a-28e0248ee0e8" BLOCK_SIZE="4096" TYPE="ext4"
/dev/sda1: LABEL="BETAMAX" UUID="acda4d22-a98d-45ed-9900-ba558ff39b6b" UUID_SUB="6fc36168-d691-40db-80cd-304495a7d77a" BLOCK_SIZE="4096" TYPE="btrfs" PARTUUID="7f4de437-8e65-da43-9d21-950dbcc63ce2"
/dev/mapper/vg0-appvol: UUID="f2316726-c854-4474-843a-1a335178536e" BLOCK_SIZE="4096" TYPE="ext4"
/dev/mapper/vg0-varlogvol: UUID="7d934058-ebee-47f2-8a8f-7d756b433b1e" BLOCK_SIZE="4096" TYPE="ext4"

/dev/disk/by-uuid/655c1eb8-c299-46d7-a4a0-59578491d804   /media/halechr/MAX       auto    nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=MAX                                     0 0 
/dev/disk/by-uuid/FC74-0E8A /media/halechr/HugePort auto nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=HugePort 0 0


/dev/loop1: TYPE="squashfs"
/dev/loop19: TYPE="squashfs"
/dev/loop17: TYPE="squashfs"
/dev/loop8: TYPE="squashfs"
/dev/loop15: TYPE="squashfs"
/dev/loop6: TYPE="squashfs"
/dev/loop13: TYPE="squashfs"
/dev/loop4: TYPE="squashfs"
/dev/loop21: TYPE="squashfs"
/dev/loop11: TYPE="squashfs"
/dev/loop2: TYPE="squashfs"
/dev/loop0: TYPE="squashfs"
/dev/loop18: TYPE="squashfs"
/dev/loop9: TYPE="squashfs"
/dev/loop16: TYPE="squashfs"
/dev/loop7: TYPE="squashfs"
/dev/loop14: TYPE="squashfs"
/dev/loop5: TYPE="squashfs"
/dev/loop22: TYPE="squashfs"
/dev/loop12: TYPE="squashfs"
/dev/loop3: TYPE="squashfs"
/dev/loop20: TYPE="squashfs"
/dev/loop10: TYPE="squashfs"
```
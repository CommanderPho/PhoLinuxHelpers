lsblk

```
NAME                   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda                      8:0    0  14.6T  0 disk 
└─sda1                   8:1    0  14.6T  0 part /media/MAX
nvme0n1                259:0    0 953.9G  0 disk 
├─nvme0n1p1            259:1    0   200M  0 part /boot/efi
├─nvme0n1p2            259:2    0     1G  0 part /boot
├─nvme0n1p3            259:3    0     8G  0 part [SWAP]
└─nvme0n1p4            259:4    0 944.7G  0 part 
  ├─vg0-rootvol        253:0    0    24G  0 lvm  /
  ├─vg0-vartmpvol      253:1    0     2G  0 lvm  /var/tmp
  ├─vg0-varlogauditvol 253:2    0     2G  0 lvm  /var/log/audit
  ├─vg0-varlogvol      253:3    0     4G  0 lvm  /var/log
  ├─vg0-varvol         253:4    0    10G  0 lvm  /var
  ├─vg0-tmpvol         253:5    0     8G  0 lvm  /tmp
  ├─vg0-appvol         253:6    0    99G  0 lvm  /app
  └─vg0-homevol        253:7    0   425G  0 lvm  /home
```

# I want to target `vg0-rootvol`
/dev/mapper/VG_NAME-LV_NAME

sudo umount /dev/mapper/VG_NAME-LV_NAME
sudo lvresize /dev/mapper/VG_NAME-LV_NAME --size +10G
sudo resize2fs /dev/mapper/VG_NAME-LV_NAME
sudo mount /dev/mapper/VG_NAME-LV_NAME /mount/point


```bash
#!/bin/bash

# Function to resize an LVM2 partition
# Usage: resize_lvm_partition <lvm_partition_name> <size_to_add>
resize_lvm_partition() {
    local lvm_partition_name="$1"
    local size_to_add="$2"

    # Unmount the partition
    sudo umount "/dev/mapper/$lvm_partition_name"

    # Resize the logical volume
    sudo lvresize "/dev/mapper/$lvm_partition_name" --size "+$size_to_add"

    # Resize the file system
    sudo resize2fs "/dev/mapper/$lvm_partition_name"

    # Mount the partition
    sudo mount "/dev/mapper/$lvm_partition_name" "/mount/point"

    # Print a success message
    echo "LVM partition $lvm_partition_name resized successfully."
}
```

# Usage
```
# Resize the LVM2 partition 'vg0-rootvol' and add 10GB to it
resize_lvm_partition "vg0-rootvol" "10G"
```


https://www.linuxjournal.com/content/review-gui-lvm-tools


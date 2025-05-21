

## The following works to mount the two shares on macOS in the ~/cloud/* folders:
- Must be VPN'd in:

sshfs -o allow_other,defer_permissions "halechr@greatlakes-xfer.arc-ts.umich.edu:/nfs/dataden/umms-dibalab/" "/Users/pho/cloud/locker_dataDen"
sshfs -o allow_other,defer_permissions "halechr@greatlakes-xfer.arc-ts.umich.edu:/nfs/turbo/umms-kdiba/" "/Users/pho/cloud/turbo"




sshfs -o ServerAliveInterval=45,ServerAliveCountMax=2,reconnect,allow_other,defer_permissions "halechr@greatlakes-xfer.arc-ts.umich.edu:/nfs/turbo/umms-kdiba/" "/Users/pho/cloud/turbo"


-o 



## To Unmount:
diskutil umount force ~/cloud/locker_dataDen
diskutil umount force ~/cloud/turbo


## Other Info/Notes:

greatlakes-xfer.arc-ts.umich.edu
/nfs/dataden/umms-dibalab/

sshfs "halechr@greatlakes.arc-ts.umich.edu:/nfs/turbo/umms-kdiba/" "${CLOUD_BASE_PATH}/turbo"
sshfs  -odebug,sshfs_debug,loglevel=debug "halechr@greatlakes-oncampus.arc-ts.umich.edu:/nfs/dataden/umms-dibalab/" "/Users/pho/cloud/locker_dataDen"
sshfs "halechr@greatlakes.arc-ts.umich.edu:/nfs/turbo/umms-kdiba/" "/Users/pho/cloud/turbo"

How can I conditionally modify the `-o` arguments to sshfs in my bash function on macOS? I'd like it to run with `-o ServerAliveInterval=45,ServerAliveCountMax=2,reconnect,allow_other,defer_permissions` on mac and `-o reconnect` otherwise?
```bash
mount_sshfs_cloud_drive () {
    local remote="$1"
    local mount_location="$2"
    if mountpoint -q "$mount_location"; then
        return 0
        # echo "The mount point is already mounted: $mount_location"
    else
        mkdir -p "$mount_location"
        sshfs "$remote" "$mount_location" -o reconnect
    fi
}
```


mount_turbo () {
    # Turbo via Greatlakes:
    mount_sshfs_cloud_drive "halechr@greatlakes.arc-ts.umich.edu:/nfs/turbo/umms-kdiba/" "${CLOUD_SSD_BASE_PATH}/turbo"
    echo turbo mounted at "${CLOUD_SSD_BASE_PATH}/turbo"
    return 0
}

mount_locker_dataDen () {
    # Locker DataDen via Greatlakes:
    mount_sshfs_cloud_drive "halechr@greatlakes-oncampus.arc-ts.umich.edu:/nfs/dataden/umms-dibalab" "${CLOUD_SSD_BASE_PATH}/locker_dataDen"
    echo locker_dataDen mounted at "${CLOUD_SSD_BASE_PATH}/locker_dataDen via ssh through greatlakes"
    return 0
}
How can I conditionally modify the `-o` arguments to sshfs in my bash function on macOS? I'd like it to run with `-o ServerAliveInterval=45,ServerAliveCountMax=2,reconnect,allow_other,defer_permissions` on mac and `-o reconnect` otherwise?
```bash
mount_sshfs_cloud_drive () {
    local remote="$1"
    local mount_location="$2"
    if mountpoint -q "$mount_location"; then
        return 0
        # echo "The mount point is already mounted: $mount_location"
    else
        mkdir -p "$mount_location"
        sshfs "$remote" "$mount_location" -o reconnect
    fi
}
```

To conditionally modify the -o arguments to sshfs depending on if you are running the script on macOS, you can use the uname command to determine the operating system. You could use a bash function like this:

mount_sshfs_cloud_drive () {
    local remote="$1"
    local mount_location="$2"

    if mountpoint -q "$mount_location"; then
        echo "The mount point is already mounted: $mount_location"
        return 0
    else
        mkdir -p "$mount_location"

        # Check the operating system
        local os_name=$(uname)

        local sshfs_args="-o reconnect"

        # If this is macOS, change the sshfs options
        if [ "$os_name" = "Darwin" ]; then
            sshfs_args="-o ServerAliveInterval=45,ServerAliveCountMax=2,reconnect,allow_other,defer_permissions"
        fi

        # Now run sshfs with the configured arguments
        sshfs "$remote" "$mount_location" $sshfs_args
    fi
}
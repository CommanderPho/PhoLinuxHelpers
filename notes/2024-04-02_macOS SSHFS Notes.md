

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
https://github.com/CommanderPho/sshfs

module load code-server boost clang cmake gcc 

git clone https://github.com/CommanderPho/sshfs ~/repos/sshfs

ssh halechr@greatlakes-xfer.arc-ts.umich.edu

/nfs/dataden/umms-dibalab


```bash
mount_locker_dataDen_GL () {
    local CLOUD_BASE_PATH=${1:-"/home/halechr/cloud"} # Provides a default value if no argument is passed
    # local CLOUD_BASE_PATH=${1:-"/media/halechr/MAX/cloud"} # Provides a default value if no argument is passed
	unmount_cloud_drive "${CLOUD_BASE_PATH}/locker_dataDen"
    # Locker DataDen via Greatlakes:
    # mount_sshfs_cloud_drive "halechr@greatlakes-oncampus.arc-ts.umich.edu:/nfs/dataden/umms-dibalab" "${CLOUD_SSD_BASE_PATH}/locker_dataDen"
	mount_cloud_drive "DataDenOnCampus:" "${CLOUD_BASE_PATH}/locker_dataDen" "${CLOUD_BASE_PATH}/logs/rclone_deamon_DataDenOnCampus.log"
    echo locker_dataDen mounted at "${CLOUD_BASE_PATH}/locker_dataDen via RClone"
    return 0
}

[LockerDDOnGreatlakes]
type = sftp
host = greatlakes-xfer.arc-ts.umich.edu
pass = QxH3DgWZZJsUZ1xSbB9D_WkG4YUWskTMCy16uY5hJgI
ask_password = true
path_override = /nfs/dataden/umms-dibalab
shell_type = unix



```
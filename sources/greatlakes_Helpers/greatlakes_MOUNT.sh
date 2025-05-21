#!/bin/bash

# greatlakes_MOUNT.sh

## Old Greatlakes Mount Script:
# RClone Info:
# --cache-dir string                   Directory rclone will use for caching.
# --vfs-cache-mode CacheMode           Cache mode off|minimal|writes|full (default off)
# --vfs-cache-max-age duration         Max age of objects in the cache (default 1h0m0s)
# --vfs-cache-max-size SizeSuffix      Max total size of objects in the cache (default off)
# --vfs-cache-poll-interval duration   Interval to poll the cache for stale objects (default 1m0s)
# --vfs-write-back duration            Time to writeback files after last use when using cache (default 5s)

# module load archivetar rclone 
# MOUNT_LOCATION="${HOME}/cloud/GDrive_Diba_Shared"
# mkdir -p "${MOUNT_LOCATION}"
# rclone mount --cache-dir '/tmpssd' --vfs-cache-mode writes Diba_Lab_Shared_GDrive: /home/halechr/cloud/GDrive_Diba_Shared&

# MOUNT_LOCATION="${HOME}/cloud/Dropbox_Diba_Shared"
# mkdir -p "${MOUNT_LOCATION}"
# rclone mount Diba_Lab_UMich_Dropbox: /home/halechr/cloud/Dropbox_Diba_Shared&

# source "$HOME/repos/PhoLinuxHelpers/sources/greatlakes_Helpers/greatlakes_MOUNT.sh"

# export NEPTUNE_API_TOKEN="eyJhcGlfYWRkcmVzcyI6Imh0dHBzOi8vYXBwLm5lcHR1bmUuYWkiLCJhcGlfdXJsIjoiaHR0cHM6Ly9hcHAubmVwdHVuZS5haSIsImFwaV9rZXkiOiIxOGIxODU2My1lZTNhLTQ2ZWMtOTkzNS02ZTRmNzM5YmNjNjIifQ=="
# export NEPTUNE_PROJECT="commander.pho/PhoDibaLongShort2023"

# # on GreatLakes, turbo is accessible at:
# ln -s /nfs/turbo/umms-kdiba/ ~/cloud/turbo


module load rclone
# module load archivetar
export CLOUD_BASE_PATH="${HOME}/cloud" # for greatlakes
source "$HOME/repos/PhoLinuxHelpers/sources/mounting_cloud_drives.sh" # /home/halechr/repos/PhoLinuxHelpers


mount_locker_dataDen_GL () {
    local CLOUD_BASE_PATH=${1:-"${HOME}/cloud"} # Provides a default value if no argument is passed
    # local CLOUD_BASE_PATH=${1:-"/media/halechr/MAX/cloud"} # Provides a default value if no argument is passed
	# unmount_cloud_drive "${CLOUD_BASE_PATH}/locker_dataDen"
    # Locker DataDen via Greatlakes:
    # mount_sshfs_cloud_drive "halechr@greatlakes-oncampus.arc-ts.umich.edu:/nfs/dataden/umms-dibalab" "${CLOUD_SSD_BASE_PATH}/locker_dataDen"
	mount_cloud_drive "DataDenOnCampus:" "${CLOUD_BASE_PATH}/locker_dataDen" "${CLOUD_BASE_PATH}/logs/rclone_deamon_DataDenOnCampus.log"
    echo locker_dataDen mounted at "${CLOUD_BASE_PATH}/locker_dataDen via RClone"
    return 0
}


mount_locker_dataDen_GL


# mount_all_cloud_drives "$CLOUD_BASE_PATH" # run mount_all_cloud_drives
# mount_cloud_drive "Diba_Lab_Shared_GDrive:" "${CLOUD_BASE_PATH}/GDrive_Diba_Shared" "${CLOUD_BASE_PATH}/logs/rclone_deamon_GDrive_Diba_Shared.log"
mount_cloud_drive "Diba_Lab_UMich_Dropbox:" "${CLOUD_BASE_PATH}/Dropbox_Diba_Shared" "${CLOUD_BASE_PATH}/logs/rclone_deamon_Dropbox_Diba_Shared.log"
# Personal UMich GDrive
# mount_cloud_drive "halechr_GDrive:" "${CLOUD_BASE_PATH}/GDrive_Pho_UMich" "${CLOUD_BASE_PATH}/logs/rclone_deamon_GDrive_Pho_UMich.log"

# on GreatLakes, turbo is accessible at:
# ln -s /nfs/turbo/umms-kdiba/ ~/cloud/turbo
mount_symlinked_drive /nfs/turbo/umms-kdiba/ "${CLOUD_BASE_PATH}/turbo"
# on GreatLakes, DataDen/Locker is accessible at:
# ln -s /nfs/dataden/umms-dibalab ~/cloud/locker_dataDen
mount_symlinked_drive /nfs/dataden/umms-dibalab "${CLOUD_BASE_PATH}/locker_dataDen"


# source "$HOME/repos/PhoLinuxHelpers/sources/greatlakes_Helpers/greatlakes_MOUNT.sh"
# . "$HOME/MOUNT_CLOUD.sh"
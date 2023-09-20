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



export CLOUD_BASE_PATH="${HOME}/cloud" # for greatlakes
source "$HOME/repos/PhoLinuxHelpers/sources/mounting_cloud_drives.sh" # /home/halechr/repos/PhoLinuxHelpers
# mount_all_cloud_drives "$CLOUD_BASE_PATH" # run mount_all_cloud_drives
mount_cloud_drive "Diba_Lab_Shared_GDrive:" "${CLOUD_BASE_PATH}/GDrive_Diba_Shared" "${CLOUD_BASE_PATH}/logs/rclone_deamon_GDrive_Diba_Shared.log"
mount_cloud_drive "Diba_Lab_UMich_Dropbox:" "${CLOUD_BASE_PATH}/Dropbox_Diba_Shared" "${CLOUD_BASE_PATH}/logs/rclone_deamon_Dropbox_Diba_Shared.log"



# source "$HOME/repos/PhoLinuxHelpers/sources/greatlakes_Helpers/greatlakes_MOUNT.sh"
# . "$HOME/MOUNT_CLOUD.sh"
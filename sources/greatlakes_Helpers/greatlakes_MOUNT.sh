#!/bin/bash

# greatlakes_MOUNT.sh
export CLOUD_BASE_PATH="${HOME}/cloud" # for greatlakes
source "$HOME/repos/PhoLinuxHelpers/sources/mounting_cloud_drives.sh" # /home/halechr/repos/PhoLinuxHelpers
# mount_all_cloud_drives "$CLOUD_BASE_PATH" # run mount_all_cloud_drives
mount_cloud_drive "Diba_Lab_Shared_GDrive:" "${CLOUD_BASE_PATH}/GDrive_Diba_Shared" "${CLOUD_BASE_PATH}/logs/rclone_deamon_GDrive_Diba_Shared.log"
mount_cloud_drive "Diba_Lab_UMich_Dropbox:" "${CLOUD_BASE_PATH}/Dropbox_Diba_Shared" "${CLOUD_BASE_PATH}/logs/rclone_deamon_Dropbox_Diba_Shared.log"



# source "$HOME/repos/PhoLinuxHelpers/sources/greatlakes_Helpers/greatlakes_MOUNT.sh"
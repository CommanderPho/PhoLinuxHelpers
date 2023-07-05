#!/bin/bash

# Set the base path for cloud drives:
# Uncomment one of the following lines to choose the base path.
CLOUD_BASE_PATH="/media/MAX/cloud"
# CLOUD_BASE_PATH="${HOME}/cloud"
mkdir -p "${CLOUD_BASE_PATH}"

# ps aux | grep rclone
rclone_deamon_log_file_path="${CLOUD_BASE_PATH}/logs"
mkdir -p "$rclone_deamon_log_file_path"


is_cloud_drive_mounted () {
	local remote="$1"
    local mount_location="$2"
	if mountpoint -q "$mount_location"; then
        return 1
        echo "The mount point is already mounted: $mount_location"
    else
		# Not mounted
		return 0
    fi
}

mount_cloud_drive () {
    local remote="$1"
    local mount_location="$2"
    local rclone_deamon_log_file_location="$3"
    if mountpoint -q "$mount_location"; then
        return 0
        # echo "The mount point is already mounted: $mount_location"
    else
        mkdir -p "$mount_location"
        rclone  --vfs-cache-mode writes mount --daemon "$remote" "$mount_location" --log-file="$rclone_deamon_log_file_location" --log-format=pid --network-mode
        # ` --vfs-cache-mode writes` this part caches files to be written locally, allowing your remote to be used/read while a write is occuring
    fi
}

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

unmount_cloud_drive () {
    # Force unmount:
    # The umount operation may fail, for example when the mount point is busy. When that happens, you can stop the mount manually using command:
    local mount_location="$1"
    fusermount -u "$mount_location"
}

unmount_all_cloud_drives () {
    local CLOUD_BASE_PATH=${1:-"/media/MAX/cloud"} # Provides a default value if no argument is passed
    # Unmount Cloud Drives:
    unmount_cloud_drive "${CLOUD_BASE_PATH}/GDrive_Diba_Shared"
    unmount_cloud_drive "${CLOUD_BASE_PATH}/Dropbox_Diba_Shared"
    unmount_cloud_drive "${CLOUD_BASE_PATH}/Dropbox_Personal"
    unmount_cloud_drive "${CLOUD_BASE_PATH}/turbo"
    unmount_cloud_drive "${CLOUD_BASE_PATH}/greatlakes"
}


# Shorcuts for remounting individual cloud drives:
remount_cloud_drive_PhoPersonalDropbox () {
    local CLOUD_BASE_PATH=${1:-"/media/MAX/cloud"} # Provides a default value if no argument is passed
    unmount_cloud_drive "${CLOUD_BASE_PATH}/Dropbox_Personal"
    mount_cloud_drive "Pho_Personal_Dropbox:" "${CLOUD_BASE_PATH}/Dropbox_Personal" "${CLOUD_BASE_PATH}/logs/rclone_deamon_Dropbox_Personal.log"
    is_cloud_drive_mounted "Pho_Personal_Dropbox:" "${CLOUD_BASE_PATH}/Dropbox_Personal"
}


mount_all_cloud_drives () {
    local CLOUD_BASE_PATH=${1:-"/media/MAX/cloud"} # Provides a default value if no argument is passed
    # Mount Cloud Drives:
    mount_cloud_drive "Diba_Lab_Shared_GDrive:" "${CLOUD_BASE_PATH}/GDrive_Diba_Shared" "${CLOUD_BASE_PATH}/logs/rclone_deamon_GDrive_Diba_Shared.log"
    mount_cloud_drive "Diba_Lab_UMich_Dropbox:" "${CLOUD_BASE_PATH}/Dropbox_Diba_Shared" "${CLOUD_BASE_PATH}/logs/rclone_deamon_Dropbox_Diba_Shared.log"
    # Personal Dropbox:
    mount_cloud_drive "Pho_Personal_Dropbox:" "${CLOUD_BASE_PATH}/Dropbox_Personal" "${CLOUD_BASE_PATH}/logs/rclone_deamon_Dropbox_Personal.log"
    # # Turbo via Greatlakes:
    # mount_sshfs_cloud_drive "halechr@greatlakes.arc-ts.umich.edu:/nfs/turbo/umms-kdiba/" "${CLOUD_BASE_PATH}/turbo"
    # # Greatlakes:
    # mount_sshfs_cloud_drive "halechr@greatlakes.arc-ts.umich.edu:" "${CLOUD_BASE_PATH}/greatlakes"
}

mount_turbo () {
    # Turbo via Greatlakes:
    mount_sshfs_cloud_drive "halechr@greatlakes.arc-ts.umich.edu:/nfs/turbo/umms-kdiba/" "${CLOUD_BASE_PATH}/turbo"
}

mount_greatlakes () {
    # Greatlakes:
    mount_sshfs_cloud_drive "halechr@greatlakes.arc-ts.umich.edu:" "${CLOUD_BASE_PATH}/greatlakes"
}

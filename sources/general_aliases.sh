#!/bin/bash


function move_folder_to_external_drive() {
    # move_folder_to_external_drive /path/to/folder

    # get the path to the folder to be moved
    local folder_path=$1

    # move the folder to the external drive
    mv "$folder_path" /media/MAX/SlowSwap/

    # create a symbolic link to the new location
    ln -s /media/MAX/SlowSwap/"$(basename "$folder_path")" "$folder_path"
}


list_all_rclone_processes () {
    ps aux | grep rclone
}

function ssh_supercomputer () {
    ssh halechr@greatlakes.arc-ts.umich.edu
}

# Linux unlock gnome keyring
function unlock-keyring ()
{
    read -rsp "Password: " pass
    export $(echo -n "$pass" | gnome-keyring-daemon --replace --unlock)
    unset pass
}


function cryptomator () {
    ./home/halechr/bin/cryptomator-1.8.0-x86_64.AppImage
}
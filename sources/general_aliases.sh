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


# Linux unlock gnome keyring
function unlock-keyring ()
{
    read -rsp "Password: " pass
    export $(echo -n "$pass" | gnome-keyring-daemon --replace --unlock)
    unset pass
}


function cryptomator () {
    # ./home/halechr/bin/cryptomator should be a symbolic link pointing to an AppImage in the versions folder like ./home/halechr/bin/versions/cryptomator-1.8.0-x86_64.AppImage
    ./home/halechr/bin/cryptomator
}

function restart_display () {
    # Restarts the display server when it has frozen
    # https://askubuntu.com/questions/663701/how-to-restart-kde-5-interface/663702#663702
    # https://www.reddit.com/r/kde/comments/10ka4h8/how_to_restart_plasma_with_script/
    # systemctl --user restart plasma-plasmashell

    # kstart5 plasmashell
    # For KDE > 5.10
    kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell
}
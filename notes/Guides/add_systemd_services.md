
# https://unix.stackexchange.com/questions/445688/coreos-run-a-custom-script-only-once-at-boot-time


# NOTES: Cannot start executables in the user's home directory (such as scripts) located there due to SELinux permissions. :[
https://serverfault.com/questions/957084/failed-at-step-exec-spawning-permission-denied
Gives errors like this:
× pho_mount_all_cloud.service - Mounts all cloud volumes on startup (only once)
     Loaded: loaded (/etc/systemd/system/pho_mount_all_cloud.service; enabled; preset: disabled)
     Active: failed (Result: exit-code) since Fri 2023-05-26 09:49:20 EDT; 2h 13min ago
   Duration: 23ms
    Process: 1029 ExecStart=/home/halechr/bin/pho_linux_helper_scripts/perform_mount_all_cloud_drives.sh (code=exited, status=203/EXEC)
   Main PID: 1029 (code=exited, status=203/EXEC)
        CPU: 952us

May 26 09:49:20 lnx00052 systemd[1]: Started pho_mount_all_cloud.service - Mounts all cloud volumes on startup (only once).
May 26 09:49:20 lnx00052 (rives.sh)[1029]: pho_mount_all_cloud.service: Failed to locate executable /home/halechr/bin/pho_linux_helper_scripts/perform_mount_all_cloud_drives.sh: Permission denied
May 26 09:49:20 lnx00052 (rives.sh)[1029]: pho_mount_all_cloud.service: Failed at step EXEC spawning /home/halechr/bin/pho_linux_helper_scripts/perform_mount_all_cloud_drives.sh: Permission denied
May 26 09:49:20 lnx00052 systemd[1]: pho_mount_all_cloud.service: Main process exited, code=exited, status=203/EXEC
May 26 09:49:20 lnx00052 systemd[1]: pho_mount_all_cloud.service: Failed with result 'exit-code'.


# Removing:
https://www.baeldung.com/linux/create-remove-systemd-services


# 2023-05-26 - Found that it's easier to use the built in KDE login autolaunch settings to launch scripts.





----




----

/etc/systemd/system/yourservice.service

[Unit]
Description=your service name

[Service]
Type=oneshot #or simple
ExecStart=/path/to/your/script.py

[Install]
WantedBy=multi-user.target


sudo systemctl enable yourservice.service --now


#####################
/etc/systemd/system/pho_mount_all_cloud.service

[Unit]
Description=Mounts all cloud volumes on startup (only once)

[Service]
Type=oneshot #or simple
ExecStart=/home/halechr/bin/pho_linux_helper_scripts/perform_mount_all_cloud_drives.sh

[Install]
WantedBy=multi-user.target

sudo systemctl enable pho_mount_all_cloud.service --now



############
[Unit]
Description=Starts Cryptomator on startup to mount user volumes

[Service]
Type=oneshot #or simple
ExecStart=/path/to/your/script.py

[Install]
WantedBy=multi-user.target

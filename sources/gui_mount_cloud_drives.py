""" TODO 2023-07-05 - Close to working. Wraps the cloud drive mounting shell script in python and creates a basic GUI to show the mounts.
"""

import subprocess
import tkinter as tk
from functools import partial
from tkinter import ttk

CLOUD_BASE_PATH = "/media/MAX/cloud"

def is_cloud_drive_mounted(remote, mount_location):
    result = subprocess.run(["mountpoint", "-q", mount_location], capture_output=True)
    return result.returncode == 0

def mount_cloud_drive(remote, mount_location, rclone_deamon_log_file_location):
    if is_cloud_drive_mounted(remote, mount_location):
        return
    subprocess.run(["mkdir", "-p", mount_location])
    subprocess.run(["rclone", "--vfs-cache-mode", "writes", "mount", "--daemon", remote, mount_location, "--log-file=" + rclone_deamon_log_file_location, "--log-format=pid", "--network-mode"])

def mount_sshfs_cloud_drive(remote, mount_location):
    if is_cloud_drive_mounted(remote, mount_location):
        return
    subprocess.run(["mkdir", "-p", mount_location])
    subprocess.run(["sshfs", remote, mount_location, "-o", "reconnect"])

def unmount_cloud_drive(mount_location):
    subprocess.run(["fusermount", "-u", mount_location])

def unmount_all_cloud_drives():
    drives = [
        CLOUD_BASE_PATH + "/GDrive_Diba_Shared",
        CLOUD_BASE_PATH + "/Dropbox_Diba_Shared",
        CLOUD_BASE_PATH + "/Dropbox_Personal",
        CLOUD_BASE_PATH + "/turbo",
        CLOUD_BASE_PATH + "/greatlakes"
    ]
    for drive in drives:
        unmount_cloud_drive(drive)

def remount_cloud_drive_PhoPersonalDropbox():
    unmount_cloud_drive(CLOUD_BASE_PATH + "/Dropbox_Personal")
    mount_cloud_drive("Pho_Personal_Dropbox:", CLOUD_BASE_PATH + "/Dropbox_Personal", CLOUD_BASE_PATH + "/logs/rclone_deamon_Dropbox_Personal.log")
    if not is_cloud_drive_mounted("Pho_Personal_Dropbox:", CLOUD_BASE_PATH + "/Dropbox_Personal"):
        # handle mount failure
        pass

def mount_all_cloud_drives():
    mount_cloud_drive("Diba_Lab_Shared_GDrive:", CLOUD_BASE_PATH + "/GDrive_Diba_Shared", CLOUD_BASE_PATH + "/logs/rclone_deamon_GDrive_Diba_Shared.log")
    mount_cloud_drive("Diba_Lab_UMich_Dropbox:", CLOUD_BASE_PATH + "/Dropbox_Diba_Shared", CLOUD_BASE_PATH + "/logs/rclone_deamon_Dropbox_Diba_Shared.log")
    mount_cloud_drive("Pho_Personal_Dropbox:", CLOUD_BASE_PATH + "/Dropbox_Personal", CLOUD_BASE_PATH + "/logs/rclone_deamon_Dropbox_Personal.log")

def mount_turbo():
    mount_sshfs_cloud_drive("halechr@greatlakes.arc-ts.umich.edu:/nfs/turbo/umms-kdiba/", CLOUD_BASE_PATH + "/turbo")

def mount_greatlakes():
    mount_sshfs_cloud_drive("halechr@greatlakes.arc-ts.umich.edu:", CLOUD_BASE_PATH + "/greatlakes")

# GUI
def mount_drive(drive_func):
    try:
        drive_func()
        status_text.set("Drive mounted successfully.")
    except Exception as e:
        status_text.set(f"Failed to mount drive: {str(e)}")

def unmount_all_drives():
    try:
        unmount_all_cloud_drives()
        status_text.set("All drives unmounted successfully.")
    except Exception as e:
        status_text.set(f"Failed to unmount drives: {str(e)}")

def update_mount_status():
    for i, drive in enumerate(drives):
        mount_location = drive[1]
        if is_cloud_drive_mounted("", mount_location):
            tree.set(i, "Status", "Mounted")
        else:
            tree.set(i, "Status", "Unmounted")

root = tk.Tk()
root.title("Cloud Drive Manager")

# Table
table_frame = tk.Frame(root)
table_frame.pack(pady=10)

table_columns = ("Name", "Mount Path", "Log File Path", "Status")
tree = ttk.Treeview(table_frame, columns=table_columns, show="headings")

for col in table_columns:
    tree.heading(col, text=col)

drives = [
    ("GDrive_Diba_Shared", CLOUD_BASE_PATH + "/GDrive_Diba_Shared", CLOUD_BASE_PATH + "/logs/rclone_deamon_GDrive_Diba_Shared.log"),
    ("Dropbox_Diba_Shared", CLOUD_BASE_PATH + "/Dropbox_Diba_Shared", CLOUD_BASE_PATH + "/logs/rclone_deamon_Dropbox_Diba_Shared.log"),
    ("Dropbox_Personal", CLOUD_BASE_PATH + "/Dropbox_Personal", CLOUD_BASE_PATH + "/logs/rclone_deamon_Dropbox_Personal.log"),
    ("turbo", CLOUD_BASE_PATH + "/turbo", ""),
    ("greatlakes", CLOUD_BASE_PATH + "/greatlakes", "")
]

for i, drive in enumerate(drives):
    tree.insert("", "end", values=drive)

tree.pack()

# Buttons
button_frame = tk.Frame(root)
button_frame.pack(pady=10)

mount_button = tk.Button(button_frame, text="Mount All", command=partial(mount_drive, mount_all_cloud_drives))
mount_button.grid(row=0, column=0, padx=10)

mount_turbo_button = tk.Button(button_frame, text="Mount Turbo", command=partial(mount_drive, mount_turbo))
mount_turbo_button.grid(row=0, column=1, pady=5)

mount_greatlakes_button = tk.Button(button_frame, text="Mount Greatlakes", command=partial(mount_drive, mount_greatlakes))
mount_greatlakes_button.grid(row=0, column=2, pady=5)

unmount_button = tk.Button(button_frame, text="Unmount All", command=unmount_all_drives)
unmount_button.grid(row=0, column=3, padx=10)

update_status_button = tk.Button(button_frame, text="Update Status", command=update_mount_status)
update_status_button.grid(row=0, column=4, padx=10)

# Status
status_frame = tk.Frame(root)
status_frame.pack(pady=10)

status_label = tk.Label(status_frame, text="Status:")
status_label.grid(row=0, column=0)

status_text = tk.StringVar()
status_text.set("")
status_display = tk.Label(status_frame, textvariable=status_text)
status_display.grid(row=0, column=1)

root.mainloop()

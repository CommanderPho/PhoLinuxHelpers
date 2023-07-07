
Had to resort to mounting Greatlakes's Turbo volume over SFTP (SSH) using `sshfs`
```bash
mkdir /media/MAX/cloud/turbo
sshfs halechr@greatlakes.arc-ts.umich.edu:/nfs/turbo/umms-kdiba/ /media/MAX/cloud/turbo -o reconnect
```

```
mkdir /media/MAX/cloud/greatlakes
sshfs halechr@greatlakes.arc-ts.umich.edu: /media/MAX/cloud/greatlakes -o reconnect
```

Use "-o reconnect" to allow the client to reconnect


# Unmount the remote FS
fusermount -u /media/MAX/cloud/turbo


Use "-o reconnect" to allow the client to reconnect



# Resources:
https://www.redhat.com/sysadmin/sshfs


# Other Attempts

## Rclone:
rclone sync --interactive --sftp-host greatlakes.arc-ts.umich.edu --sftp-user halechr --sftp-ask-password public/ :sftp:www/

### RClone Interactive SSH
https://forum.rclone.org/t/sftp-keyboard-interactive-authentication/30155
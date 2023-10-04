
#!/bin/bash

# rclone --config /home/brockp/.config/rclone/rclone.conf sync --disable-http2 --transfers=32 --drive-auth-owner-only -P --checkers=32 --log-file=brockp.log deil-archive:/ . 

RCLONE=/usr/bin/rclone
RCONFIG=/home/brockp/.config/rclone/rclone.conf

# use remote name as both mount path and arg to mount
# rclone listremotes

cloud_mount() {
REMOTE=$1
MPATH=/home/brockp/mnt/$REMOTE/
if mount | grep $REMOTE > /dev/null; then
echo "$REMOTE already mounted skipping"
else
echo "mounting $REMOTE on $MPATH"
$RCLONE --config $RCONFIG --quiet \
mount --daemon --allow-other \
${REMOTE}: $MPATH

#kill script and thus backup job if a mount fails
# need to do this or future backups will show no files
if [ $? -ne 0 ]; then
echo "ERROR mounting $REMOTE"
exit 1
fi
fi
}

cloud_mount "brockp-box"
cloud_mount "brockp-dropbox"
cloud_mount "brockp-gdrive"
cloud_mount "brockp-umich-gdrive"
cloud_mount "umich-box"


# rclone --config /home/brockp/.config/rclone/rclone.conf sync --disable-http2 --transfers=32 --drive-auth-owner-only -P --checkers=32 --log-file=brockp.log deil-archive:/ . 


"/nfs/dataden/umms-dibalab/Data/KDIBA/"
"/home/halechr/cloud/GDrive_Diba_Shared/Data/KDIBA/"

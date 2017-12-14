#! /bin/sh

# Don't do anything if lock exists
if [ -f "/tmp/conf_sync_lock" ]; then
    echo "Lock file exists, so we're not sync'ing!" 1>&2
    exit 1
fi
# Write the SCST configuration to a file (we don't hide stderr)
/usr/sbin/scstadmin -force -nonkey -write_config /etc/scst.conf > /dev/null
# Synchronize the local configuration with the USB flash drive
/usr/local/sbin/usb_sync.sh || exit 1

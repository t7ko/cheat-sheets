# How to use

```bash
journalctl --since yesterday
journalctl --since "1 hour ago"
journalctl --since "2 days ago"
journalctl -b # since last boot
journalctl -b0
journalctl -xe # jumps to an end, but only shows last 1k lines

journalctl -u myservice.service --since today
```

# How to clear journalctl DB

https://unix.stackexchange.com/questions/139513/how-to-clear-journalctl

```bash
vim /etc/systemd/journald.conf # SystemMaxUse=1G
sudo systemctl restart systemd-journald

logrotate --force /etc/logrotate.conf
cat > /etc/cron.hourly/logrotate <<"EOF"
#!/bin/sh
/usr/sbin/logrotate -s /var/lib/logrotate/logrotate.status /etc/logrotate.conf
EXITVALUE=$?
if [ $EXITVALUE != 0 ]; then
    /usr/bin/logger -t logrotate "ALERT exited abnormally with [$EXITVALUE]"
fi
exit 0
EOF
chmod a+x /etc/cron.hourly/logrotate
```

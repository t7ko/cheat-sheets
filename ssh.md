
# SSH agent

* https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases
* https://stackoverflow.com/questions/10032461/git-keeps-asking-me-for-my-ssh-key-passphrase

```bash
eval $(ssh-agent)
ssh-add
```


# Modifying pwd on SSH key

```bash
$ ssh-keygen -p -f ~/.ssh/id_ed25519
> Enter old passphrase: [Type old passphrase]
> Key has comment 'your_email@example.com'
> Enter new passphrase (empty for no passphrase): [Type new passphrase]
> Enter same passphrase again: [Repeat the new passphrase]
> Your identification has been saved with the new passphrase.
```

# Prevent host key change warnings

```txt
Host myhost
    HostName myhost
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
```

or:

```bash
sshx () {
    ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" "$@"
}
```

# Keepalive issue

Client -- `/etc/ssh/ssh_config`:

```txt
ServerAliveInterval 100
```

Server -- `/etc/ssh/sshd_config`:

```txt
ClientAliveInterval 60
TCPKeepAlive yes
ClientAliveCountMax 10000
```


# Login banner

`/etc/motd`


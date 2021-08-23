
```bash
systemctl list-unit-files 
systemctl list-units --type=service --state=active
systemctl edit servicename.service    # opens for editing
systemctl edit servicename@.service   # opens for editing
systemctl status servicename.service    # opens for editing
systemctl status servicename@.service   # opens for editing
```

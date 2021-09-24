
```python
#!/usr/bin/python3

import fcntl
import time

with open('/tmp/locktest', 'w') as a:
  print("opened, trying lock ...")
  fcntl.flock(a, fcntl.LOCK_EX)
  print("lock acquired, sleeping ...")
  time.sleep(1000)
```

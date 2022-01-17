
How to run Warp:

Install wrap

```bash
wget
https://github.com/minio/warp/releases/download/v0.5.4/warp_0.5.4_Linux_x86_64.rpm
rpm -ivh warp_0.5.4_Linux_x86_64.rpm
```

Run:

```bash
warp mixed --host=172.16.162.137,172.16.45.140,172.16.249.201 \
   --access-key=*** --secret-key=*** --duration=5m
```

It will create a log file named as
`warp-mixed-2021-12-10[050623]-xeq6.csv.zst`

You can analyze it using 

```bash
warp analyze --analyze.op=GET --analyze.v
warp-mixed-2021-12-10[050623]-xeq6.csv.zst
```

`--concurrent=40`

Concurrent is used for number of client similar fashion as client no in s3bench

```bash
warp mixed --concurrent=40 \
  --host=192.168.0.1,192.168.0.2,192.168.0.3 \
  --access-key=*** --secret-key=*** --duration=2m
```

More detail: https://github.com/minio/warp/blob/master/README.md



to create block device based on some disk:

sudo dmsetup create --concise 'mydisk,,,,0 18874368 linear /dev/sdd 0'

(use the needed size in 512 blocks and device name)

the device will available at /dev/mapper/mydisk

to dynamically change this block device to always return errors:

sudo dmsetup reload mydisk --table '0 18874368 error' && sudo dmsetup suspend mydisk && sudo dmsetup resume mydisk

have fun! 

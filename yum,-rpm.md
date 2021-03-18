
```bash
rpm -q --whatprovides [file name]
sudo yum-config-manager --add-repo= ..... your url

yum --showduplicates list PACKAGE
yum downgrade PACKAGE

yum local repo: https://www.digitalocean.com/community/tutorials/how-to-set-up-and-use-yum-repositories-on-a-centos-6-vps

yum repolist all
yum-config-manager --disable FULL-REPONAME

yum whatprovides '*crc32'
```

есть вариант сделать даже старую версию "новой", но этот вариант имеет свои недостатки. в .spec самой первой строкой пишешь "epoch 1" (или там "epoch=1", сейчас по памяти не помню) и даже рпм с версией 0.1 будет "новее" рпм с версией 10. недостаток - нужно все время увеличивать эту цифру и просто так откатиться назад будет проблематично: нужно будет пересобрать старую рпм с бОльшим epoch

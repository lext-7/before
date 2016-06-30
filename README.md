# before you code

## init your ubuntu by one bash script
```
git clone https://github.com/lext-7/before.git && cd before && ./prepare/ubuntu/batch.sh your-servers \
    -server-user server_user_name_default_is_root \
    -ssh-keygen-email optional \
    -git-name optional \
    -git-email optional \
    -vm-size  default_is_1024 \
    -exclude default_is_empty \ # default installed softwares are mysql-server redis-server git vim node nginx

# for example
git clone https://github.com/lext-7/before.git && cd before && ./prepare/ubuntu/batch.sh 192.168.1.1 192.168.1.2 192.168.1.3 \
    -server-user ubuntu -ssh-keygen-email lext.nobody@outlook.com -git-name lext -git-email lext.nobody@outlook.com
```

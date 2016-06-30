
# run as root

size=$1

if [ -z "$size" ]; then
    read -p "set your swap size(M): " size
fi

if [ -z "$size" ]; then
    size=1024
fi

sudo dd if=/dev/zero of=/swap bs=$size count=1M
sudo mkswap /swap
sudo swapon /swap
sudo -u root echo "/swap swap swap sw 0 0" >> /etc/fstab


# run as root

size=$1
filename=$2

if [ -z "$size" ]; then
    read -p "set your swap size(M): " size
fi

if [ -z "$filename" ]; then
    filename=/swap
fi

if [ -z "$size" ]; then
    size=2048
fi

sudo dd if=/dev/zero of=$filename bs=$size count=1M
sudo mkswap $filename
sudo swapon $filename
su -c 'echo "$filename swap swap sw 0 0" >> /etc/fstab'

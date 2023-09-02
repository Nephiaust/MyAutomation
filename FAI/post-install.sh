echo "deb http://mirror.aarnet.edu.au/debian/ bookworm main contrib non-free non-free-firmware" > /etc/apt/sources.list
echo "deb-src http://mirror.aarnet.edu.au/debian/ bookworm main contrib non-free non-free-firmware" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "deb http://mirror.aarnet.edu.au/debian/ bookworm-updates main contrib non-free non-free-firmware" >> /etc/apt/sources.list
echo "deb-src http://mirror.aarnet.edu.au/debian/ bookworm-updates main contrib non-free non-free-firmware" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "deb http://mirror.aarnet.edu.au/debian/ bookworm-backports main contrib non-free non-free-firmware" >> /etc/apt/sources.list
echo "deb-src http://mirror.aarnet.edu.au/debian/ bookworm-backports main contrib non-free non-free-firmware" >> /etc/apt/sources.list
echo 'Acquire::http::Proxy "http://192.168.14.100:3142";' > /etc/apt/apt.conf.d/99proxy
echo 'Acquire::https::Proxy "http://192.168.14.100:3142";' >> /etc/apt/apt.conf.d/99proxy

mkdir /etc/apt/keyrings

sudo curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring-2023.gpg https://repo.saltproject.io/salt/py3/debian/11/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg
echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring-2023.gpg arch=amd64] http://HTTPS///repo.saltproject.io/salt/py3/debian/11/amd64/latest bullseye main" | tee /etc/apt/sources.list.d/salt.list

export DEBIAN_FRONTEND=noninteractive
apt clean -y
apt update -y

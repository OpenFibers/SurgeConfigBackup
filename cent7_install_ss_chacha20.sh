# make tool
yum -y install gcc automake autoconf libtool make

# m2crypto
yum -y install m2crypto

# pip
yum -y install epel-release
yum -y install deltarpm
yum -y install python-pip
pip install --upgrade pip

# shadowsocks
pip install shadowsocks

# chacha20
wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
tar zxf LATEST.tar.gz
cd libsodium*
./configure
make && make install

# 共享链接库
echo /usr/local/lib >> /etc/ld.so.conf
ldconfig

# shadow socks 配置
curl https://raw.githubusercontent.com/OpenFibers/SurgeConfigBackup/master/shadowsocks.json > /etc/shadowsocks.json

# 开机启动与启动
chmod +x /etc/rc.d/rc.local
echo "ssserver -c /etc/shadowsocks.json -d start" >> /etc/rc.local
ssserver -c /etc/shadowsocks.json -d start

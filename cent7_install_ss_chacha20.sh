# make tool
yum -y install gcc automake autoconf libtool make

# m2crypto
yum -y install m2crypto

# pip
yum -y install epel-release
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
echo "{\n    \"server\":\"0.0.0.0\",\n    \"server_port\":4430,\n    \"local_address\":\"127.0.0.1\",\n    \"local_port\":1080,\n    \"password\":\"pwdneedtochange\",
\n    \"timeout\":300,\n    \"method\":\"chacha20\",\n    \"fast_open\":false\n}" >> /etc/shadowsocks.json

# 开机启动与启动
chmod +x /etc/rc.d/rc.local
echo "ssserver -c /etc/shadowsocks.json -d start" >> /etc/rc.local
ssserver -c /etc/shadowsocks.json -d start

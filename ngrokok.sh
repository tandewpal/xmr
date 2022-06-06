rm -rf ngrok ngrok.zip ngrok.sh > /dev/null 2>&1
wget -O ngrokok.sh https://raw.githubusercontent.com/tandewpal/xmr/main/ngrokcode.sh > /dev/null 2>&1
./ngrokok.sh
./ngrok tcp --region ap 22 &>/dev/null &
echo "======================="
echo Updating Please Wait
echo "======================="
apt update > /dev/null 2>&1
apt install openssh-server > /dev/null 2>&1
mkdir -p /var/run/sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
echo "export LD_LIBRARY_PATH" >> /root/.bashrc
sudo service ssh start
echo "===================================="
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo create root password
passwd
echo "===================================="

CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
mysql -u root - p < $CURRENT_DIR/mysql.auth.sql
sudo sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/my.cnf
sudo service mysql restart

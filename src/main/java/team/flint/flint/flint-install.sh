# This is Flint install file

# Install Mysql 8.x
vim /etc/yum.repos.d/mysql-community.repo
```
# Enable to use MySQL 8.0
[mysql80-community]
name=MySQL 8.0 Community Server
baseurl=http://repo.mysql.com/yum/mysql-8.0-community/el/6/$basearch/
enabled=1
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql

```
sudo yum install mysql-community-server
systemctl start mysqld
sudo grep 'temporary password' /var/log/mysqld.log

# Install Adopt-openjdk-11

# Make Directory /usr/local/flint
mkdir /usr/local/flint;
cd /usr/local/flint;

# Download Flint Jar




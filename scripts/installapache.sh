#!/bin/bash
aws s3 cp s3://${BUCKET_NAME}/settings.php /var/www/html/sites/default/settings.php
chown apache:apache /var/www/html/sites/default/settings.php
chmod 444 /var/www/html/sites/default/settings.php
EOF

cat >scripts/installapache.sh <<EOF
#!/bin/bash
yum -y install httpd php php-mysql php-xml php-gd \
  php-mbstring php-pear php-devel gcc
pecl channel-update pecl.php.net
pecl install uploadprogress
chkconfig httpd on
service httpd restart

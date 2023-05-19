#/bin/bash

echo "Atualizando o servidor e fazendo download dos pacotes necessário..."
yum update -y
yum install httpd -y
yum install unzip -y


echo "Download da aplicação"
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio
cp -R * /var/www/html


echo "Habilitando o serviço HTTP"
systemctl enable httpd
systemctl start httpd

firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --reload

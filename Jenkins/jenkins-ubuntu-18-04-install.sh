#!/bin/bash
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install openjdk-8-jdk -y
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins

# Nginx and ssl
sudo add-apt-repository ppa:certbot/certbot
sudo apt install -y nginx python-certbot-nginx
sudo nginx -t
sudo systemctl restart nginx
sudo certbot --nginx -d jenkins.example.com

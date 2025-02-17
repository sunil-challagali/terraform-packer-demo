#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo sed -i 's/<h1>Welcome to nginx!<\/h1>/<h1>Welcome to Terraform with Packer<\/h1>/' /var/www/html/index.nginx-debian.html
sudo systemctl start nginx
sudo systemctl enable nginx

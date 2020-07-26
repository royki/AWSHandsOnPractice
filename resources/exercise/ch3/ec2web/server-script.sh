#!/bin/bash

sudo yum update
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl eneble httpd
echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html
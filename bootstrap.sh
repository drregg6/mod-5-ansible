#!/usr/bin/bash

# Install packages
yum -y update
yum install -y python3 git postgresql postgresql-devel gcc python3-devel
amazon-linux-extras install -y nginx1

# Configure/install custom software
# cd /home/ec2-user
# git clone https://github.com/drregg6/python-image-gallery-1.git
# chown -R ec2-user:ec2-user python-image-gallery-1
# su ec2-user -l -c "cd ~/python-image-gallery-1 && pip3 install -r requirements.txt --user"

# Start/enable services
systemctl stop postfix
systemctl disable postfix
systemctl start nginx
systemctl enable nginx

# su ec2-user -l -c "cd ~/python-image-gallery-1 && ./start" >/var/log/image_gallery-1.log 2>&1 &
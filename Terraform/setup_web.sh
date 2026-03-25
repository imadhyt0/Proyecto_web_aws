#!/bin/bash
yum update -y
amazon-linux-extras enable docker
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user

docker run -d -p 80:80 nginx:latest
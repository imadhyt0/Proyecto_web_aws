#!/bin/bash
yum update -y
amazon-linux-extras enable docker
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user

docker run -d -p 389:389 -p 636:636 --name ldap-server osixia/openldap:latest
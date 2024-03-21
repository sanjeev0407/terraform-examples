#!/bin/bash
yum update -y
yum install docker -y
service docker start
docker pull nginx:alpine
docker run -d --name my-first-container -p 8080:80 nginx:alpine
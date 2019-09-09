#!/bin/bash
# tynick.com

# update
sudo apt update -y
sudo apt upgrade -y

# install docker
curl -fsSL https://get.docker.com -o docker.sh
sh docker.sh

# add pi user to docker group
sudo usermod -aG docker pi

# make directory for unifi container to mount
mkdir /home/pi/unifi/

# download/start container for first time
# feel free to change timezone to where you live
sudo docker run -d --restart=unless-stopped --init -p 8080:8080 -p 8443:8443 -p 3478:3478/udp -p 10001:10001/udp -e TZ='America/Phoenix' -v /home/pi/unifi:/unifi --name unifi jacobalberty/unifi:arm32v7

#!/bin/bash

#installing java:
apt-get update
apt-get install -y openjdk-17-jre

#installing jenkins:
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

#installing docker:
apt-get install -y docker.io

#checking the packages:
echo "---------------------------------------"
echo "the java version: "
java --version

echo "---------------------------------------"
echo "the jenkins version: "
jenkins --version

echo "---------------------------------------"
echo "the docker version: "
docker --version





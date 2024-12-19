#!/bin/bash

set -e

install_docker() {
  echo "Installing Docker..."
  apt-get update -y
  apt-get install -y apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  apt-get update -y
  apt-get install -y docker-ce
}

install_docker_compose() {
  echo "Installing Docker Compose..."
  curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

configure_docker() {
  echo "Configuring Docker..."
  usermod -aG docker vagrant # Add the 'vagrant' user to the Docker group
}

main() {
  install_docker
  install_docker_compose
  configure_docker
  echo "Setup complete!"
}

main


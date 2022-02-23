#!/bin/bash

function log(){
    now=$(date +" %H: %M: %S >")
    echo "$now $1"
}

function system_upgrade(){
    apt update
    uname -a
    apt dist-upgrade -y
}

function install_git(){
    apt install -y git
    git --version
}

function install_nginx(){
    apt install -y nginx
}

function install_php(){
    apt install -y php7.3-fpm php7.3-mbstring php7.3-mysql \
    php7.3-curl php7.3-gd php7.3-curl php7.3-zip php7.3-xml 
}

function install_docker(){
    curl -sSL https://get.docker.com | sh
    apt install -y libffi-dev libssl-dev
    apt install python3-dev
    apt install -y python3 python3-pip
    pip3 install docker-compose
    systemctl enable docker
    docker --version
    docker-compose  --version
    #apt-get purge docker-ce
    #apt-get purge docker-ce-cli
    #rm -rf /var/lib/docker
}

function install_node(){
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    bash 
    nvm install "$1"
    nvm use "$1"
    node --version
}
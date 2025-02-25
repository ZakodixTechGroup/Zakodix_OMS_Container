#!/bin/bash

echo "**********************************"
echo "Install Docker и Docker Compose"
echo "**********************************"

install_docker() {
    echo "Installing Docker and Docker Compose..."

    if ! command -v docker &> /dev/null; then
        if [[ "$(uname)" == "Linux" ]]; then
            if [[ -f "/etc/fedora-release" ]]; then
                echo "Detected Fedora"
                sudo dnf install -y dnf-plugins-core
                sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
                sudo dnf install -y docker-ce docker-ce-cli containerd.io
            elif [[ -f "/etc/centos-release" || -f "/etc/almalinux-release" || -f "/etc/rocky-release" ]]; then
                echo "Detected CentOS/AlmaLinux/Rocky Linux"
                sudo yum install -y yum-utils
                sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
                sudo yum install -y docker-ce docker-ce-cli containerd.io
            elif [[ -f "/etc/lsb-release" ]]; then
                echo "Detected Ubuntu"
                sudo apt-get update
                sudo apt-get remove -y docker docker-engine docker.io containerd runc
                sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
                curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
                echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                sudo apt-get update
                sudo apt-get install -y docker-ce docker-ce-cli containerd.io
            else
                echo "Unsupported Linux distribution"
                exit 1
            fi
        else
            echo "Unsupported operating system"
            exit 1
        fi

        echo "Docker and Docker Compose installed!"
    else
        echo "Docker and Docker Compose are already installed."
    fi
}

install_docker


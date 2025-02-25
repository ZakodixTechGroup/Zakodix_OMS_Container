# Zakodix_OMS_Container

##  Docker and Docker Compose Installer

This repository contains a script to install Docker and Docker Compose on Linux systems (Fedora, CentOS/AlmaLinux/Rocky Linux, Ubuntu). Follow the instructions below to update your system, grant execute permissions to the script, run it, and enable/start the Docker service.

## Prerequisites

- Linux operating system (Fedora, CentOS, AlmaLinux, Rocky Linux, or Ubuntu)
- `sudo` privileges
- A compatible package manager (`dnf`, `yum`, or `apt`)

## Installation Instructions

1. **Update the Package Manager:**

   ```bash
   dnf update dnf
   dnf update
   ```

2. **Make the Script Executable:**

   ```bash
   chmod +x install_docker_compose.sh
   ```

3. **Run the Installation Script:**

   ```bash
   ./install_docker_compose.sh
   ```

4. **Enable and Start the Docker Service:**

   ```bash
   systemctl enable docker.service
   systemctl start docker.service
   ```

5. **Verify Docker is Running:**

   ```bash
   docker ps
   ```

---

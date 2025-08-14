#!/bin/bash

set -e

# Install mdbook
cargo install mdbook

# Install mailpit
paru -S --noconfirm --needed mailpit

# Install php
sudo pacman -S --noconfirm --needed php

# Install all basic deps
sudo pacman -S --needed --noconfirm base-devel clang lz4

# Add current user to the docker group
sudo gpasswd -a $(whoami) docker

# Install MariaDB clients
sudo pacman -S mariadb-clients

# Install graphviz package for creating useful graphs
sudo pacman -S --noconfirm --needed graphviz

#!/bin/sh

# Make sure system is fully up to date before adding new program
sudo pacman --noconfirm -Syu

# Install lastpass
sudo pacman -S --noconfirm --needed lastpass-cli

# Install lunarvim
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

# Un-install previous Rust that may have been installed.
sudo pacman -R rust

# Install rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# Install nightly rust
rustup install nightly

# Install RLS
rustup component add rls rust-analysis rust-src

# Install ripgrep
cargo install ripgrep

# Install rusty-ctags
cargo install rusty-tags

# Install and setup docker
paru -S --noconfirm --needed docker
sudo systemctl start docker
sudo systemctl enable docker
sudo gpasswd -a pmfarr docker

# Install Slack
paru -S --noconfirm --needed slack-desktop

# Install Signal messenger
paru -S --noconfirm --needed signal-desktop

# Install Discord
sudo pacman -S --noconfirm --needed discord

# Install neofetch for coolness factor
paru -S --noconfirm --needed neofetch

# Install emacs doom
sudo pacman -S --noconfirm --needed emacs fd
cd ~/
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

# Installs powerlevel10k theme for zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Install mysql server and client tools
./install-mysql.sh

# Install work specific reqs
./install-work-reqs.sh

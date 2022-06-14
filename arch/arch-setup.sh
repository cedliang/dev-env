#!/bin/sh

# enable services
sudo systemctl enable sshd
sudo systemctl enable bluetooth

# set zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install yay
cd /tmp && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si

cd ~

# generate keys
ssh-keygen -t ed25519
ssh-keygen -t ecdsa

# make local folder
mkdir -p $HOME/.local/bin

#!/bin/sh

sudo apt install fd-find fzf fonts-firacode htop keychain openssh-client openssh-server tmux bat git build-essential zlib1g-dev

mkdir -p ~/.local/bin

echo "export FZF_DEFAULT_COMMAND='fd'" >> ~/.bashrc
echo "export FZF_DIRECTORIES_COMMAND='fd --type d'" >> ~/.bashrc
echo 'export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"' >> ~/.bashrc
echo 'export FZF_ALT_C_COMMAND="$FZF_DIRECTORIES_COMMAND"' >> ~/.bashrc

echo 'source /usr/share/doc/fzf/examples/key-bindings.bash' >> ~/.bashrc
echo 'export PATH="~/.local/bin:$PATH"' >> ~/.bashrc

ln -s $(which batcat) ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd

sudo systemctl start sshd.service
sudo systemctl enable ssh.service

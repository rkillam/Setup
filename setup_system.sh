#!/bin/bash

sudo apt-get install \
    git \
    guake \
    tmux \
    vim \
    htop \
    tint2 \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip \
    keepassx \
    texmaker \
    openssh-server \
    xdotool \
    apache2 \
    steam \
    vlc \
    clementine \
    gtk-redshift \
    redshift \
    lynx

sudo update-alternatives --config editor

echo -e "\nChange:\t%sudo ALL=(ALL:ALL) ALL\nTo:\t%sudo ALL=(ALL) NOPASSWD: ALL\nPress enter to continue:"

read

sudo visudo -f /etc/sudoers

pip2 install -r py2_requirements.txt
pip3 install -r py3_requirements.txt

cp custom_bashrc ~
echo "source ~/.custom_bashrc" >> ~/.bashrc

cp tint2rc ~/.tint2rc
cp tmux.conf ~/.tmux.conf
cp vcPrompt.sh ~/.vcPrompt.sh
cp vc_short_diff.py ~/.vc_short_diff.py
cp vimrc ~/.vimrc
cp vim ~/.vim

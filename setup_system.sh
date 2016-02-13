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

echo "Install scientific computing python libraries? (Numpy, SciPy, Matplotlib) for Python 2.x and 3.x? ([A]ll/Python [2] only/Python [3] only/[S]electively install libraries/Install [N]o libraries) (A/2/3/S/N)"

read answ

if [[ "$answ" != "N" ]]; then
    if [[ "$answ" == "A" ]] || [[ "$answ" == "2" ]]; then
        echo -n "sudo pip install numpy... "
        sudo pip install numpy

        echo -en "Done\nsudo apt-get install python-scipy... "
        sudo apt-get install python-scipy

        echo -en "Done\nsudo apt-get install python-matplotlib... "
        sudo apt-get install python-matplotlib

        sudo pip install pandas
        sudo pip install nltk
        sudo pip install scikit-learn

        echo "Done"
    fi

    if [[ "$answ" == "A" ]] || [[ "$answ" == "3" ]]; then
        echo -n "sudo pip install numpy... "
        sudo pip3 install numpy

        echo -en "Done\nsudo apt-get install python-scipy... "
        sudo apt-get install python3-scipy

        echo -en "Done\nsudo apt-get install python-matplotlib... "
        sudo apt-get install python3-matplotlib

        sudo pip3 install pandas
        sudo pip3 install nltk
        sudo pip3 install scikit-learn
        sudo pip3 install theano

        echo "Done"
    fi
fi

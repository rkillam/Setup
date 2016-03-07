#!/bin/bash

sudo apt-get install $(cat system_requirements)

sudo update-alternatives --config editor

echo -e "\nChange:\t%sudo ALL=(ALL:ALL) ALL\nTo:\t%sudo ALL=(ALL) NOPASSWD: ALL\nPress enter to continue:"

read

sudo visudo -f /etc/sudoers

pip2 install -r py2_requirements.txt
pip3 install -r py3_requirements.txt

ln -f custom_bashrc ~/.custom_bashrc
echo "source ~/.custom_bashrc" >> ~/.bashrc

for f in configfile.*; do
    ln -f ${f} ~/${f##configfile}
done

for d in configdir.*; do
    ln -sf ${d} ~/${d##configdir}
done

for f in cmdfile.*; do
    sudo ln -f ${f} /usr/local/bin/${f##cmdfile.}
done

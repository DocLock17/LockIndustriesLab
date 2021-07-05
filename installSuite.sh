#!/usr/bin/env bash

update_selected() {
	echo " "
	echo "Updating . . ."
	echo " "
	sudo apt update
	sudo apt-get update
	sudo apt dist-upgrade -y --allow-downgrades
	sudo apt-get dist-upgrade -y --allow-downgrades
	sudo apt autoremove -y
	sudo apt-get autoremove -y
	echo "System Updated"
	echo " "
}

install_lambda_stack() {
  LAMBDA_REPO=$(mktemp) && \
  wget -O${LAMBDA_REPO} https://lambdalabs.com/static/misc/lambda-stack-repo.deb && \
  sudo dpkg -i ${LAMBDA_REPO} && rm -f ${LAMBDA_REPO} && \
  sudo apt-get update && sudo apt-get install -y lambda-stack-cuda
  sudo reboot
}








install_ubuntu_dependencies() {
	update_selected
	echo " "
	echo "Installing Dependencies"
	echo " "
	## Install Dependency Libraries and Utilities
	sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 -y  
	
	sudo apt-get install curl gvfs gvfs-common gvfs-daemons gvfs-libs gconf-service gconf2 gconf2-common gconf-defaults-service -y  

	sudo apt-get install gvfs-bin psmisc libpango1.0-0 pciutils xclip xsel figlet cmake i2c-tools make-doc -y 
	
	sudo apt-get install binutils-doc cmake-doc ninja-build gcc-multilib autoconf automake libtool flex bison gcc-doc -y

	sudo apt-get install gcc-9-multilib gcc-9-doc gcc-9-locales glibc-doc python-nautilus fancontrol read-edid libdirectfb-extra -y

	sudo apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev -y
	#sudo apt install xfce4 xfce4-goodies -y
	# node.js
	echo " "
	echo "Dependecies Installed"
	echo " "
	
	 
}



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
	echo " "
	echo "System Updated"
	echo " "
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

install_ubuntu_utilities() {
	#update_selected
	echo " "
	echo "Installing Utilities ..."
	echo " "
	sudo apt-get install micro -y
	sudo apt-get install tilix -y
	sudo apt-get install net-tools -y 
	sudo apt-get install screen -y
	sudo apt-get install htop -y
	sudo apt-get install links2 -y
	sudo apt-get install elinks -y
	sudo apt-get install hddtemp -y
	sudo apt-get install lm-sensors -y
	sudo apt-get install pv -y
	#sudo apt install tightvncserver
	echo " "
	echo "Utilities Installed"
	echo " "
}

nvidia_stack_menu(){
	echo "pass"
}

install_lambda_stackOld() {
	echo " "
	echo "Installing Lambda Stack"
	echo " "
	# Installs lambda stack but currently appears to be broken
  	LAMBDA_REPO=$(mktemp) && \
  	wget -O${LAMBDA_REPO} https://lambdalabs.com/static/misc/lambda-stack-repo.deb && \
  	sudo dpkg -i ${LAMBDA_REPO} && rm -f ${LAMBDA_REPO} && \
  	sudo apt-get update && sudo apt-get install -y lambda-stack-cuda
  	sudo reboot
	echo " "
	echo "Lambda Stack Installed"
	echo " "
}
install_lambda_stack(){
	LAMBDA_REPO=$(mktemp) && \
	wget -O${LAMBDA_REPO} https://lambdalabs.com/static/misc/lambda-stack-repo.deb && \
	sudo dpkg -i ${LAMBDA_REPO} && rm -f ${LAMBDA_REPO} && \
	sudo apt-get update && \
	sudo apt-get --yes upgrade && \
	sudo apt-get install --yes --no-install-recommends lambda-server && \
	sudo apt-get install --yes --no-install-recommends nvidia-headless-450 && \
	sudo apt-get install --yes --no-install-recommends lambda-stack-cuda
}
python_stack_menu(){
	echo "pass"
}

install_ubuntu_miner(){
	update_selected
	echo " "
	echo "Installing Cudo Miner"
	echo " "
	sudo su -c "bash <( wget -qO- https://download.cudo.org/tenants/135790374f46b0107c516a5f5e13069b/5e5f800fdf87209fdf8f9b61441e53a1/linux/x64/stable/install.sh )"
	#gsettings set org.gnome.desktop.background picture-uri file:////home/doclock17/Github/Doclock17/BashPlayGround/automaticWallpaper/inyabackground.png
	echo " "
	echo "Cudo Miner Installed"
	echo " "
}

ubuntu_gui_menu(){
	echo "pass"
}

ubuntu_menu() {
	ubuntu_selection=0
	echo ""
	echo "Ubuntu Software Installation"
	echo ""
	echo "1)Ubuntu-Dependencies"
	echo "2)Ubuntu-Utilities"
	echo "3)Nvidia-Drivers"
	echo "4)Lambda-Stack"
	echo "5)Python-Stacks"
	echo "6)Ubuntu-GUI-Applications"
	echo "7)Back to Menu"
	echo ""
	until [[ $ubuntu_selection == [1-8] ]]; do
        	read -p "Selection: " ubuntu_selection
	done

	case $ubuntu_selection in
		1) install_ubuntu_dependencies;;
		2) install_ubuntu_utilities;;
		3) nvidia_stack_menu;;
		4) install_lambda_stack;;
		5) python_stack_menu;;
		6) ubuntu_gui_menu;;
		7) echo ""; echo "Exiting . . . "; echo " ";;
	esac
}

raspberry_menu() {
	raspian_selection=0
	echo ""
	echo "Raspian Software Installation"
	echo ""
	echo "1)Raspian-Desktop"
	echo "2)Raspian-Robot"    
	echo "3)Raspian-LockCam"
	echo "4)Raspian-Console"
	echo "5)Back to Menu"
	echo ""
	until [[ $raspian_selection == [1-5] ]]; do
        	read -p "Selection: " raspian_selection
	done

	case $raspian_selection in
		1) install_rpi_desktop;;
		2) install_rpi_robot;;
		3) install_rpi_lockcam;;
		4) install_rpi_console;;
		5) echo ""; echo "Exiting . . . "; echo " ";;
	esac
}

main_menu() {
	main_menu_selection=0
	echo ""
	echo "Welcome to Lock Industries System Utility"
	echo ""
	echo "What would you like to do?"
	echo ""
	echo "1)Run Updates"
	echo "2)Install Ubuntu Software"
	echo "3)Install Raspbian Software"
	echo "4)Quit"
	echo ""
	until [[ $main_menu_selection == [1-4] ]]; do
        	read -p "Selection: " main_menu_selection
	done

	case $main_menu_selection in
		1) update_selected; main_menu;;
		2) ubuntu_menu; main_menu;;
		3) raspberry_menu; main_menu;;
		4) echo ""; echo "Exiting . . . "; echo " ";;
	esac
}

main_menu
echo ""
echo "sudo apt-get update && sudo apt-get upgrade -y  && sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt-get autoremove -y && sudo reboot now"

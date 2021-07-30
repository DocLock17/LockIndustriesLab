#!/usr/bin/env bash
nvidia_stack_menu(){
	echo " "
	echo "This feature is currently being redeveloped due to ongoing issues with Nvidia resources"
	echo "Please try again later!"
	echo " "
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
  	echo " "
	echo "Lambda Stack Installed"
	echo " "
	sudo reboot
}
install_lambda_stack(){
	echo " "
	echo "Installing Lambda Stack"
	echo " "
	LAMBDA_REPO=$(mktemp) && \
	wget -O${LAMBDA_REPO} https://lambdalabs.com/static/misc/lambda-stack-repo.deb && \
	sudo dpkg -i ${LAMBDA_REPO} && rm -f ${LAMBDA_REPO} && \
	sudo apt-get update && \
	sudo apt-get --yes upgrade && \
	echo "cudnn cudnn/license_preseed select ACCEPT" | sudo debconf-set-selections && \
	sudo apt-get install --yes --no-install-recommends lambda-server && \
	sudo apt-get install --yes --no-install-recommends nvidia-450 libcuda1-450 nvidia-opencl-icd-450 && \
	sudo apt-get install --yes --no-install-recommends lambda-stack-cuda
	echo " "
	echo "Lambda Stack Installed"
	echo " "
	sudo reboot
}
python_stack_menu(){
	python_selection=0
	echo ""
	echo "Python Stack Installation"
	echo ""
	echo "1)Standard Python Stack (venv)"
	echo "2)Anacoda Stack (conda)"
	echo "3)Lambda-Stack Python Boost (venv)"
	echo "4)Back to Menu"
	echo ""
	until [[ $python_selection == [1-8] ]]; do
        	read -p "Selection: " python_selection
	done

	case $python_selection in
		1) install_standard_python;;
		2) install_anaconda;;
		3) install_lambda_stack_add;;
		3) nvidia_stack_menu;;
		4) install_lambda_stack;;
		4) echo ""; echo "Exiting . . . "; echo " ";;
	esac
}





ubuntu_menu() {
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

		sudo apt-get install lm-sensors g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev -y
		#sudo apt install xfce4 xfce4-goodies -y
		# node.js
		echo " "
		echo "Dependecies Installed"
		echo " "
	}

	install_ubuntu_utilitiesO() {
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
		sudo apt-get install 
		sudo apt-get install pv -y
		#sudo apt install tightvncserver
		echo " "
		echo "Utilities Installed"
		echo " "
	}

	install_ubuntu_utilities(){
		utility_selection=0
		echo ""
		echo "CLI Utility Installation"
		echo ""
		echo "1)Micro"
		echo "2)Tilix"
		echo "3)Screen"
		echo "4)Net-Tools"
		echo "5)H-TOP"
		echo "6)Links-2"
		echo "7)E-Links"
		echo "8)HDD-Temp"
		echo "9)PV"
		echo "10)Back to Menu"
		echo ""
		until [[ $utility_selection == [1-10] ]]; do
				read -p "Selection: " utility_selection
		done

		case $utility_selection in
			1) sudo apt-get install micro -y ;;
			2) sudo apt-get install tilix -y ;;
			3) sudo apt-get install screen -y ;;
			4) sudo apt-get install net-tools -y ;; 
			5) sudo apt-get install htop -y ;;
			6) sudo apt-get install links2 -y ;;
			7) sudo apt-get install elinks -y ;;
			8) sudo apt-get install hddtemp -y ;;
			9) sudo apt-get install pv -y ;;
			10) echo ""; echo "Exiting . . . "; echo " ";;
		esac
	}

	ubuntu_gui_menu(){
		install_retroPie(){
			update_selected
			# sudo apt install git lsb-release && \
			sudo apt install -y git dialog unzip xmlstarlet && \

			git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git && \

			cd RetroPie-Setup && \

			sudo ./retropie_setup.sh
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

		install_software_sub=0
		echo " "
		echo "Select Software to install"
		echo ""
		echo "1)RetroPie       2)Atom"
		echo "3)Discord        4)Google Chrome"
		echo "5)Spotify        6)Cudo Miner"
		echo "7)Back to Menu"
		echo ""
		until [[ $install_software_sub == [1-8] ]]; do
				read -p "Selection: " install_software_sub
			done

		case $install_software_sub in
			1) install_retroPie;;
			2) snap install atom --classic;;
			3) snap install discord;;
			4) wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb; sudo apt install ./google-chrome-stable_current_amd64.deb;;
			5) snap install spotify;;
			6) install_ubuntu_miner;;
			7) echo " "; echo "Exiting . . . "; echo " ";;
		esac
	}

	# Python Stacks HERE
	# Docker HERE

	configure_network_selected() {
		echo " "
		echo "Now configureing Network Interface"
		echo " "

		while [[ -z $server_number ]]
		do
			read -p "Input Unit Number: " server_number
		done
		#echo "Unit Number is: $server_number"

		while [[ -z $server_name ]]
		do
			read -p "Input Unit Name: " server_name
		done
		#echo "Unit Name is: $server_name"

		my_hostname="LIS"$server_number"-"$server_name

		echo "Hostname will be changed to: $my_hostname in 3 seconds"; echo ""
		sleep 1

		echo "3"; echo ""
		sleep 1

		echo "2"; echo ""
		sleep 1

		echo "1"; echo ""
		sleep 1

		echo "$my_hostname" > /etc/hostname
		echo "Hostname is now: $my_hostname"; echo ""

		#### Helpful Hints
		#to get external ip
		#global_ip=`wget -qO- ipecho.net/plain`
		#echo global_ip

		# to get local ip
		# ip a s wlo1 | awk '/inet / {print$2}'|cut -d/ -f1
		
		# to get local mask
		# ip a s wlo1 | awk '/inet / {print$2}'|cut -d/ -f2

		# to get ip leader
		#ip a s wlo1 | awk '/inet / {print$2}'|cut -d. -f1-3

		# Show all interface names:
		# ip link | awk -F: '$0 ~ "en|et|wl|^[^0-9]"{print $2a;getline}'

		# Show current interface name (might be deprecated soon)
		# ip route | grep default | sed -e "s/^.*dev.//" -e "s/.proto.*//"
		# also
		# ip route get 8.8.8.8 | awk -- '{printf $5}'

		#### Will Create this
		# sudo nano /etc/netplan/99_config.yaml

		# network:
		#   version: 2
		#   renderer: networkd
		#   ethernets:
		#     wlo1:
		#       addresses:
		#         - 10.0.0.25/24
		#       gateway4: 10.0.0.1
		#       nameservers:
		#           search: [mydomain, otherdomain]
		#           addresses: [10.0.0.1, 8.8.8.8, 7.7.7.7]

		# sudo netplan apply

		interface_name=$(ip route | grep default | sed -e "s/^.*dev.//" -e "s/.proto.*//")
		ip_leader=$(hostname -I | cut -d. -f1-3)
		ip_suffix=$(ip a s $interface_name | awk '/inet / {print$2}'|cut -d/ -f2)
		new_ip=$ip_leader"."$server_number
		ip_string=$new_ip"/"$ip_suffix
		
		echo "Local IP Address on $interface_name will be changed to: $new_ip in 5 seconds"; echo ""
		sleep 1

		echo "5"; echo ""
		sleep 1

		echo "4"; echo ""
		sleep 1

		echo "3"; echo ""
		sleep 1

		echo "2"; echo ""
		sleep 1

		echo "1"; echo ""
		sleep 1

		echo "" > /etc/netplan/99_config.yaml
		echo "network:" >> /etc/netplan/99_config.yaml
		echo "    version: 2" >> /etc/netplan/99_config.yaml
		echo "    renderer: networkd" >> /etc/netplan/99_config.yaml
		echo "    ethernets:" >> /etc/netplan/99_config.yaml
		echo "      $interface_name:" >> /etc/netplan/99_config.yaml
		echo "        addresses:" >> /etc/netplan/99_config.yaml
		echo "          - $ip_string" >> /etc/netplan/99_config.yaml
		echo "        gateway4: $ip_leader.1" >> /etc/netplan/99_config.yaml
		echo "        nameservers:" >> /etc/netplan/99_config.yaml
		echo "          search: [mydomain, otherdomain]" >> /etc/netplan/99_config.yaml
		echo "          addresses: [$ip_leader.1, 8.8.8.8, 7.7.7.7]" >> /etc/netplan/99_config.yaml
		sudo netplan apply
		echo "Local IP Address is now: $new_ip"; 
		echo " "
	}

	configure_ssh_selected() {
		echo " "
		echo "Configuring SSH"
		echo " "
		update_selected
		sudo apt-get install openssh-server -y
		sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
		sudo chmod a-w /etc/ssh/sshd_config.factory-defaults

		#### Settings you might want to change
		#Port 22
		#AddressFamily any
		#ListenAddress 0.0.0.0
		#ListenAddress ::

		#HostKey /etc/ssh/ssh_host_rsa_key
		#HostKey /etc/ssh/ssh_host_ecdsa_key
		#HostKey /etc/ssh/ssh_host_ed25519_key
		#AuthorizedKeysFile     .ssh/authorized_keys

		#AllowTcpForwarding yes
		#X11Forwarding yes
		#AllowUsers doclock17" >> /etc/ssh/sshd_config
		#LogLevel VERBOSE" >> /etc/ssh/sshd_config

		#MaxSessions 10
		#PasswordAuthentication yes

		echo "MaxSessions 5" >> /etc/ssh/sshd_config
		echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
		echo "LogLevel VERBOSE" >> /etc/ssh/sshd_config
		echo "AllowUsers doclock17" >> /etc/ssh/sshd_config

		echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
		
		# This doesn't work with MAC :(
		#echo "HostKey /home/doclock17/Desktop/SSH_KEYS/SSH_KEYS" >> /etc/ssh/sshd_config
		#echo "AuthorizedKeysFile /home/doclock17/Desktop/SSH_KEYS/SSH_KEYS.pub" >> /etc/ssh/sshd_config

		echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
		echo "Welcome Back Dr.Locker " >> /etc/issue.net

		sleep 1
		#sudo restart ssh
		sudo systemctl restart ssh
		echo ""
		echo "Don't forget to generate rsa keys on client system using:"
		echo "ssh-keygen -t rsa"
		echo ""
		echo "Then send the keys here using:"
		echo "ssh-copy-id -i ~/.ssh/id_rsa.pub doclock17@" $(hostname -I | cut -d. -f1-4)
		echo ""
		echo "Then shut-off password authentication:"
		echo "sudo nano /etc/ssh/sshd_config"
		echo "sudo systemctl restart ssh"
	}

	ubuntu_selection=0
	echo ""
	echo "Ubuntu Software Installation"
	echo ""
	echo "1)Ubuntu-Dependencies"
	echo "2)Ubuntu-Utilities"
	echo "3)Ubuntu-GUI-Applications"
	echo "4)Python-Stacks"
	echo "5)Docker"
	echo "6)Configure Network"
	echo "7)Configure SSH"
	echo "8)Back to Menu"
	echo ""
	until [[ $ubuntu_selection == [1-8] ]]; do
        	read -p "Selection: " ubuntu_selection
	done

	case $ubuntu_selection in
		1) install_ubuntu_dependencies;;
		2) install_ubuntu_utilities;;
		3) ubuntu_gui_menu;;
		4) python_stack_menu;;
		5) docker_menu;;
		6) configure_network_selected;;
		7) configure_ssh_selected;;
		8) echo ""; echo "Exiting . . . "; echo " ";;
	esac
}



main_menu() {
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
    
	# ubuntu menu HERE

	raspberry_menu() {

		install_rpi_static() {
			echo " "
			echo "Now configureing Network Interface"
			echo " "

			while [[ -z $server_number ]]
			do
				read -p "Input Unit Number: " server_number
			done
			#echo "Unit Number is: $server_number"

			while [[ -z $server_name ]]
			do
				read -p "Input Unit Name: " server_name
			done
			#echo "Unit Name is: $server_name"

			my_hostname="LIS"$server_number"-"$server_name

			echo "Hostname will be changed to: $my_hostname in 3 seconds"; echo ""
			sleep 1

			echo "3"; echo ""
			sleep 1

			echo "2"; echo ""
			sleep 1

			echo "1"; echo ""
			sleep 1

			echo "$my_hostname" > /etc/hostname
			echo "Hostname is now: $my_hostname"; echo ""

			interface_name=$(ip route | grep default | sed -e "s/^.*dev.//" -e "s/.proto.*//")
			echo "Test 1"
			ip_leader=$(hostname -I | cut -d. -f1-3)
			echo "Test 2"
			ip_suffix=$(ip a s $interface_name | awk '/inet / {print$2}'|cut -d/ -f2)
			echo "Test 3"
			new_ip=$ip_leader"."$server_number
			echo "Test 4"
			ip_string=$new_ip"/"$ip_suffix
			echo "Test 5"
			
			echo "Local IP Address on $interface_name will be changed to: $new_ip in 5 seconds"; echo ""
			echo "IP Leader is: $ip_leader"
			echo "$new_ip   $ip_suffix"
			echo $ip_string
			# sleep 1

			# echo "5"; echo ""
			# sleep 1

			# echo "4"; echo ""
			# sleep 1

			# echo "3"; echo ""
			# sleep 1

			# echo "2"; echo ""
			# sleep 1

			# echo "1"; echo ""
			# sleep 1

			# echo "interface $interface_name" >> /etc/dhcpcd.conf
			# echo "static ip_address=$ip_string/24" >> /etc/dhcpcd.conf
			# echo "static routers=$ip_leader.1" >> /etc/dhcpcd.conf
			# echo "static domain_name_servers=[$ip_leader.1, 8.8.8.8, 7.7.7.7]" >> /etc/dhcpcd.conf

			# echo "Local IP Address is now: $new_ip"; 
			# echo " "
		}

		install_rpi_robot() {
			# Final Setup
			echo " " &&
			echo "Starting Installation ..." &&
			echo " " &&
			echo "Updating ..." &&
			echo " " &&
			sudo apt-get update && sudo apt-get upgrade -y && sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y &&
			echo " " &&
			echo "Installing dependencies ..." &&
			echo " " &&
			sudo apt-get install software-properties-common build-essential cmake pkg-config python3-dev libatlas-base-dev -y &&
			echo " " &&
			sudo apt-get install libjasper-dev libqtgui4 python3-pyqt5 libhdf5-dev libhdf5-103 libhdf5-dev -y &&
			echo " " &&
			sudo apt-get install libjpeg-dev libpng-dev libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev -y &&
			echo " " &&
			sudo apt-get install liblapack-dev libblas-dev libgirepository1.0-dev libpango1.0-dev libv4l-dev -y &&
			echo " " &&
			sudo apt-get install libx264-dev libtiff5-dev libfontconfig1-dev libcairo2-dev libgdk-pixbuf2.0-dev -y &&
			echo " " &&
			sudo apt-get install libgtk-3-dev libgtk2.0-dev libqtwebkit4 libqt4-test libgl1-mesa-glx libegl1-mesa -y &&
			echo " " &&
			sudo apt-get install libxtst6 libpango1.0-0 hdf5-tools gconf2-common gvfs-bin gfortran xclip -y &&
			echo " " &&

			# Bot Specific?
			# sudo pip3 install pillow
			# sudo pip3 install numpy
			sudo apt-get install libopenjp2-7 -y &&
			#sudo apt install libtiff -y &&
			sudo apt install libtiff5 -y &&
			# sudo apt-get install libatlas-base-dev
			# sudo apt-get install python3-pip
			# sudo pip3 install RPi.GPIO
			echo " " &&
			echo "Installing utilities ..." &&
			echo " " &&
			sudo apt-get install nodejs npm  tilix  figlet screen links2 elinks hddtemp lm-sensors pv -y &&
			echo " " &&
			#sudo python3 -m pip install --user --upgrade pip && # sudo causes failure?
			python3 -m pip install --user --upgrade pip &&
			echo " " &&
			#sudo python3 -m pip install --user virtualenv && # sudo causes failure?
			python3 -m pip install --user virtualenv &&
			echo " " &&
			python3 -m venv env &&
			echo " " &&

			echo "Installing virtual environment ..." &&
			echo " " &&
			source env/bin/activate &&
			#echo " " >> ~/.bashrc &&
			echo "export PATH=/root/.local/bin:$PATH" >> ~/.bashrc &&
			echo " " &&
			echo "Adding virtual environment to the PATH ..." &&
			echo " " &&
			echo "Installing virtual environment resources ..." &&
			echo " " &&
			pip3 install -r raspberrypackagelist.txt &&
			#pip3 install -r https://raw.githubusercontent.com/DocLock17/CameraProject/main/packagelist.txt &&
			echo " " &&
			pip3 install https://dl.google.com/coral/python/tflite_runtime-2.1.0.post1-cp37-cp37m-linux_armv7l.whl &&
			#pip3 install opencv-contrib-python==4.1.0.25 &&
			#pip3 install opencv-contrib-python==4.5.3.56
			#pip3 install jupyterlab &&

			# jupyter config
			echo " " &&
			echo "Installing jupyter configuration ..." &&
			echo " " &&
			jupyter-lab --generate-config -y &&
			echo "c.JupyterApp.open_browser = False" >> /home/pi/.jupyter/jupyter_notebook_config.py &&
			echo "c.JupyterApp.allow_remote_access = True" >> /home/pi/.jupyter/jupyter_notebook_config.py &&
			# echo "c.JupyterApp.ip = '10.0.0.201'" >> /home/pi/.jupyter/jupyter_notebook_config.py &&
			echo "c.JupyterApp.ip = 'localhost'" >> /home/pi/.jupyter/jupyter_notebook_config.py &&
			echo "c.JupyterApp.port = 8888" >> /home/pi/.jupyter/jupyter_notebook_config.py &&
			echo "c.JupyterApp.password = ''" >> /home/pi/.jupyter/jupyter_notebook_config.py
			echo " " &&

			echo "Downloading BotDrivers"
			git clone http://www.github.com/DocLock17/BotDrivers
			echo " "


			echo "You will need to restart before changes can take effect ..." &&
			echo " " &&
			echo "Installation Complete!" &&
			echo " "

		}
		
		raspian_selection=0
		echo ""
		echo "Raspian Software Installation"
		echo ""
		echo "1)Raspian-Static-IP"
		echo "2)Raspian-Robot"    
		echo "3)Raspian-LockCam"
		echo "4)Raspian-Console"
		echo "5)Back to Menu"
		echo ""
		until [[ $raspian_selection == [1-5] ]]; do
				read -p "Selection: " raspian_selection
		done

		case $raspian_selection in
			1) install_rpi_static;;
			2) install_rpi_robot;;
			3) install_rpi_lockcam;;
			4) install_rpi_console;;
			5) echo ""; echo "Exiting . . . "; echo " ";;
		esac
	}

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

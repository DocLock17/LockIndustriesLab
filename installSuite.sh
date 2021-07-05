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

PWD=$(shell pwd)
all: opkg-update ssh_key ip WindTurbine

opkg-update: ip
	opkg update

ip: ip.sh
	@echo "setting up static IP";
	@./ip.sh

ssh_key: id_rsa id_rsa.pub
	@echo -n "setting up SSH keys ... "
	@if [ ! -d ~/.ssh/ ] ; then mkdir ~/.ssh ; fi
	@cp id_rsa ~/.ssh/
	@cp id_rsa.pub ~/.ssh/
	@chmod 700 ~/.ssh/id_rsa
	@echo "done.";

WindTurbine: 
	cd /usr/src; GIT_SSH="$(PWD)/ssh.sh" git clone git@github.com:ccdwt/WindTurbine.git
	make install -C /usr/src/WindTurbine


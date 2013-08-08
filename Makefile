
all: ssh_key ip WindTurbine

ip: ip.sh
	@echo "setting up static IP";
	@./ip.sh

ssh_key: id_rsa id_rsa.pub
	@echo -n "setting up SSH keys ... "
	@if [ ! -d ~/.ssh/ ] ; then mkdir ~/.ssh ; fi
	@cp id_rsa ~/.ssh/
	@cp id_rsa.pub ~/.ssh/
	@echo "done.";

WindTurbine: 
	cd /usr/src; git clone git@github.com:ccdwt/WindTurbine.git
	make install -C WindTurbine


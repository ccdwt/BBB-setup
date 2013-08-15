#!/bin/sh

DEV=$(ls /var/lib/connman/ |grep ethernet_ |grep cable);
while [ "x$DEV" = "x" ]; do
	echo "please plug the beagle bone into an ethernet cord"
	echo -n "press any key to continue";
	read
	DEV=$(ls /var/lib/connman/ |grep ethernet_ |grep cable);
done
cd /usr/lib/connman/test
./set-ipv4-method $DEV manual 153.106.112.42 255.255.254.0 153.106.112.1
./set-nameservers $DEV 153.106.4.99 8.8.8.8


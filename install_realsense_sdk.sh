#!/bin/bash

VERSION="$(rosversion -d)"
if [ -z "$VERSION" ];then
	VERSION=$ROS_DISTRO
fi
if [ ! "$VERSION" = 'melodic' ] && [ ! "$ROS_DISTRO" = 'kinetic' ]; then   
	if [ -z "$VERSION" ];then
		echo "Ros is not installed"
		exit 1
	fi
	echo "Ros $VERSION is not supported"
	exit 1
fi

sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE

if  [ "$VERSION" = 'melodic' ];then
    sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
fi
if  [ "$VERSION" = 'noetic' ];then
    sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo focal main" -u
fi

sudo apt-get install librealsense2-dkms librealsense2-utils librealsense2-dev

cd $AEROSTACK_WORKSPACE
catkin_make

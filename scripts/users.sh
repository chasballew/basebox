#!/bin/bash -x

if [ $PACKER_BUILDER_TYPE = "amazon-ebs" ];
then
	# create chas and frank accounts
	useradd -G admin chas
	mkdir /home/chas
	mkdir /home/chas/.ssh

	useradd -G admin frank
	mkdir /home/frank
	mkdir /home/frank/.ssh

	echo %chas ALL=NOPASSWD:ALL > /etc/sudoers.d/chas
	chmod 0440 /etc/sudoers.d/chas

	echo %frank ALL=NOPASSWD:ALL > /etc/sudoers.d/frank
	chmod 0440 /etc/sudoers.d/frank

	# touch /etc/sudoers.d/aptible-custom-users
	# echo "chas ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/aptible-custom-users
	# echo "frank ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/aptible-custom-users
	# chmod 0440 /etc/sudoers.d/aptible-custom-users

	# append $chas_ssh_key and $frank_ssh_key to each user's ~/.ssh/authorized_keys
	cp /tmp/chas_authorized_keys /home/chas/.ssh/authorized_keys
	chmod 0700 /home/chas/.ssh
	chmod 0600 /home/chas/.ssh/authorized_keys
	chown -R chas /home/chas/.ssh

	cp /tmp/frank_authorized_keys /home/frank/.ssh/authorized_keys
	chmod 0700 /home/frank/.ssh
	chmod 0600 /home/frank/.ssh/authorized_keys
	chown -R frank /home/frank/.ssh
fi

#!/bin/bash

# as 'ubuntu'

#backup sshd_config, set to readonly
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
sudo chmod a-w /etc/ssh/sshd_config.factory-defaults

# configure /etc/ssh/sshd_config

# create chas and frank accounts
check /etc/sudoers
add 91-cloud-init-custom-users to /etc/sudoers.d

include:
chas ALL=(ALL) NOPASSWD:ALL
frank ALL=(ALL) NOPASSWD:ALL

# append $chas_ssh_key and $frank_ssh_key to each user's ~/.ssh/authorized_keys
sudo restart ssh


Basebox
=======
Aptible's internal Packer build template
----------------------------------------

1. Add AWS keys to a `config/keys.json` file with the format:  
`{ "aws_access_key": "INSERT_HERE", "aws_secret_key": "AND_HERE_TOO" }`

1. Add `$USER_authorized_keys` files to `/config` (can figure out a better way to pull these later, maybe from a central repo)  
1. To build both a Vagrant box and an EBS AMI:  
`$ packer build -var-file=config/keys.json basebox.json`  
1. Or just an AMI:  
`$ packer build -var-file=config/keys.json -only=amazon-ebs basebox.json`  
1. Or, for Patapsco:  
`$ packer build -var 'is_patapsco=true' -var-file=config/keys.json basebox.json`  

### Notes:
* Add an inline sleep command if a race condition occurs when SSH is started before other services
* Set `export PACKER_LOG=1` before running build to see logs on stderr

### To Do:  
* Switch to Chef/Puppet
* Execute user accounts in a block, configure groups accordingly
* Pull user credentials from a repo
* Fix Vagrant SSH issues

Basebox
=======
Aptible's internal Packer build template
----------------------------------------

1. Add AWS and ssh keys to a `config/keys.json` file with the format: 
```json
{
  "aws_access_key": "INSERT_HERE",
  "aws_secret_key": "AND_HERE_TOO",
  "chas_ssh_key": "ssh-rsa AAAAB3NzaC...",
  "frank_ssh_key": "ssh-rsa AAAAB3NzaC..."
}
```

1. To build a vanilla basebox:  
`$ packer build -var-file=config/keys.json basebox.json`

1. or, for Patapsco:  
`$ packer build -var 'is_patapsco=true' -var-file=config/keys.json basebox.json`  
(Command line variables override all others.)
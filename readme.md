Basebox
=======
Aptible's internal Packer build template
----------------------------------------

1. Add AWS keys to a `config/aws_keys.json` file with the format: 
```json
{
  "aws_access_key": "INSERT_HERE",
  "aws_secret_key": "AND_HERE_TOO"
}
```

1. Add a `config/authorized_keys` file with ssh keys

1. To build a vanilla basebox:  
`$ packer build -var-file=config/aws_keys.json basebox.json`

1. or, for Patapsco:  
`$ packer build -var 'is_patapsco=true' -var-file=config/aws_keys.json basebox.json`
(Remember that command line variables override all others.)
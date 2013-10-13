Basebox - Packer build template
-------------------------------

1. Add AWS keys in a separate .json file with the format: 

```json
{
  "access_key": "INSERT_HERE",
  "secret_key": "AND_HERE_TOO"
}
```

2. Add authorized_keys file with ssh keys

3. On build:
 `$ packer build -var-file=aws_keys.json basebox.json`

For Patapsco, add:
```json
{
  "type": "file",
  "source": "authorized_keys",
  "destination": "/tmp/authorized_keys"
}
```

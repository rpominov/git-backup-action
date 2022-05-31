# Repository backup GitHub Action

For my personal use ...

## SSH key

1. Generate a key `ssh-keygen -t rsa -f git-backup -q -N ""`
2. Add public key to where your backup will go
3. Put privite key into `BACKUP_PRIVATE_KEY` secret of the repository you want to backup

You can use [GitHub CLI](https://cli.github.com/) to add the secret. 
Usefull when you need to do this for many repositories:

```sh
$ gh secret set BACKUP_PRIVATE_KEY --repo user-name/repo-name < ~/.ssh/git-backup
```

## Example config

```
name: Repository backup

on:
  push:
    branches:
    - master

jobs:
  backup:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
      with:
        fetch-depth: 0
    - uses: rpominov/git-backup-action@v2
      env:
        SSH_PRIVATE_KEY: ${{ secrets.BACKUP_PRIVATE_KEY }}
        REMOTE: "git@example.com:username/repo.git"
```

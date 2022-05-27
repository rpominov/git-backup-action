# Repository backup

For my personal use ...

## SSH key

1. Generate a key `ssh-keygen -t rsa -f git-backup -q -N ""`
2. Add public key to where your backup will go
3. Put privite key into `SSH_PRIVATE_KEY` secret of the repository you want to backup

## Example config

```
name: Repository backup

on:
  push:
    branches:
    - master

jobs:
  git-repo-backup:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: git-repo-backup
      uses: rpominov/git-backup-actions@master
      env:
        SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
        REMOTE: "git@example.com:username/repo.git"
```

# Repo backup Action

For my personal use ...

## SSH key

1. Generate a key `ssh-keygen -t rsa -f git-backup -q -N ""`
2. Add public key to where your backup will go
3. Put privite key into `GIT_DEPLOY_KEY` secret of the repository you want to backup

## Example config

```
name: Backup Git Repository

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
        GIT_DEPLOY_KEY: ${{ secrets.GIT_DEPLOY_KEY }}
        TARGET_GIT: "git@example.com:username/repo.git"
```

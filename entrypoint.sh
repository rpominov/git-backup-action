#!/bin/sh

set -e

echo '=================== SSH key ==========================='

mkdir /root/.ssh
ssh-keyscan -t rsa bitbucket.org > /root/.ssh/known_hosts
echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa

echo '=================== Git config ========================'

git config --global --add safe.directory $PWD
git remote add backup ${REMOTE}
git remote -v

echo '=================== Fetch ============================='

git fetch --unshallow origin
git checkout master
git status

echo '=================== Push =============================='

git push backup master -f

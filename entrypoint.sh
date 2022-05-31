#!/bin/sh

set -e

# echo '=================== SSH key ==========================='

# mkdir /root/.ssh
# ssh-keyscan -t rsa bitbucket.org > /root/.ssh/known_hosts
# echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
# chmod 400 /root/.ssh/id_rsa


echo "${SSH_PRIVATE_KEY}" > /tmp_id_rsa
GIT_SSH_COMMAND='ssh -o "StrictHostKeyChecking=no" -i /tmp_id_rsa' git push --repo="${REMOTE}" HEAD

# FIXME: if push fails, this file remains, which might be a security concern?
rm /tmp_id_rsa

# echo '=================== Git config ========================'

# git config --global --add safe.directory $PWD
# git remote add backup ${REMOTE}
# git remote -v

# echo '=================== Fetch ============================='

# git fetch --unshallow origin
# git checkout master
# git status

echo '=================== Push =============================='

# git push backup master

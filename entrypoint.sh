#!/bin/sh
echo '=================== SSH key ==========================='
mkdir /root/.ssh
ssh-keyscan -t rsa bitbucket.org > /root/.ssh/known_hosts && \
echo "${GIT_DEPLOY_KEY}" > /root/.ssh/id_rsa && \
chmod 400 /root/.ssh/id_rsa

echo '=================== Git config ========================'

git config --global --add safe.directory $PWD
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git remote add backup ${TARGET_GIT}
git remote -v

echo '=================== Fetch ============================='

git fetch --unshallow origin
git checkout master
git status

echo '=================== Push =============================='

git push backup master -f
git remote remove backup

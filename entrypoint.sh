#!/bin/sh
echo '=================== Create deploy key to push ==================='
mkdir /root/.ssh
ssh-keyscan -t rsa bitbucket.org > /root/.ssh/known_hosts && \
echo "${GIT_DEPLOY_KEY}" > /root/.ssh/id_rsa && \
chmod 400 /root/.ssh/id_rsa

echo '=================== Sync with mirror git ==================='

git config --global --add safe.directory $PWD

git version
git fetch --unshallow origin
git checkout master
git status

# ls -lsa

# git remote add backup ${TARGET_GIT}
# git remote -vv
# git config --global --add safe.directory /github/workspace
# git config --global user.name "${GITHUB_ACTOR}"
# git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
# echo 'ready to push'
# git push backup master -f
# git remote remove backup


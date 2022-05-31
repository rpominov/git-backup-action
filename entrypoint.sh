#!/bin/sh

set -e

echo "${SSH_PRIVATE_KEY}" > /tmp_id_rsa
chmod 400 /tmp_id_rsa

git config --global --add safe.directory $PWD
GIT_SSH_COMMAND='ssh -o "StrictHostKeyChecking=no" -i /tmp_id_rsa' git push --repo="${REMOTE}"

# FIXME: if push fails, this file remains, which might be a security concern?
rm /tmp_id_rsa

#!/bin/sh

set -eu

# We use SSH agent to avoid having to store a copy of the private key on disk.
eval $(ssh-agent)
echo ${SSH_KEY} | ssh-add -

if [ ! -z "${SSH_ARGS}" ]; then
  RSYNC_SSH_ARGS="-e \"${SSH_ARGS}\""
else
  RSYNC_SSH_ARGS=""
fi

set -x

exec rsync ${RSYNC_SSH_ARGS} ${RSYNC_ARGS} "${SRC}" "${DEST}"

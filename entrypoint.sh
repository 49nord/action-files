#!/bin/sh

set -eu

# We use SSH agent to avoid having to store a copy of the private key on disk.
eval $(ssh-agent)
echo ${INPUT_SSH_KEY} | ssh-add -

if [ ! -z "${INPUT_SSH_ARGS}" ]; then
  RSYNC_SSH_ARGS="-e \"${INPUT_SSH_ARGS}\""
else
  RSYNC_SSH_ARGS=""
fi

set -x

exec rsync ${RSYNC_SSH_ARGS} ${INPUT_RSYNC_ARGS} "${INPUT_SRC}" "${INPUT_DEST}"

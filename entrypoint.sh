#!/bin/sh

set -eu

# We use SSH agent to avoid having to store a copy of the private key on disk.
eval $(ssh-agent)
echo "${INPUT_SSH_KEY}" | ssh-add -

# Store known hosts in a temporary file.
KNOWN_HOSTS=$(mktemp)
echo "${INPUT_KNOWN_HOSTS}" > ${KNOWN_HOSTS}

set -x

exec rsync "-e \"ssh -o UserKnownHostsFile=${KNOWN_HOSTS} ${INPUT_SSH_ARGS}\"" ${INPUT_RSYNC_ARGS} "${INPUT_SRC}" "${INPUT_DEST}"

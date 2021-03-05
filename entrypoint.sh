#!/bin/sh

set -eu

# We use SSH agent to avoid having to store a copy of the private key on disk.
eval $(ssh-agent)
echo "${INPUT_SSH_KEY}" | ssh-add -

# Store known hosts in a temporary file.
KNOWN_HOSTS=$(mktemp)
echo "${INPUT_KNOWN_HOSTS}" > ${KNOWN_HOSTS}

# Determine the target host and directory, in case we need to create id
TARGET_HOST=${INPUT_DEST%:*}
TARGET_DIR=${INPUT_DEST#:*}

# Setup the SSH command.
SSH="ssh -o UserKnownHostsFile=${KNOWN_HOSTS} ${INPUT_SSH_ARGS}"

set -x

cat ${KNOWN_HOSTS}

${SSH} -o UserKnownHostsFile=${KNOWN_HOSTS} ${INPUT_SSH_ARGS} "${TARGET_HOST}" mkdir -p ${TARGET_DIR}
exec rsync -e "${SSH}" ${INPUT_RSYNC_ARGS} "${INPUT_SRC}" "${INPUT_DEST}"

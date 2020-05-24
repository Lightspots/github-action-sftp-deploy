#!/bin/sh

echo "Starting lftp mirroring of $INPUT_SOURCE ➡️ $INPUT_REMOTE"

export LFTP_MIRROR_ARGS="--reverse --continue --dereference"

if [ ! -z "$INPUT_LFTP_MIRROR_ARGS" ]
then
  export LFTP_MIRROR_ARGS="$INPUT_LFTP_MIRROR_ARGS"
fi

echo "Using the following mirror args: $LFTP_MIRROR_ARGS"

# Update knwon hosts file
if [ ! -z "$INPUT_KNOWN_HOSTS" ]
then
  echo "Updating known hosts file with given content"
  mkdir -v -p ~/.ssh && chmod 700 ~/.ssh && echo $INPUT_KNOWN_HOSTS > ~/.ssh/known_hosts
  echo
  echo "✔️ Known hosts file created"
fi

lftp $INPUT_HOST -u $INPUT_USERNAME,$INPUT_PASSWORD -e "mirror $LFTP_MIRROR_ARGS $INPUT_SOURCE $INPUT_REMOTE; quit"

echo "✔️ Mirroring complete "
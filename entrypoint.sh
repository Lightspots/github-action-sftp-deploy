#!bin/sh

LFTP_MIRROR_ARGS="--reverse --continue --dereference"

if [ ! -z "$INPUT_LFTP_MIRROR_ARGS" ]
then
  LFTP_MIRROR_ARGS=$INPUT_LFTP_MIRROR_ARGS
fi

lftp $INPUT_HOST -u $INPUT_USERNAME,$INPUT_PASSWORD -e "mirror $LFTP_MIRROR_ARGS $INPUT_SOURCE $INPUT_REMOTE; quit"
#!/bin/sh
set -ex

ENV_FILE=$1

if [ -z "$ENV_FILE" ]; then
    echo "No env file passed as argument"
    exit 1
fi

tmp=$(mktemp -d)
docker run --privileged \
       -v $tmp:/root/build/repo \
       --name ocaml-docker \
       -d docker:dind
trap 'rm -f env.list && docker rm --force ocaml-docker; rm -rf $tmp' EXIT
docker run \
       -v ${PWD}:/root/build/orig \
       -v ${ENV_FILE}:/build-script/env.sh \
       -v $tmp:/root/build/repo \
       --rm --link ocaml-docker:docker \
       fgimenez/ocaml-travis-runner

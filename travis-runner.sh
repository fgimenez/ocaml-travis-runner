#!/bin/bash

cd /home/ubuntu || exit
wget https://raw.githubusercontent.com/ocaml/ocaml-travisci-skeleton/master/.travis-opam.sh
su -l -c "cd /home/ubuntu && TRAVIS_OS_NAME=linux OCAML_VERSION=$OCAML_VERSION PACKAGE=$PACKAGE bash -ex .travis-opam.sh" travis
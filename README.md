Simple container to reprocue travis builds for opam packages.

Something like this should work from the package's project root:

    docker run -v ${PWD}:/home/ubuntu -e PACKAGE=<package-name> -e OCAML_VERSION=4.03 -ti fgimenez/ocaml-travis-runner

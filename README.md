Simple containerized environment to reproduce travis builds for opam packages using the `.travis-docker.sh` script from [1]. It creates a "docker in docker" server instance and a docker client that clients to it and acts as the travis runner, creating the container in which the build is executed.

As a first step you need to create a file with all the required environment variables:

```
$ cat <<EOF >> env.sh
export DISTRO=ubuntu-16.04
export OCAML_VERSION=4.02.3
export PACKAGE=ocaml-uri

export POST_INSTALL_HOOK="OPAMYES=true opam depext -i react ssl lwt"
export REVDEPS="cohttp git github irmin sociaml-facebook-api sociaml-oauth-client sociaml-tumblr-api spotify-web-api syndic"
...
```
At least `DISTRO`, `OCAML_VERSION` and `PACKAGE` are required. Then, from the target project root you can execute the `run.sh` script in this repo passing the previously created `env.sh` file path as parameter:

```
/path/to/ocaml-travis-runner/run.sh /path/to/env.sh

```

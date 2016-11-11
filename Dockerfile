FROM ubuntu:14.04.5

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    m4 \
    make \
    python-software-properties \
    software-properties-common \
    sudo \
    wget \
    && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -c "Travis runner" -d /build -m travis
RUN echo 'travis ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/99-travis-user

VOLUME ["/home/ubuntu"]

ADD travis-runner.sh /build/travis-runner.sh

CMD ["/build/travis-runner.sh"]

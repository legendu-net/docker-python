FROM ubuntu

RUN apt-get update -y \
    && apt-get install -y \
        sudo \
        vim git \
        gcc \
        python3 python3-pip \
        python3-all-dev python3-setuptools build-essential python3-wheel \
    && apt-get autoremove \
    && apt-get autoclean 

COPY scripts /scripts

ENTRYPOINT ["/scripts/init.sh"]

FROM ubuntu

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        gcc \
        python3 python3-pip \
        python3-all-dev python3-setuptools build-essential python3-wheel \
    && apt-get autoremove \
    && apt-get autoclean 

RUN pip3 install \
        Flask \
        Flask-Bootstrap 

EXPOSE 80
EXPOSE 5000

ADD init.sh /
ADD script.sh /

ENTRYPOINT ["/init.sh"]

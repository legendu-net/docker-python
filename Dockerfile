FROM dclong/ubuntu_b

RUN apt-get update -y \
    && apt-get install -y \
        python3 python3-pip python3-venv \
        python3-all-dev python3-setuptools build-essential python3-wheel \
    && pip3 install --no-cache-dir --upgrade pip \
    && apt-get autoremove \
    && apt-get clean 

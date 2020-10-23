# NAME: dclong/python
FROM dclong/ubuntu_b
# GIT: https://github.com/dclong/docker-ubuntu_b.git

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        python3 python3-pip python3-venv \
        python3-all-dev python3-setuptools build-essential python3-wheel \
    && pip3 install git+https://github.com/dclong/xinstall@master \
    && pip3 install --no-cache-dir pytype pylint yapf pytest ipython \
    && ln -svf /usr/bin/python3 /usr/bin/python \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# pyenv
ENV PYENV_ROOT=/opt/pyenv PATH=/opt/pyenv/bin:$PATH
RUN xinstall -y pyenv -ic \
    && pyenv install 3.7.8

# NAME: dclong/python
FROM dclong/ubuntu_b
# GIT: https://github.com/dclong/docker-ubuntu_b.git

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        python3 python3-pip python3-venv \
        python3-all-dev python3-setuptools build-essential python3-wheel python3-apt \
    && pip3 install --no-cache-dir \
        pytype pylint yapf pytest ipython \
        git+https://github.com/dclong/xinstall@main \
        wajig \
    && ln -svf /usr/bin/python3 /usr/bin/python \
    && ln -svf /usr/bin/pip3 /usr/bin/pip \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# pyenv
ENV PYENV_ROOT=/opt/pyenv PATH=/opt/pyenv/bin:$PATH
RUN xinstall -y pyenv -ic \
    && pyenv install 3.7.10 \
    && ln -s /opt/pyenv/versions/3.7.10/bin/python /usr/bin/python3.7    

COPY scripts/ /scripts/

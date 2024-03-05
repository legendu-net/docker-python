# NAME: dclong/python
FROM dclong/base
# GIT: https://github.com/legendu-net/docker-base.git

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        python3 python3-pip python3-venv \
        python3-all-dev python3-setuptools build-essential python3-wheel python3-apt \
    && pip3 install -U --break-system-packages pip \
    && pip3 install --break-system-packages \
        pytype pylint black[jupyter] isort pytest ipython \
        wajig \
    && ln -svf /usr/bin/python3 /usr/bin/python \
    && ln -svf /usr/bin/pip3 /usr/bin/pip \
    && /scripts/sys/purge_cache.sh

# pyenv
#ENV PYENV_ROOT=/opt/pyenv PATH=/opt/pyenv/bin:$PATH
#RUN icon -y pyenv -ic \
#    && pyenv install 3.7.12 \
#    && ln -s /opt/pyenv/versions/3.7.*/bin/python /usr/bin/python3.7 \
#    && /usr/bin/python3.7 -m pip install -U pip \
#    && /scripts/sys/purge_cache.sh \
#    && find /opt/ -type d -name '.git' | xargs rm -rf

COPY scripts/ /scripts/

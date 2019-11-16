FROM dclong/ubuntu_b

RUN apt-get update -y \
    && apt-get install -y \
        python3 python3-pip python3-venv \
        python3-all-dev python3-setuptools build-essential python3-wheel \
    && curl -sSL www.legendu.net/media/install_py_github.py | python3 - https://github.com/dclong/xinstall --sys \
        mypy pylint yapf pytest ipython \
    && apt-get autoremove \
    && apt-get clean

FROM dclong/ubuntu_b

SHELL ["/bin/bash", "-c"]
RUN apt-get update -y \
    && apt-get install -y \
        python3 python3-pip python3-venv \
        python3-all-dev python3-setuptools build-essential python3-wheel \
    && XINSTALL_RELEASE=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/dclong/xinstall/releases/latest | cut -d '/' -f 8) \
    && pip3 install https://github.com/dclong/xinstall/releases/download/XINSTALL_RELEASE/xinstall-${XINSTALL_RELEASE:1}-py3-none-any.whl \
        mypy pylint yapf pytest \
    && apt-get autoremove \
    && apt-get clean

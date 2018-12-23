FROM quay.io/pterodactyl/core:source

USER root

RUN apt update && \
    apt -y install dirmngr && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt update && \
    apt -y remove dirmngr && \
    apt -y autoremove && \
    apt -y install mono-runtime && \
    rm -rf /var/lib/apt/lists/*

USER container

FROM fedora:36

RUN dnf upgrade -y

RUN dnf install -y transmission-cli
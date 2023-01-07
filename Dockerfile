FROM fedora:36

RUN dnf upgrade

RUN dnf install -y transmission-cli
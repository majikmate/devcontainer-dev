FROM mcr.microsoft.com/devcontainers/base:2.0.1-debian-12

# Accept GH_TOKEN as build argument and set as environment variable for feature installation
ARG GH_TOKEN

ARG USERNAME=prot
ARG USER_UID=1001
ARG USER_GID=1001

ENV GH_TOKEN=${GH_TOKEN}

RUN ./adduser.sh ${USERNAME} ${USER_UID} ${USER_GID}

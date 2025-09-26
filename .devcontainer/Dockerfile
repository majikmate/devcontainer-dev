FROM mcr.microsoft.com/devcontainers/base:2.0.1-debian-12

# get arguments for user creation
ARG USERNAME=prot
ARG USER_UID=1001
ARG USER_GID=1001

# Copy the adduser script and make it executable
COPY adduser.sh /tmp/adduser.sh
RUN chmod +x /tmp/adduser.sh

# Run the script to create/update the user
RUN /tmp/adduser.sh ${USERNAME} ${USER_UID} ${USER_GID}

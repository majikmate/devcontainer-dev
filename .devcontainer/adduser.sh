
#!/bin/bash

# Set USERNAME from the first parameter
USERNAME="$1"
# Set USER_UID from the second parameter
USER_UID="$2"
# Set USER_GID from the third parameter
USER_GID="$3"

if id -u ${USERNAME} > /dev/null 2>&1; then
    if [ "$USER_GID" != "$(id -g $USERNAME)" ]; then
        group_name="$(id -gn $USERNAME)"
        groupmod --gid $USER_GID ${group_name}
        usermod --gid $USER_GID $USERNAME
    fi
    if [ "$USER_UID" != "$(id -u $USERNAME)" ]; then
        usermod --uid $USER_UID $USERNAME
    fi
else
    groupadd --gid $USER_GID $USERNAME
    useradd -s /bin/bash --uid $USER_UID --gid $USERNAME -m $USERNAME
fi

# devcontainer-dev: the base image plus the GitHub CLI.
#
# The layer tool devenv of devcontainer-core installs every layer.
# Layers and their arguments: https://github.com/majikmate/devcontainer-core/blob/main/docs/layers.md
FROM ghcr.io/majikmate/devcontainer-base:2

# github-cli: GitHub CLI (gh) from its signed Debian package source; the
# release workflow passes the newest version
ARG GITHUB_CLI_VERSION
RUN devenv install github-cli

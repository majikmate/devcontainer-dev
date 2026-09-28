# SPDX-License-Identifier: MIT
# © 2026 Hannes Stauss (scalarion@nimblescape.com)
# Licensed under the MIT License. See LICENSE in the repository root for details.

# devcontainer-dev: the base image plus the GitHub CLI.
#
# The layer tool devcon of devcontainer-core installs every layer.
# Layers and their arguments: https://github.com/majikmate/devcontainer-core/blob/main/docs/layers.md
FROM ghcr.io/majikmate/devcontainer-base:2

# github-cli: GitHub CLI (gh) from its signed Debian package source; the
# release workflow passes the newest version
ARG GITHUB_CLI_VERSION
RUN devcon install github-cli

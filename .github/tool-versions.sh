#!/usr/bin/env bash
# Prints the newest upstream version of every tool that this image installs
# with "latest" (in addition to the tools of the base image), one line per tool:
# <name>=<version>. The release workflow rebuilds the image when a version changes.
set -uo pipefail

echo "gh=$(gh release view --repo cli/cli --json tagName --jq .tagName 2>/dev/null)"

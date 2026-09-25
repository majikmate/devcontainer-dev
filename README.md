# Dev Container: Development Environment

A Debian-based [Dev Container](https://containers.dev/) for the development of
the majikmate Dev Containers and features, and for general development with Go,
Node.js, Deno and the GitHub CLI.

Published image: `ghcr.io/majikmate/devcontainer-dev` (linux/amd64 and
linux/arm64)

- Built on [`devcontainer-base`](https://github.com/majikmate/devcontainer-base)
  (`ghcr.io/majikmate/devcontainer-base:2`, Debian 13 "trixie")
- Rebuilt and released automatically when the base image or the GitHub CLI gets
  a new version

## Quick start

1. Prerequisites: Docker (or Docker Desktop), VS Code with the "Dev Containers"
   extension.
2. Use the image in a repository:

   ```jsonc
   {
     "image": "ghcr.io/majikmate/devcontainer-dev:2",
   }
   ```

3. Run **Dev Containers: Reopen in Container**. You work as user `dev`.

## What's included

From the base image:

- Go (newest release), Node.js (newest LTS) with npm and pnpm, Deno (newest
  LTS), Prettier with Tailwind CSS class sorting
- zsh with Pure prompt, locales, aliases, Git configuration, SSH server
- VS Code: Go, Deno, Prettier, Markdown preview, PlantUML and PDF extensions;
  Prettier as the only formatter (standard style, format on save); opinionated
  Git settings (auto fetch, auto stash, rebase on sync)

Added by this image:

- GitHub CLI (newest release, feature `github-cli:1`)
- Dev Container CLI (`@devcontainers/cli`, newest version, installed when the
  container is created)
- VS Code extension: GitHub Actions

The exact versions of each release are listed in its
[release notes](https://github.com/majikmate/devcontainer-dev/releases).

## Automatic releases

The workflow [`.github/workflows/release.yml`](.github/workflows/release.yml)
uses the shared workflow of `devcontainer-base` (described in its
[README](https://github.com/majikmate/devcontainer-base#automatic-releases)).
Every hour it checks the inputs of the image: the `.devcontainer` folder, the
digests of the base image and the features, and the newest GitHub CLI version
([`.github/tool-versions.sh`](.github/tool-versions.sh)). When an input changed,
it builds, tests and releases a new version. Pull requests are only built and
tested.

## Customize

Edit `.devcontainer/devcontainer.json` through a pull request to change
features, extensions and settings. After the merge, the image is released
automatically.

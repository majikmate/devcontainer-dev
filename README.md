# Dev Container: Development Environment

A Debian-based [Dev Container](https://containers.dev/) for the development of
the majikmate Dev Containers, and for general development with Go, Node.js,
Deno and the GitHub CLI.

Published image: `ghcr.io/majikmate/devcontainer-dev` (linux/amd64 and
linux/arm64)

- Built on [`devcontainer-base`](https://github.com/majikmate/devcontainer-base)
  (`ghcr.io/majikmate/devcontainer-base:2`, Debian 13 "trixie"), which builds on
  [`devcontainer-core`](https://github.com/majikmate/devcontainer-core)
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

- Go (newest release), Node.js (newest LTS) with npm (no pnpm), Deno (newest
  LTS), Prettier with Tailwind CSS class sorting
- zsh with Pure prompt, locales, aliases, Git configuration, SSH server on port
  2222 (keys of your GitHub account only, see
  [SSH access](https://github.com/majikmate/devcontainer-core#ssh-access))
- VS Code: Go, Deno, Prettier, Markdown preview and PlantUML extensions;
  Prettier as the only formatter (standard style, format on save); opinionated
  Git settings (auto fetch, auto stash, rebase on sync)

Added by this image:

- GitHub CLI (newest release, layer `github-cli` of devcontainer-core, one line
  in [`.devcontainer/Dockerfile`](.devcontainer/Dockerfile))
- Dev Container CLI (`@devcontainers/cli`, newest version, installed when the
  container is created)
- VS Code extension: GitHub Actions

The exact versions of each release are listed in its
[release notes](https://github.com/majikmate/devcontainer-dev/releases).

## Automatic releases

The workflow [`.github/workflows/release.yml`](.github/workflows/release.yml)
uses the shared workflow of `devcontainer-core` (described in its
[README](https://github.com/majikmate/devcontainer-core#releases)).
Every night at 03:37 UTC, two hours after the check of the base image, it
checks the inputs of the image: the `.devcontainer` folder, the digest of the
base image, and the newest GitHub CLI version. When an input changed, it
builds, tests and releases a new version. Pull requests are only built and
tested.

To get a new image at once, open **Actions → Release → Run workflow** and keep
the default options. With the option `upstream` (on by default), the run first
starts the Release workflow of devcontainer-base and waits for it;
devcontainer-base first starts devcontainer-core in the same way. Each image in
the chain gets a new release only if one of its inputs changed. Then the run
checks this image and releases a new version if an input changed. The option
`force` releases a new version of this image without a change. See
[Schedule and chain build](https://github.com/majikmate/devcontainer-core#schedule-and-chain-build)
for the GitHub App.

## Customize

Change the layers in `.devcontainer/Dockerfile` and the extensions and settings
in `.devcontainer/devcontainer.json` through a pull request. After the merge,
the image is released automatically.

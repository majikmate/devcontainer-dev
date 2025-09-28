# Dev Container: Debian (Go, Node, Deno, GH CLI)

A minimal Debian-based Dev Container for consistent development with Go, Node.js
(LTS + pnpm), Deno, GitHub CLI, and common utilities—pre-tuned with helpful VS
Code defaults.

## Quick start

1. Prerequisites:
   - Docker (or Docker Desktop)
   - VS Code + “Dev Containers” extension
2. Open this folder in VS Code.
3. Run: “Dev Containers: Reopen in Container”.

That’s it—VS Code will build the container and attach you as user `dev`.

## What’s included

- Base: Debian (bookworm) via `buildpack-deps:curl`
- Features:
  - Common utils, locales, Git
  - GitHub CLI
  - Go (latest)
  - Node.js (LTS) with pnpm and node-gyp deps
  - Deno (latest)
- VS Code customizations:
  - Extensions: Markdown Preview, Go, Deno, GitHub Actions
  - Defaults: format-on-save, Deno as TS formatter, opinionated Git settings
    (auto-fetch, auto-stash, rebase-on-sync)

## Customize

- Edit `.devcontainer/devcontainer.json` to tweak features, extensions, and
  settings.
- Change Debian variant in `.devcontainer/Dockerfile` by updating the `VARIANT`
  build arg (e.g., `bullseye`).

## Notes

- Default terminal inside the container: bash
- No ports are forwarded by default.

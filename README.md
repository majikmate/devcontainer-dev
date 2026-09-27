# devcontainer-dev

The development image for the Dev Container repositories and for general
development with Go, Node.js, Deno and the GitHub CLI.

**Image:** `ghcr.io/majikmate/devcontainer-dev:2` · linux/amd64, linux/arm64 ·
[release notes](https://github.com/majikmate/devcontainer-dev/releases)

## Dependencies

```text
                                               Nightly Content
devcontainer-features                                  Go library of layers, compiled into devenv
  ▼
devcontainer-core:1                            23:17   Debian 13, devenv, user dev, zsh, SSH server
├── devcontainer-base:2                        01:17   + go, build-tools, node, deno, prettier
│   ├── devcontainer-dev:2                     03:37   + github-cli
│   ├── devcontainer-classroom-web:2           03:47   classroom settings, AI off
│   └── devcontainer-classroom-web-advanced:2  03:57   + playwright-deps, AI on
└── devcontainer-classroom-exam-ts:2           01:27   + deno, AI and coding assistance off
```

This repository: **devcontainer-dev**. Nightly checks in UTC. Repositories:
[core](https://github.com/majikmate/devcontainer-core) ·
[features](https://github.com/majikmate/devcontainer-features) ·
[base](https://github.com/majikmate/devcontainer-base) ·
[dev](https://github.com/majikmate/devcontainer-dev) ·
[classroom-web](https://github.com/majikmate/devcontainer-classroom-web) ·
[classroom-web-advanced](https://github.com/majikmate/devcontainer-classroom-web-advanced) ·
[classroom-exam-ts](https://github.com/majikmate/devcontainer-classroom-exam-ts)

## Use

Add `.devcontainer/devcontainer.json` to a repository:

```jsonc
{
  "image": "ghcr.io/majikmate/devcontainer-dev:2",
}
```

- `:2` receives all compatible updates (new tool versions, security updates).
- A full version (for example `:2.0.5`) stays available for at least 90 days.
- With a local Docker installation, run
  `docker pull ghcr.io/majikmate/devcontainer-dev:2` and then **Dev
  Containers: Rebuild Container** to get the newest version.

## Content

| Layer | Content | Version |
| ----- | ------- | ------- |
| (devcontainer-base) | Debian 13, user `dev`, zsh, SSH server; Go, Node.js with npm, Deno, Prettier | see [base](https://github.com/majikmate/devcontainer-base#content) |
| `github-cli` | GitHub CLI (`gh`) | newest release |
| (`devcontainer.json`) | Dev Container CLI (`@devcontainers/cli`), installed when the container is created | newest release |

## VS Code

- **Extensions:** the extensions of the base image, plus GitHub Actions.
- **Settings:** the settings of the base image (Prettier as the only
  formatter, format on save).

## Releases

- **Nightly check at 03:37 UTC.** A new version is released when an input
  changes: `.devcontainer`, `README.md`, the digest of `devcontainer-base:2`, or the newest
  GitHub CLI version. Pending Debian updates and an age above 7 days also lead
  to a new version.
- **Manual:** **Actions → Release → Run workflow**. The option `upstream` (on
  by default) first updates base and core; `force` releases without a change.
- **Pull requests** build and test both architectures and publish nothing.
- **Kept versions:** the newest release and the tags `2`, `2.x` and `latest`.
  Older releases and workflow runs are deleted after 90 days. **Actions →
  Prune** lists or deletes them at once; the scope `all-but-newest` keeps
  only the newest release and the newest run of each workflow.

Rules: [Releases](https://github.com/majikmate/devcontainer-core#releases).

## Change the image

Change `.devcontainer/` or `README.md` through a pull request. After the merge,
the new image is released automatically (GitHub shows the README of the newest
image on the package page).

## License

MIT

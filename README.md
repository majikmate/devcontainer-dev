# Classroom Codespace Image

A multi-architecture [Dev Container](https://containers.dev/) image for
classroom use based on Debian

**Image Location**

- [`ghcr.io/majikmate/classroom-codespace-image`](https://github.com/majikmate/classroom-codespace-image/pkgs/container/classroom-codespace-image).

**Supported Architectures:**

- `linux/amd64`
- `linux/arm64`

## Included Features

This image comes with a variety of pre-installed tools and languages.

### Core Tools

- **GitHub CLI**
- **Docker-in-Docker**

### Languages & Runtimes

- **Go**
- **Java** (OpenJDK, Gradle, Maven, Ant, Groovy)
- **Node.js** (LTS, pnpm, nvm)
- **Deno**
- **Python**
- **Conda & Mamba (Miniforge)**

## Version management

The configuration explicitly references a Dockerfile with a pinned image version
so that dependabot can detect version changes.

`devcontainer.json` feature version are locked by `devcontainer-lock.json`.

To manage the lock file install devcontainer cli:

```
$ npm install -g @devcontainers/cli
```

To check for potential upgrades to the latest feature versions use:

```
$ devcontainer outdated --workspace-folder .
```

To upgrade to the latest feature versions use:

```
$ devcontainer upgrade --workspace-folder .
```

## Usage in a Dev Container Environment

To use this image in your development environment, reference it in your
`.devcontainer/devcontainer.json` file as the `image` property. This ensures
your workspace uses the pre-configured tools and languages provided by the
image.

`.devcontainer/devcontainer.json`:

```json
{
    "name": "My Project",
    "image": "ghcr.io/majikmate/classroom-codespace-image:latest",

    // Add other features or customizations
    "features": {
        // e.g., "ghcr.io/devcontainers/features/rust:1": {}
    }
}
```

You can specify the image version using semantic versioning—pin to a major,
minor, or patch version as needed. The tag `latest` will always reference the
most recently published image.

**Examples:**

- Use the latest image:
  ```json
  "image": "ghcr.io/majikmate/classroom-codespace-image:latest"
  ```
- Pin to a major version (e.g., `1`):
  ```json
  "image": "ghcr.io/majikmate/classroom-codespace-image:1"
  ```
- Pin to a minor version (e.g., `1.2`):
  ```json
  "image": "ghcr.io/majikmate/classroom-codespace-image:1.2"
  ```
- Pin to a specific patch version (e.g., `1.2.3`):
  ```json
  "image": "ghcr.io/majikmate/classroom-codespace-image:1.2.3"
  ```

## Pulling the Image with Docker

You can also pull the image directly using Docker:

```sh
docker pull ghcr.io/majikmate/classroom-codespace-image:latest
```

Replace `latest` with a specific version tag if needed:

```sh
docker pull ghcr.io/majikmate/classroom-codespace-image:1.2.3
```

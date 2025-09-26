# DevContainer Development Environment

A flexible [Dev Container](https://containers.dev/) setup based on Debian 12
with custom user management and development tools.

## Features

This devcontainer includes:

### Core Development Tools

- **GitHub CLI** (v2.78.0) - Command line interface for GitHub
- **Git** - Version control with custom configuration
- **Go** (v1.25.1) - Go programming language
- **Node.js** (v22.19.0) - JavaScript runtime with pnpm and nvm
- **Deno** (v2.4.5) - Modern JavaScript/TypeScript runtime

### Environment Features

- **Custom User Management** - Automated user creation with configurable UID/GID
- **Locale Support** - en_US.UTF-8 with custom locale configuration
- **OS Updates** - Automatic system package updates on container creation

### VS Code Integration

- Pre-configured with recommended extensions:
  - VS Live Share
  - Deno language server
- Optimized settings for Git workflows
- Deno-powered TypeScript/JavaScript development

## Configuration

The devcontainer is configured through build arguments in `devcontainer.json`:

```json
{
    "build": {
        "dockerfile": "Dockerfile",
        "args": {
            "USERNAME": "prot",
            "USER_UID": "1001",
            "USER_GID": "1001"
        }
    }
}
```

### Custom User Management

The `adduser.sh` script handles user creation/updates:

- Creates users with specified UID/GID
- Updates existing users if UID/GID changes
- Supports both automatic and manual ID assignment

## Usage

### Prerequisites

- Docker or Podman
- VS Code with Dev Containers extension
- Optional: GitHub token for CLI authentication

### Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/majikmate/devcontainer-dev.git
   cd devcontainer-dev
   ```

2. Open in VS Code:
   ```bash
   code .
   ```

3. When prompted, reopen in container, or use Command Palette:
   - `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Select "Dev Containers: Reopen in Container"

### Environment Variables

Set these environment variables for full functionality:

- `GH_TOKEN` - GitHub personal access token for CLI authentication

## Development Features

### Git Configuration

The container comes with optimized Git settings for smooth workflows:

- Auto-fetch enabled
- Auto-stash before pulls
- Rebase on sync
- Smart commit with auto-staging
- Post-commit sync

### Deno Integration

- Deno language server enabled by default
- TypeScript checking with `--check=all`
- Test runner with `--allow-all` permissions
- Default formatter and linter

## Version Management

Feature versions are managed through the devcontainer configuration:

```bash
# Install devcontainer CLI
npm install -g @devcontainers/cli

# Check for feature updates
devcontainer outdated --workspace-folder .

# Update to latest versions
devcontainer upgrade --workspace-folder .
```

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
  - **Go extension** - Full Go language support with formatting, debugging, and
    testing
  - **Deno language server** - TypeScript/JavaScript development with modern
    runtime
  - **GitHub Actions** - Workflow syntax highlighting and validation
- Optimized settings for Git workflows with auto-rebase and smart commits
- DevContainer schema validation for `.devcontainer` files
- Language-specific formatting:
  - **Go files**: `gofmt` with automatic import organization and tab indentation
  - **TypeScript/JavaScript**: Deno formatter with consistent code style

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

1. **Clone this repository:**
   ```bash
   git clone https://github.com/majikmate/devcontainer-dev.git
   cd devcontainer-dev
   ```

2. **Open in VS Code:**
   ```bash
   code .
   ```

3. **Reopen in container:**
   - When prompted, select "Reopen in Container"
   - Or use Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`):
     - Select "Dev Containers: Reopen in Container"

4. **Verify setup:** The container will automatically install and configure all
   tools. You can verify the setup by running:
   ```bash
   go version && node --version && deno --version && gh --version
   ```

### Troubleshooting

**Container fails to build:**

- Ensure Docker is running and has sufficient resources
- Check for any proxy or network restrictions
- Try rebuilding without cache: Command Palette → "Dev Containers: Rebuild
  Container"

**Permission issues:**

- The container uses a custom user with configurable UID/GID
- Modify `USER_UID` and `USER_GID` in `.devcontainer/devcontainer.json` if
  needed

**GitHub CLI authentication:**

- Set the `GH_TOKEN` environment variable with a valid GitHub personal access
  token
- Or authenticate interactively: `gh auth login`

### Environment Variables

The container automatically configures the development environment. Optional
environment variables for enhanced functionality:

- `GH_TOKEN` - GitHub personal access token for CLI authentication (recommended
  for private repositories)

## Development Features

### DevContainer Schema Validation

The environment includes JSON schema validation for DevContainer configuration
files:

- **devcontainer.json**: Full schema validation and IntelliSense
- **devcontainer-feature.json**: Feature development support
- Auto-completion and error detection for configuration files
- Up-to-date schema definitions from the official DevContainer specification

### Git Configuration

The container includes Git with optimized settings for smooth development
workflows:

- **Auto-fetch**: Automatically fetch changes from remote repositories
- **Auto-stash**: Automatically stash local changes before pulling/syncing
- **Smart commit**: Auto-stage all changes when committing with no staged files
- **Auto-rebase**: Rebase instead of merge when syncing branches
- **Post-commit sync**: Automatically sync changes after commits
- **Conflict resolution**: Streamlined handling of merge conflicts

These settings ensure seamless collaboration and reduce common Git workflow
friction.

### Go Development

- **Go v1.25.1** with full language server support
- **Automatic formatting** with `gofmt` on save
- **Import organization** - automatically sorts and removes unused imports
- **Tab indentation** following Go conventions
- **Integrated testing** and debugging support
- **Go modules** support with `go.mod` and `go.sum` formatting
- **Code actions** for common Go development tasks

### Deno Integration

- Full Deno language server integration with VS Code
- TypeScript checking with `--check=all` for comprehensive validation
- Test runner with `--allow-all` permissions for seamless testing
- Default formatter and linter with automatic code formatting
- Support for modern JavaScript/TypeScript features and JSX

## Version Management

Tool versions are explicitly defined in the devcontainer configuration for
reproducible builds:

- **GitHub CLI**: v2.78.0
- **Go**: v1.25.1
- **Node.js**: v22.19.0 (with pnpm v10.15.1, nvm v0.40.3)
- **Deno**: v2.4.5

### Updating Versions

Feature versions can be managed through the devcontainer configuration:

```bash
# Install devcontainer CLI
npm install -g @devcontainers/cli

# Check for feature updates
devcontainer outdated --workspace-folder .

# Update to latest versions (modify .devcontainer/devcontainer.json)
devcontainer upgrade --workspace-folder .
```

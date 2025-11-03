# Development Setup Guide

This guide walks you through setting up a local development environment for BlockchainStandards.dev.

## Prerequisites

Before you begin, ensure you have the following installed:

### Required Software

1. **Hugo Extended** (v0.120.0 or later)

   ```bash
   # macOS
   brew install hugo

   # Linux
   snap install hugo --channel=extended

   # Windows
   choco install hugo-extended

   # Verify installation
   hugo version
   ```

2. **Node.js and npm** (v18 or later)

   ```bash
   # macOS
   brew install node

   # Linux
   curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
   sudo apt-get install -y nodejs

   # Windows
   choco install nodejs

   # Verify installation
   node --version
   npm --version
   ```

3. **Git**

   ```bash
   # macOS
   brew install git

   # Linux
   sudo apt-get install git

   # Windows
   choco install git

   # Verify installation
   git --version
   ```

4. **GitHub CLI (gh)** - Optional but recommended

   ```bash
   # macOS
   brew install gh

   # Linux
   curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
   sudo apt update
   sudo apt install gh

   # Windows
   choco install gh

   # Verify installation
   gh --version

   # Authenticate
   gh auth login
   ```

## Repository Setup

### 1. Clone the Repository

```bash
# Clone via HTTPS
git clone https://github.com/mattboston/blockchainstandards.git

# Or clone via SSH
git clone git@github.com:mattboston/blockchainstandards.git

# Navigate to the repository directory
cd blockchainstandards
```

### 2. Install Dependencies

```bash
# Install Node.js dependencies (for Tailwind CSS)
npm install
```

### 3. Verify Setup

```bash
# Test Hugo installation
hugo version

# Test build
hugo --quiet

# Start development server
hugo server -D
```

If everything is set up correctly, you should see:

```text
Web Server is available at http://localhost:1313/
```

## Development Workflow

### Starting the Development Server

```bash
hugo server -D
```

Options:

- `-D` - Include draft content
- `-F` - Include future-dated content
- `--disableFastRender` - Full re-render on changes

### Building the Site

```bash
# Standard build
hugo

# Production build (minified)
hugo --minify

# Clean build
hugo --cleanDestinationDir --minify
```

### Watching Tailwind CSS Changes

In a separate terminal:

```bash
npm run dev
```

This watches for CSS changes and recompiles Tailwind automatically.

## Project Structure

```text
blockchainstandards/
├── content/              # Markdown content files
│   ├── blog/            # Blog posts
│   ├── standards/       # Standards documentation
│   ├── community/       # Community pages
│   └── ...
├── layouts/             # Hugo templates
│   ├── _default/        # Default templates
│   ├── partials/        # Reusable components
│   └── standards/       # Standards layouts
├── static/              # Static assets
│   ├── css/             # Compiled CSS (Tailwind output)
│   ├── js/              # JavaScript files
│   └── images/          # Images and media
├── config.yaml          # Hugo site configuration
├── tailwind.config.js   # Tailwind CSS configuration
├── package.json         # Node.js dependencies
└── public/              # Generated site (git-ignored)
```

## Common Tasks

### Creating New Content

**Blog Post:**

```bash
hugo new blog/my-post-title.md
```

**Standards Page:**

```bash
hugo new standards/my-standard.md
```

**Custom Page:**

```bash
hugo new custom-page.md
```

### Testing Changes

1. **Local preview:**

   ```bash
   hugo server -D
   ```

2. **Build validation:**

   ```bash
   hugo --quiet
   ```

3. **Template validation:**

   ```bash
   hugo --verbose
   ```

### Linting and Formatting

**Markdown:**

```bash
# Lint
npx markdownlint content/**/*.md

# Format (if you have prettier installed)
npx prettier --write content/**/*.md
```

**CSS:**

```bash
# Lint
npx stylelint static/css/**/*.css

# Format
npx prettier --write static/css/**/*.css
```

## Troubleshooting

### Hugo Server Won't Start

**Issue:** Port 1313 already in use

**Solution:**

```bash
# Find and kill the process
lsof -ti:1313 | xargs kill -9

# Or use a different port
hugo server -p 8080
```

### Build Errors

**Issue:** Template errors

**Solution:**

```bash
# Get detailed error information
hugo --verbose
```

**Issue:** Configuration errors

**Solution:**

```bash
# Validate configuration
hugo config
hugo config --format json
```

### Live Reload Not Working

**Issue:** Changes not reflecting in browser

**Solution:**

```bash
# Restart with full re-render
hugo server --disableFastRender
```

### Tailwind CSS Not Compiling

**Issue:** CSS changes not appearing

**Solution:**

```bash
# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install

# Rebuild CSS
npm run build

# Or watch for changes
npm run dev
```

## Environment Variables

Create a `.env` file in the repository root (git-ignored):

```bash
# Example environment variables
HUGO_ENV=development
```

For production:

```bash
HUGO_ENV=production
```

## Git Configuration

### Recommended Git Settings

```bash
# Set your identity
git config user.name "Your Name"
git config user.email "your.email@example.com"

# Helpful aliases
git config alias.st status
git config alias.co checkout
git config alias.br branch
git config alias.cm commit
```

### Pre-commit Hooks (Optional)

Install pre-commit hooks to validate changes:

```bash
# Create .git/hooks/pre-commit
#!/bin/bash
hugo --quiet
if [ $? -ne 0 ]; then
  echo "Hugo build failed. Fix errors before committing."
  exit 1
fi
```

Make it executable:

```bash
chmod +x .git/hooks/pre-commit
```

## Next Steps

- Read the [Hugo Workflow Guide](hugo-workflow.md) for detailed Hugo usage
- Check the [Content Creation Guide](content-creation.md) to start adding content
- Review [CLAUDE.md](../../CLAUDE.md) for Claude Code integration guidelines

## Getting Help

- **Hugo Documentation**: [gohugo.io/documentation/](https://gohugo.io/documentation/)
- **Tailwind Documentation**: [tailwindcss.com/docs](https://tailwindcss.com/docs)
- **GitHub Issues**: Report problems or ask questions
- **GitHub Discussions**: Community support

## Additional Resources

- [Hugo Quick Start](https://gohugo.io/getting-started/quick-start/)
- [Tailwind CSS Installation](https://tailwindcss.com/docs/installation)
- [GitHub CLI Manual](https://cli.github.com/manual/)

# Contributing to BlockchainStandards.dev

Thank you for your interest in contributing to BlockchainStandards.dev! This document provides guidelines and instructions for contributing to the website.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Making Changes](#making-changes)
- [Standards Content](#standards-content)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)
- [Style Guide](#style-guide)
- [Testing](#testing)

## Code of Conduct

This project follows a standard code of conduct. We expect all contributors to:

- Be respectful and inclusive
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards other community members

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Hugo** (v0.152.2 or later) - [Installation Guide](https://gohugo.io/installation/)
- **Node.js** (v20 or later) - [Download](https://nodejs.org/)
- **npm** (comes with Node.js)
- **Git** - [Installation Guide](https://git-scm.com/downloads)

### Optional Tools

- **markdownlint-cli** - For linting markdown files locally
- **GitHub CLI (gh)** - For easier pull request management

## Development Setup

1. **Fork the repository** on GitHub

2. **Clone your fork**:

   ```bash
   git clone https://github.com/YOUR_USERNAME/blockchainstandards-website.git
   cd blockchainstandards-website
   ```

3. **Add the upstream remote**:

   ```bash
   git remote add upstream https://github.com/BlockchainStandardsOrg/blockchainstandards-website.git
   ```

4. **Initialize git submodules** (for standards content):

   ```bash
   git submodule update --init --recursive
   ```

5. **Install dependencies**:

   ```bash
   npm install
   ```

6. **Start the development server**:

   ```bash
   npm run dev
   ```

   This will start Hugo server with draft content and watch for Tailwind CSS changes. The site will be available at `http://localhost:1313`.

## Making Changes

### Branch Naming

Create a descriptive branch name for your changes:

```bash
git checkout -b feature/add-new-page
git checkout -b fix/typo-in-about-page
git checkout -b docs/update-contributing-guide
```

Use prefixes like:

- `feature/` - New features or enhancements
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `style/` - Styling changes
- `refactor/` - Code refactoring

### Local Development

- **Development mode** (with drafts and live reload):

  ```bash
  npm run dev
  ```

- **Build for production**:

  ```bash
  npm run build
  ```

- **Hugo server only** (without Tailwind watch):

  ```bash
  hugo server
  ```

## Standards Content

The standards content is maintained in a separate repository and included as a git submodule at `content/standards/`.

### To Update Standards Content

If you want to contribute to the standards themselves (not the website), please visit the [BlockchainStandards repository](https://github.com/BlockchainStandardsOrg/BlockchainStandards).

### To Update the Submodule Reference

If the standards repository has been updated and you want to pull those changes:

```bash
cd content/standards
git pull origin main
cd ../..
git add content/standards
git commit -m "chore: update standards submodule"
```

Or from the website root:

```bash
git submodule update --remote --merge
git add content/standards
git commit -m "chore: update standards submodule"
```

## Commit Guidelines

This project follows [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools

### Examples

```bash
git commit -m "feat: add supporters page with company logos"
git commit -m "fix: correct navigation menu alignment on mobile"
git commit -m "docs: update README with new deployment instructions"
git commit -m "style: improve blog post card spacing"
git commit -m "chore: update Hugo version in GitHub Actions"
```

### Scope (Optional)

You can specify a scope to provide additional context:

```bash
git commit -m "feat(blog): add RSS feed support"
git commit -m "fix(navigation): resolve dropdown menu issue on Safari"
```

## Pull Request Process

1. **Update your fork** with the latest upstream changes:

   ```bash
   git fetch upstream
   git checkout main
   git merge upstream/main
   ```

2. **Create a feature branch**:

   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes** and commit them following the commit guidelines

4. **Run linting and tests** (see [Testing](#testing) section)

5. **Push to your fork**:

   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request** on GitHub:
   - Go to the original repository
   - Click "New Pull Request"
   - Select your fork and branch
   - Fill in the PR template with:
     - Description of changes
     - Related issues (if any)
     - Screenshots (for UI changes)
     - Testing performed

7. **Address review feedback** if requested

8. **Wait for approval** and merge

### Pull Request Guidelines

- Keep PRs focused on a single feature or fix
- Include screenshots for visual changes
- Update documentation if needed
- Ensure all CI checks pass
- Link to related issues using `Fixes #123` or `Closes #123`

## Style Guide

### Markdown

- Follow the `.markdownlint.yaml` configuration
- Use ATX-style headers (`#` instead of underlines)
- One sentence per line (makes diffs cleaner)
- Use fenced code blocks with language identifiers
- Add blank lines before and after headings, lists, and code blocks

### Front Matter

All content files should include front matter:

```yaml
---
title: "Page Title"
date: 2025-11-21
draft: false
weight: 1
---
```

### CSS/Tailwind

- Use Tailwind utility classes when possible
- Follow existing component patterns
- Keep custom CSS minimal and well-documented
- Ensure responsive design (mobile-first approach)

## Testing

### Markdown Linting

Run markdownlint to check markdown files:

```bash
npm install -g markdownlint-cli
markdownlint -c .markdownlint.yaml -i .markdownlintignore "**/*.md"
```

### Build Test

Ensure the site builds without errors:

```bash
npm run build
```

### Visual Testing

1. Start the development server: `npm run dev`
2. Navigate to `http://localhost:1313`
3. Test your changes in multiple browsers (Chrome, Firefox, Safari)
4. Test responsive design using browser dev tools
5. Check that all links work correctly

### Commit Message Validation

Commit messages are automatically validated by commitlint in CI. To test locally, ensure your commit messages follow the conventional commits format.

## Questions or Issues?

If you have questions or run into issues:

- Check existing [Issues](https://github.com/BlockchainStandardsOrg/blockchainstandards-website/issues)
- Open a new issue with a clear description
- Join the community discussion channels (see [Community page](https://blockchainstandards.dev/community/))

## License

By contributing to BlockchainStandards.dev, you agree that your contributions will be licensed under the same license as the project.

---

Thank you for contributing to BlockchainStandards.dev!

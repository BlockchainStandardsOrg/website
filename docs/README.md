# BlockchainStandards.dev Repository Documentation

Welcome to the BlockchainStandards.dev repository documentation. This documentation provides comprehensive information about the repository structure, development workflows, and contribution guidelines.

## About BlockchainStandards.dev

BlockchainStandards.dev is an open community-driven initiative focused on defining best practices, guidelines, and standards for blockchain node deployments and release engineering. The project aims to bring consistency, reliability, and automation-friendly design principles to how blockchain projects release, configure, and operate their nodes.

## Repository Structure

```text
blockchainstandards/
├── content/                   # Site content
│   ├── blog/                 # Blog posts
│   ├── standards/            # Standards documentation
│   ├── community/            # Community pages
│   ├── supporters/           # Supporter pages
│   ├── privacy/              # Privacy policy
│   └── terms/                # Terms of service
├── layouts/                  # Hugo templates
│   ├── _default/             # Default layouts
│   ├── partials/             # Reusable partials
│   └── standards/            # Standards-specific layouts
├── static/                   # Static assets
│   ├── css/                  # Stylesheets
│   ├── js/                   # JavaScript
│   └── images/               # Images
├── docs/                     # Repository documentation
│   ├── guides/               # How-to guides
│   └── reference/            # Technical reference
├── .claude/                  # Claude Code configuration
│   ├── commands/             # Custom slash commands
│   └── docs/                 # Claude-specific docs
├── config.yaml               # Hugo configuration
├── tailwind.config.js        # Tailwind CSS config
├── package.json              # Node dependencies
├── CLAUDE.md                 # Claude Code guidelines
└── README.md                 # Project README
```

## Quick Start

### Prerequisites

- **Hugo** (v0.120.0+) - Static site generator
- **Node.js** (v18+) and npm - For Tailwind CSS
- **Git** - Version control
- **GitHub CLI (gh)** - GitHub operations

### Local Development

1. **Clone the repository:**

   ```bash
   git clone https://github.com/mattboston/blockchainstandards.git
   cd blockchainstandards
   ```

2. **Install dependencies:**

   ```bash
   npm install
   ```

3. **Start development server:**

   ```bash
   hugo server -D
   ```

4. **View the site:**

   Open [http://localhost:1313](http://localhost:1313) in your browser

### Building for Production

```bash
hugo --minify
```

Output will be in `public/`

## Documentation Structure

### Guides (`docs/guides/`)

Step-by-step how-to guides for common tasks:

- [Development Setup Guide](guides/development-setup.md) - Set up your local development environment
- [Hugo Workflow Guide](guides/hugo-workflow.md) - Working with Hugo static site generator
- [Content Creation Guide](guides/content-creation.md) - Creating blog posts and pages

### Reference (`docs/reference/`)

Technical reference documentation:

- [Repository Structure](reference/repository-structure.md) - Detailed repository organization
- [Slash Commands](reference/slash-commands.md) - Claude Code custom commands
- [Hugo Reference](reference/hugo-reference.md) - Hugo-specific information

## Key Technologies

- **Hugo** - Static site generator
- **Tailwind CSS** - Utility-first CSS framework
- **Vercel** - Hosting and deployment
- **CloudFlare** - DNS management
- **GitHub Actions** - CI/CD automation

## Contributing

We welcome contributions from the community! Please read our [Contributing Guide](guides/contributing.md) to get started.

### Contribution Workflow

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with `hugo server`
5. Submit a pull request

## Claude Code Integration

This repository uses Claude Code with custom slash commands for streamlined development workflows:

- `/plan` - Create GitHub issues
- `/codegen` - Generate code
- `/test` - Test implementation
- `/review` - Create pull requests
- `/merge` - Merge and close issues

See [Slash Commands Reference](reference/slash-commands.md) for details.

## Deployment

The site is automatically deployed to Vercel when changes are pushed to the `main` branch.

**Build Configuration:**

- Build command: `hugo --minify`
- Output directory: `public`
- Install command: `npm install`

## Getting Help

- **GitHub Issues**: Report bugs or request features
- **GitHub Discussions**: Ask questions and share ideas
- **Documentation**: Browse these docs for detailed information

## Links

- **Website**: [blockchainstandards.dev](https://blockchainstandards.dev)
- **GitHub**: [github.com/BlockchainStandardsOrg/BlockchainStandards](https://github.com/BlockchainStandardsOrg/BlockchainStandards)
- **Issues**: [github.com/BlockchainStandardsOrg/BlockchainStandards/issues](https://github.com/BlockchainStandardsOrg/BlockchainStandards/issues)
- **Discussion**: [github.com/BlockchainStandardsOrg/BlockchainStandards/discussions](https://github.com/BlockchainStandardsOrg/BlockchainStandards/discussions)

## License

See LICENSE file for details.

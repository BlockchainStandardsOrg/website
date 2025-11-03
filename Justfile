# Blockchain Standards Website Commands

# Start development server with hot reload
dev:
    npm run dev

# Build the website for production
build:
    npm run build

# Build only the CSS (useful for development)
css:
    npm run tailwind:build

# Watch CSS changes during development
css-watch:
    npm run tailwind:watch

# Start Hugo server only (without CSS watching)
hugo-server:
    hugo server -D

# Build Hugo only (without CSS)
hugo-build:
    hugo --minify

# Clean build artifacts
clean:
    rm -rf public
    rm -rf static/css/main.css

# Install dependencies
install:
    npm install

# Lint markdown (uses repo config/ignore)
lint:
    markdownlint -c .markdownlint.yaml -i .markdownlintignore "**/*.md"

# Lint and attempt fixes (if supported by your markdownlint)
lint-fix:
    markdownlint -c .markdownlint.yaml -i .markdownlintignore --fix "**/*.md"

# Lint only staged markdown files (for pre-commit)
lint-staged:
    @STAGED_FILES=$$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.md$$'); \
    if [ -n "$$STAGED_FILES" ]; then \
        echo "$$STAGED_FILES" | xargs markdownlint -c .markdownlint.yaml -i .markdownlintignore; \
    else \
        echo "No staged markdown files to lint"; \
    fi

# Quick build validation (no output)
validate:
    hugo --quiet

# Hugo strict check (treat warnings as errors)
hugo-lint:
    hugo --panicOnWarning --printI18nWarnings --printPathWarnings --templateMetricsHints --gc --minify

# Run all checks
check:
    @just lint
    @just hugo-lint

# Show help
help:
    @echo "Available commands:"
    @echo "  dev         - Start development server with hot reload"
    @echo "  build      - Build the website for production"
    @echo "  css        - Build only the CSS"
    @echo "  css-watch  - Watch CSS changes during development"
    @echo "  hugo-server - Start Hugo server only"
    @echo "  hugo-build  - Build Hugo only"
    @echo "  clean      - Clean build artifacts"
    @echo "  install    - Install dependencies"
    @echo "  lint       - Lint markdown content"
    @echo "  lint-fix   - Lint markdown and attempt fixes"
    @echo "  lint-staged - Lint staged markdown files"
    @echo "  validate   - Validate site build (quiet)"
    @echo "  hugo-lint  - Hugo strict build (warnings as errors)"
    @echo "  check      - Run all checks (lint + validate)"
    @echo "  help       - Show this help message"

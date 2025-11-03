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
    @echo "  help       - Show this help message"

# Hugo Workflow Guide

This guide explains how to work with Hugo for the BlockchainStandards.dev website.

## Table of Contents

- [Content Creation](#content-creation)
- [Working with Templates](#working-with-templates)
- [Front Matter](#front-matter)
- [Hugo Commands](#hugo-commands)
- [Content Organization](#content-organization)
- [Testing and Validation](#testing-and-validation)
- [Common Patterns](#common-patterns)

## Content Creation

### Creating a Blog Post

```bash
# Create a new blog post
hugo new blog/my-post-title.md
```

This creates a file at `content/blog/my-post-title.md` with front matter:

```yaml
---
title: "My Post Title"
date: 2025-01-15
draft: true
---
```

Edit the file and add your content using Markdown.

### Creating a Standards Page

```bash
# Create a new standard
hugo new standards/my-standard.md
```

Standards pages typically include:

```yaml
---
title: "My Standard"
weight: 10
draft: false
description: "Brief description of the standard"
---

# My Standard

Content goes here...
```

### Creating a Custom Page

```bash
# Create a page in any section
hugo new community/new-page.md
```

## Working with Templates

### Template Hierarchy

Hugo uses a template hierarchy to render content:

```
layouts/
├── _default/
│   ├── baseof.html       # Base template
│   ├── single.html       # Single page template
│   └── list.html         # List page template
├── partials/
│   ├── header.html       # Header partial
│   ├── footer.html       # Footer partial
│   └── navigation.html   # Navigation partial
└── standards/
    ├── single.html       # Standards single page
    └── list.html         # Standards list page
```

### Using Partials

Partials are reusable template components:

```go-html-template
{{ partial "header.html" . }}

<main>
  {{ .Content }}
</main>

{{ partial "footer.html" . }}
```

### Common Hugo Variables

```go-html-template
{{ .Title }}              # Page title
{{ .Content }}            # Page content (rendered markdown)
{{ .Date }}               # Page date
{{ .Permalink }}          # Full URL to page
{{ .RelPermalink }}       # Relative URL to page
{{ .Params.description }} # Custom front matter parameter
{{ .Site.Title }}         # Site title from config
{{ .Site.BaseURL }}       # Site base URL
```

### Looping Through Content

```go-html-template
{{ range .Pages }}
  <article>
    <h2><a href="{{ .RelPermalink }}">{{ .Title }}</a></h2>
    <p>{{ .Summary }}</p>
  </article>
{{ end }}
```

## Front Matter

Front matter is metadata at the top of content files.

### Standard Front Matter Fields

```yaml
---
title: "Page Title"           # Required - page title
date: 2025-01-15              # Required for blog posts
draft: false                  # true = not published
description: "SEO description" # Meta description
tags: ["tag1", "tag2"]        # Tags for blog posts
author: "Author Name"         # Post author
weight: 10                    # Order in lists (lower = first)
---
```

### Blog Post Front Matter

```yaml
---
title: "Kubernetes Blockchain Deployment Guide"
date: 2025-01-15
draft: false
author: "Matt Boston"
description: "Learn how to deploy blockchain nodes on Kubernetes"
tags: ["kubernetes", "deployment", "devops"]
categories: ["guides"]
---
```

### Standards Page Front Matter

```yaml
---
title: "Docker Container Standards"
weight: 40
draft: false
description: "Standards for blockchain node Docker containers"
---
```

## Hugo Commands

### Development Commands

```bash
# Start dev server
hugo server

# Include drafts
hugo server -D

# Include future-dated posts
hugo server -F

# Full re-render (disable fast render)
hugo server --disableFastRender

# Use different port
hugo server -p 8080

# Bind to all interfaces
hugo server --bind 0.0.0.0
```

### Build Commands

```bash
# Standard build
hugo

# Production build (minified)
hugo --minify

# Clean build directory first
hugo --cleanDestinationDir

# Build with garbage collection
hugo --gc

# Quiet build (less output)
hugo --quiet

# Verbose build (more output)
hugo --verbose
```

### Configuration Commands

```bash
# Display configuration
hugo config

# Output config as JSON
hugo config --format json

# Output config as YAML
hugo config --format yaml
```

### Content Commands

```bash
# Create new content
hugo new blog/post.md

# List draft content
hugo list drafts

# List future content
hugo list future

# List expired content
hugo list expired

# List all content
hugo list all
```

## Content Organization

### Directory Structure

```
content/
├── blog/                  # Blog posts
│   ├── _index.md         # Blog section page
│   ├── post-1.md         # Individual post
│   └── post-2.md
├── standards/             # Standards documentation
│   ├── _index.md         # Standards section page
│   ├── docker.md         # Docker standard
│   ├── kubernetes.md     # Kubernetes standard
│   └── ...
├── community/             # Community pages
│   ├── _index.md
│   └── ...
└── _index.md             # Homepage content
```

### Section Pages (_index.md)

Section pages define the landing page for a content section:

```yaml
---
title: "Standards"
description: "Blockchain deployment standards"
---

# Standards

Welcome to our standards...
```

### Organizing by Date

Blog posts are typically organized by date:

```
blog/
├── 2024-12-15-first-post.md
├── 2025-01-10-second-post.md
└── 2025-01-15-third-post.md
```

Or in subdirectories:

```
blog/
├── 2024/
│   └── 12/
│       └── first-post.md
└── 2025/
    └── 01/
        ├── second-post.md
        └── third-post.md
```

## Testing and Validation

### Local Testing

```bash
# Start dev server
hugo server -D

# Visit http://localhost:1313 in browser
# Make changes - browser auto-reloads
```

### Build Validation

```bash
# Validate site builds without errors
hugo --quiet

# If errors, get details
hugo --verbose
```

### Check for Broken Links

```bash
# Build site
hugo

# Use a link checker (install first)
npm install -g broken-link-checker
blc http://localhost:1313 -ro
```

### Validate Front Matter

Ensure all required fields are present:

```bash
# Check for missing titles
grep -r "^title:" content/

# Check for drafts
hugo list drafts

# Check for future posts
hugo list future
```

### Performance Testing

```bash
# Build and check performance
hugo --minify --templateMetrics

# Check bundle size
du -sh public/
```

## Common Patterns

### Adding Images

Place images in `static/images/`:

```markdown
![Alt text](/images/my-image.png)
```

Or use Hugo's figure shortcode:

```markdown
{{< figure src="/images/my-image.png" alt="Alt text" caption="Image caption" >}}
```

### Internal Links

Link to other pages:

```markdown
[Link text](/standards/docker/)
[Blog post]({{< ref "blog/my-post.md" >}})
```

### Code Blocks

Use fenced code blocks with syntax highlighting:

````markdown
```bash
hugo server -D
```

```yaml
title: "My Page"
draft: false
```

```go
func main() {
    fmt.Println("Hello, Hugo!")
}
```
````

### Summaries and Excerpts

Hugo automatically creates summaries:

```markdown
---
title: "My Post"
---

This is the summary. It appears in post listings.

<!--more-->

This is the full content. It only appears on the single page.
```

Or define manually in front matter:

```yaml
---
title: "My Post"
summary: "Custom summary text"
---
```

### Custom Shortcodes

Create reusable content with shortcodes in `layouts/shortcodes/`:

```go-html-template
<!-- layouts/shortcodes/note.html -->
<div class="note">
  {{ .Inner }}
</div>
```

Use in content:

```markdown
{{< note >}}
This is a note!
{{< /note >}}
```

### Taxonomies (Tags/Categories)

Define in front matter:

```yaml
---
title: "My Post"
tags: ["kubernetes", "docker"]
categories: ["guides"]
---
```

List pages for tags are auto-generated at:
- `/tags/kubernetes/`
- `/tags/docker/`

### Menus

Add to main menu via front matter:

```yaml
---
title: "About"
menu:
  main:
    weight: 10
    name: "About Us"
---
```

Or in config.yaml:

```yaml
menu:
  main:
    - name: "Standards"
      url: "/standards/"
      weight: 10
```

## Troubleshooting

### Content Not Showing

**Problem:** New content doesn't appear

**Solutions:**
```bash
# Check if it's a draft
hugo list drafts

# Include drafts in dev server
hugo server -D

# Check if date is in future
hugo list future

# Include future posts
hugo server -F
```

### Template Errors

**Problem:** Template rendering errors

**Solutions:**
```bash
# Get detailed error info
hugo --verbose

# Check template syntax
# Look for unclosed {{ }} or {{ end }}
```

### Build Failures

**Problem:** Hugo build fails

**Solutions:**
```bash
# Check config syntax
hugo config

# Validate front matter YAML
# Look for incorrect indentation or missing quotes

# Check for invalid characters in filenames
# Use lowercase and hyphens only
```

## Next Steps

- Read the [Content Creation Guide](content-creation.md) for detailed content guidelines
- Check the [Hugo Reference](../reference/hugo-reference.md) for command reference
- Review [CLAUDE.md](../../CLAUDE.md) for project-specific rules

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Templates](https://gohugo.io/templates/)
- [Hugo Content Management](https://gohugo.io/content-management/)
- [Hugo Functions](https://gohugo.io/functions/)

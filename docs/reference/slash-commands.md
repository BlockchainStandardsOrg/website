# Slash Commands Reference

This document provides a complete reference for Claude Code custom slash commands used in this repository.

## Overview

The BlockchainStandards.dev repository uses Claude Code with custom slash commands to streamline development workflows. These commands automate common tasks like planning, code generation, testing, and deployment.

## Command Categories

- **Planning**: Create and refine GitHub issues
- **Implementation**: Generate code and documentation
- **Testing**: Validate implementations
- **Review**: Create pull requests
- **Deployment**: Merge and close issues
- **Utility**: Helper commands

## Planning Phase

### /plan

Create a new GitHub issue with context gathering and clarifying questions.

**Usage:**

```text
/plan [title] [context]
```

**Parameters:**

- `title` - Issue title (optional, will prompt if omitted)
- `context` - Additional context or requirements

**Process:**

1. Asks clarifying questions about scope and requirements
2. Gathers information from existing files
3. Creates structured GitHub issue with:
   - Clear problem statement
   - Acceptance criteria
   - Implementation notes
   - Testing plan
4. Returns issue ID and URL

**Example:**

```text
/plan Add Docker container standard documentation
```

**Output:**

```text
Created issue #42: Add Docker container standard documentation
https://github.com/mattboston/blockchainstandards/issues/42
```

### /groom

Refine an existing GitHub issue with additional context and requirements.

**Usage:**

```text
/groom [issue-id] [context]
```

**Parameters:**

- `issue-id` - GitHub issue ID (e.g., #42)
- `context` - Additional context to add

**Process:**

1. Fetches current issue details
2. Incorporates new context
3. Updates issue description
4. Adds clarifying questions if needed

**Example:**

```text
/groom #42 Include examples from Cosmos and Polkadot
```

## Implementation Phase

### /codegen

Generate code for a GitHub issue, lint, format, and stage changes.

**Usage:**

```text
/codegen [issue-id] [context]
```

**Parameters:**

- `issue-id` - GitHub issue ID (e.g., #42) - infers from branch if omitted
- `context` - Optional implementation tweaks

**Process:**

1. Fetches issue details
2. Asks clarifying questions
3. Examines codebase patterns
4. Generates code following conventions
5. Lints and formats code
6. Stages changes with `git add`
7. Creates GitHub comment with summary
8. Pauses for user review

**Example:**

```text
/codegen #42
```

**What it generates:**

- Hugo content files (`.md`)
- Hugo templates (`.html`)
- Configuration updates (`.yaml`)
- Tailwind CSS styles (`.css`)

**Does NOT:**

- Create commits (use `/commit`)
- Generate documentation (use `/docsgen`)

### /docsgen

Generate or update documentation based on staged changes and GitHub issue.

**Usage:**

```text
/docsgen [issue-id]
```

**Parameters:**

- `issue-id` - GitHub issue ID - infers from branch if omitted

**Process:**

**Phase 1 - Outline:**

1. Analyzes staged changes
2. Searches existing docs
3. Creates documentation outline
4. Posts outline to GitHub for approval

**Phase 2 - Writing:**

1. Generates documentation following outline
2. Matches existing documentation style
3. Lints and formats markdown
4. Stages documentation files

**Example:**

```text
/docsgen #42
```

**Documentation types:**

- `docs/guides/` - How-to guides
- `docs/reference/` - Technical reference
- Top-level - Overviews and architecture

### /commit

Create a conventional commit from staged changes.

**Usage:**

```text
/commit [tldr]
```

**Parameters:**

- `tldr` - Optional brief description

**Process:**

1. Analyzes staged changes
2. Reviews recent commits for style
3. Runs `git status` and `git diff`
4. Generates conventional commit message
5. Creates commit with proper attribution

**Commit format:**

```text
type(scope): description

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Commit types:**

- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation changes
- `style` - Code style changes
- `refactor` - Code refactoring
- `test` - Test additions/changes
- `chore` - Maintenance tasks

**Example:**

```text
/commit

# Generates:
docs(standards): add Docker container standards

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

### /test

Test implementation based on GitHub issue testing plan and fix issues.

**Usage:**

```text
/test [issue-id]
```

**Parameters:**

- `issue-id` - GitHub issue ID - infers from branch if omitted

**Process:**

1. Fetches issue testing plan
2. Runs Hugo build validation
3. Tests templates and configuration
4. Checks for errors
5. Fixes issues if found
6. Re-tests until passing
7. Stages all changes
8. Creates GitHub comment with results

**Testing steps:**

```bash
hugo --quiet              # Build validation
hugo config               # Config check
hugo --verbose            # Template validation
hugo --minify             # Production build test
```

**Example:**

```text
/test #42
```

## Review Phase

### /review

Lint, format, commit, and create GitHub PR for the issue.

**Usage:**

```text
/review [issue-id]
```

**Parameters:**

- `issue-id` - GitHub issue ID - infers from branch if omitted

**Process:**

1. Checks for staged changes
2. Commits changes if needed (via `/commit`)
3. Pushes branch to remote
4. Creates GitHub PR with:
   - Title from commit/issue
   - Body with summary and changes
   - Links to issue
5. Returns PR URL

**Example:**

```text
/review #42

# Creates PR:
# Title: docs(standards): add Docker container standards
# Links to issue #42
# Returns: https://github.com/mattboston/blockchainstandards/pull/45
```

## Deployment Phase

### /merge

Squash and merge PR to main with proper attribution and close GitHub issue.

**Usage:**

```text
/merge [issue-id]
```

**Parameters:**

- `issue-id` - GitHub issue ID - infers from branch if omitted

**Process:**

1. Fetches PR for issue
2. Verifies PR is approved
3. Squash merges to main
4. Closes linked issue
5. Deletes feature branch
6. Switches to main
7. Pulls latest changes

**Example:**

```text
/merge #42
```

## Utility Commands

### /refresh

Clear context and reload CLAUDE.md rules, workflows, and guidelines.

**Usage:**

```text
/refresh
```

**Process:**

1. Clears current context
2. Reloads CLAUDE.md
3. Refreshes rule understanding
4. Updates workflow knowledge

**When to use:**

- After updating CLAUDE.md
- When Claude seems confused about rules
- At start of new session

### /add-rule

Add a new rule to the CLAUDE.md guidelines.

**Usage:**

```text
/add-rule [category] <description>
```

**Parameters:**

- `category` - Rule category (Questions, Planning, Code Generation, etc.)
- `description` - Rule description

**Process:**

1. Validates category exists
2. Generates rule ID (e.g., C-5)
3. Adds rule to CLAUDE.md
4. Stages changes

**Example:**

```text
/add-rule "Code Generation" "Always validate Hugo templates after changes"

# Adds to CLAUDE.md:
# - **C-5** Always validate Hugo templates after changes
```

### /make-command

Create a new Claude Code slash command.

**Usage:**

```text
/make-command <name> <description>
```

**Parameters:**

- `name` - Command name (without /)
- `description` - What the command does

**Process:**

1. Creates `.claude/commands/<name>.md`
2. Generates command template
3. Adds to available commands list

**Example:**

```text
/make-command lint "Run all linters on the codebase"

# Creates: .claude/commands/lint.md
```

### /dependabot

Manage Dependabot PRs: checkout, test, approve, and merge.

**Usage:**

```text
/dependabot <pr-number>    # Full workflow
/dependabot test           # Test current branch
/dependabot update         # Commit and push changes
/dependabot check          # Check CI/CD status
/dependabot approve        # Approve and merge
```

**Full workflow:**

```text
/dependabot 123

# Executes:
1. Checkout PR #123
2. Verify it's from Dependabot
3. Run test suite
4. Approve PR
5. Squash merge
6. Clean up branches
```

**Sub-commands:**

- `test` - Run Hugo build and validation tests
- `update` - Commit fixes and push to PR
- `check` - Check GitHub Actions status
- `approve` - Approve, merge, and cleanup

## Workflow Examples

### Feature Development Workflow

```bash
# 1. Plan the feature
/plan Add Kubernetes deployment standard

# 2. Generate code
/codegen #50

# 3. Generate documentation
/docsgen #50

# 4. Test implementation
/test #50

# 5. Create PR
/review #50

# 6. After approval, merge
/merge #50
```

### Quick Fix Workflow

```bash
# 1. Create issue (optional for small fixes)
/plan Fix typo in Docker standards

# 2. Generate fix
/codegen #51

# 3. Test
/test #51

# 4. Commit and PR
/commit
/review #51

# 5. Merge
/merge #51
```

### Documentation Update Workflow

```bash
# 1. Groom existing issue with new requirements
/groom #42 Add troubleshooting section

# 2. Update documentation
/docsgen #42

# 3. Review and commit
/commit
/review #42

# 4. Merge
/merge #42
```

### Dependabot Workflow

```bash
# Option 1: Full automation
/dependabot 120

# Option 2: Manual control
gh pr checkout 120
/dependabot test
# Review changes
/dependabot update  # If fixes needed
/dependabot check   # Monitor CI
/dependabot approve
```

## Best Practices

### Issue Management

1. **Use /plan for all features** - Creates clear, traceable issues
2. **Groom as needed** - Update issues when requirements change
3. **Keep issues focused** - Break complex tasks into sub-issues

### Code Generation

1. **Always test after codegen** - Run `/test` before committing
2. **Review staged changes** - Use `git diff --cached`
3. **Generate docs too** - Use `/docsgen` for significant changes

### Commit Management

1. **Use conventional commits** - Let `/commit` generate proper messages
2. **Commit related changes together** - Stage all files for a feature
3. **Review commit messages** - Ensure they accurately describe changes

### PR and Merge

1. **Create PRs via /review** - Ensures proper formatting and links
2. **Wait for approval** - Don't merge without review
3. **Squash merge via /merge** - Keeps history clean

## Troubleshooting

### Command Not Found

**Problem:** Slash command doesn't work

**Solution:**

```text
/refresh  # Reload command definitions
```

### Command Errors

**Problem:** Command fails with error

**Solutions:**

1. Check if you're on correct branch
2. Verify issue exists: `gh issue view #42`
3. Check git status: `git status`
4. Ensure changes are staged: `git add .`

### GitHub CLI Issues

**Problem:** `gh` commands fail

**Solutions:**

```bash
# Verify authentication
gh auth status

# Re-authenticate
gh auth login

# Check repository
gh repo view
```

## Additional Resources

- Command definitions: `.claude/commands/`
- Claude documentation: `.claude/docs/`
- Project guidelines: `CLAUDE.md`
- Hugo reference: `docs/reference/hugo-reference.md`

## Command Summary

| Command | Purpose | Phase |
|---------|---------|-------|
| `/plan` | Create GitHub issue | Planning |
| `/groom` | Refine issue | Planning |
| `/codegen` | Generate code | Implementation |
| `/docsgen` | Generate docs | Implementation |
| `/commit` | Create commit | Implementation |
| `/test` | Test implementation | Testing |
| `/review` | Create PR | Review |
| `/merge` | Merge and close | Deployment |
| `/refresh` | Reload guidelines | Utility |
| `/add-rule` | Add new rule | Utility |
| `/make-command` | Create command | Utility |
| `/dependabot` | Manage Dependabot | Utility |

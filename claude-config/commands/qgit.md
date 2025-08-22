# qgit

Add, commit, and push changes using Conventional Commits format with quality checks

## Usage

```
/qgit
```

## Examples

```bash
# In a clean session (after /clear) - commits all changed files
/qgit

# In an ongoing session - commits only session-specific changes
/qgit

# Expected output:
# 🔍 Analyzing changes...
# 📁 Session Context: Clean (checking entire codebase)
# 📁 Files to commit: 5 files changed
#
# 🧪 Running quality checks...
# ✓ Type check: pnpm run check-types (passed)
# ✓ Lint: pnpm run lint (passed)
# ✓ Tests: pnpm run test (passed)
# ✓ Build: pnpm run build (passed)
#
# 📝 Generated commit message:
# feat(auth): implement user authentication system
#
# Add login/logout functionality with JWT tokens
# Include password reset flow and session management
# Update user dashboard to show authentication state
#
# ✅ Committing and pushing...
# [main 1a2b3c4] feat(auth): implement user authentication system
# Pushed to origin/main

# Expected output with errors:
# 🧪 Running quality checks...
# ✓ Type check: pnpm run check-types (passed)
# ❌ Lint: pnpm run lint (2 warnings found)
#   → Unused variable 'temp' in auth.js:42
#   → Missing semicolon in utils.js:15
#
# 🤔 Quality checks found issues. What would you like to do?
# 1. Fix issues and re-run checks
# 2. Commit and push anyway
# 3. Cancel commit
```

## Description

This command automates the complete git workflow by adding changes to staging, creating a properly formatted commit message using Conventional Commits specification, running quality checks, and pushing to remote. It intelligently determines scope based on session context - checking the entire codebase after a clean session or only session-specific changes during ongoing work.

This command will:

- Detect session context to determine which files to commit
- Run comprehensive quality checks before committing
- Generate Conventional Commits formatted messages automatically
- Handle errors gracefully with user options
- Complete the full add-commit-push workflow
- Follow project-specific quality check configurations
- will not reference Claude Code or Anthropic in commit messages / descriptions

## Implementation

The command should:

1. **Session Context Detection**
   - **Clean Session Context**: If session started after `/clear` command
     - Check entire codebase for any uncommitted changes
     - Use `git status` to find all modified, added, or deleted files
   - **Ongoing Session Context**: If session has active development history
     - Track only files modified during the current session
     - Focus commit scope on session-specific changes only

2. **Change Analysis and Staging**
   - Identify files to be committed based on session context
   - Display list of files that will be included in commit
   - Run `git add` for the identified files
   - Show diff summary to user for confirmation

3. **Quality Checks Execution**
   - **Check CLAUDE.md**: Look for quality check commands specified
   - **Check package.json**: Look for standard script commands
   - **Run in this order** (skip if command doesn't exist):
     - Type checking: `pnpm run check-types` or equivalent
     - Linting: `pnpm run lint` or equivalent
     - Testing: `pnpm run test` or equivalent
     - Building: `pnpm run build` or equivalent
   - **Error Handling**: If any check fails, present options:
     1. Fix issues and re-run checks
     2. Commit and push anyway
     3. Cancel commit

4. **Conventional Commit Message Generation**
   - **Analyze changes** to determine appropriate commit type:
     - `feat:` for new features or functionality
     - `fix:` for bug fixes and patches
     - `docs:` for documentation changes
     - `style:` for formatting and style changes
     - `refactor:` for code refactoring
     - `test:` for adding or modifying tests
     - `chore:` for maintenance tasks
     - `perf:` for performance improvements
     - `ci:` for CI/CD changes
     - `build:` for build system changes

5. **Commit Message Structure**
   - **Format**: `<type>[optional scope]: <description>`
   - **Type**: Determined from change analysis
   - **Scope**: Inferred from affected modules/components (optional)
   - **Description**: Clear, concise summary in imperative mood
   - **Body**: Additional context for complex changes (optional)
   - **Footer**: Breaking changes or issue references (optional)

6. **Commit Message Rules**
   - ✅ **MUST** use Conventional Commits format
   - ✅ **MUST** use imperative mood ("add feature" not "added feature")
   - ✅ **MUST** be concise but descriptive
   - ❌ **MUST NOT** reference Claude Code or Anthropic
   - ❌ **MUST NOT** exceed 72 characters in subject line
   - ✅ **SHOULD** include scope when applicable
   - ✅ **SHOULD** include body for complex changes

7. **Breaking Change Detection**
   - Analyze changes for potential breaking changes
   - follow conventional commits rules for breaking changes
   - Include `BREAKING CHANGE:` footer with description
   - Examples:
     - `feat!: remove deprecated API endpoints`
     - `fix(api)!: change response format for user data`

8. **Commit and Push Execution**
   - Create commit with generated message
   - Show commit hash and summary
   - Push to remote origin
   - Display push confirmation
   - Handle push errors (conflicts, permissions, etc.)

9. **Error Handling and Recovery**
   - **Quality Check Failures**: Offer fix/skip/cancel options
   - **Git Conflicts**: Guide user through conflict resolution
   - **Network Issues**: Suggest retry or offline commit
   - **Permission Issues**: Provide helpful error messages
   - **Empty Changes**: Inform user no changes to commit

10. **Advanced Features**
    - **Scope Detection**: Automatically detect scope from file paths
      - `src/components/auth/` → `(auth)`
      - `docs/` → `(docs)`
      - `tests/` → `(test)`
    - **Multi-type Changes**: Handle commits affecting multiple areas
    - **Dependency Updates**: Special handling for package.json changes
    - **Configuration Changes**: Recognize config file modifications

11. **Feedback and Confirmation**
    - Show preview of commit message before executing
    - Display files included in commit
    - Confirm quality check results
    - Show git operations progress
    - Provide final confirmation of successful push

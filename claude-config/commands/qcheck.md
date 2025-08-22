# qcheck

Perform skeptical code review against CLAUDE.md best practices checklists

## Usage

```
/qcheck
```

## Examples

```bash
# Review all major code changes made in the session
/qcheck

# Expected output when all checklists are available:
# 🔍 SKEPTICAL CODE REVIEW - Senior Engineer Analysis
#
# 📋 Analyzing MAJOR changes only (skipping minor tweaks)...
#
# ✓ Writing Functions Best Practices (CLAUDE.md):
#   ✓ Function names are descriptive and follow naming conventions
#   ⚠️ Function `processData` is doing too many things - consider splitting
#   ✓ Parameters are properly typed and validated
#
# ✓ Writing Tests Best Practices (CLAUDE.md):
#   ✓ Test coverage for happy path scenarios
#   ✗ Missing edge case tests for null/undefined inputs
#   ✓ Test names clearly describe what is being tested
#
# ✓ Implementation Best Practices (CLAUDE.md):
#   ✓ Error handling follows project patterns
#   ⚠️ Consider extracting magic numbers to constants
#   ✓ Code follows existing architectural patterns

# Expected output when checklists are missing:
# ❌ Missing checklist: "Writing Functions Best Practices" not found in CLAUDE.md
# ❌ Missing checklist: "Writing Tests Best Practices" not found in CLAUDE.md
# ✓ Found checklist: "Implementation Best Practices"
#
# 🤔 Should I add the missing best practices checklists to CLAUDE.md based on this project's nature and scope? (y/n)
```

## Description

This command performs a thorough, skeptical code review of all major code changes introduced during the session. Acting as a senior software engineer, it validates changes against three critical best practices checklists from CLAUDE.md, focusing only on substantial modifications while ignoring minor tweaks.

This command will:

- Identify all MAJOR code changes made during the session (ignoring minor edits)
- Apply a skeptical, senior engineer perspective to code review
- Check against Writing Functions, Writing Tests, and Implementation best practices
- Flag missing checklists and offer to create them
- Provide specific, actionable feedback for each violation or concern

## Implementation

The command should:

1. **Change Identification**
   - Scan the session history for all code modifications
   - Filter out minor changes (formatting, small tweaks, comments)
   - Focus on MAJOR changes: new functions, significant logic changes, new files
   - Categorize changes by type (functions, tests, implementation patterns)

2. **Checklist Validation**
   - Look for "Writing Functions Best Practices" checklist in CLAUDE.md
   - Look for "Writing Tests Best Practices" checklist in CLAUDE.md
   - Look for "Implementation Best Practices" checklist in CLAUDE.md
   - If any checklist is missing, note it and ask permission to add it

3. **Skeptical Analysis Mode**
   - Adopt a SKEPTICAL senior software engineer mindset
   - Question every major decision and implementation choice
   - Look for potential issues, code smells, and violations
   - Be thorough and critical, not just confirmatory

4. **Functions Best Practices Review**
   - Check function naming conventions and clarity
   - Validate parameter handling and type safety
   - Review function size and single responsibility principle
   - Assess error handling and edge case coverage
   - Evaluate performance implications

5. **Tests Best Practices Review**
   - Verify test coverage for new/modified functionality
   - Check test naming and organization
   - Validate test isolation and independence
   - Review edge case and error condition testing
   - Assess test maintainability and clarity

6. **Implementation Best Practices Review**
   - Check architectural consistency with existing codebase
   - Validate error handling patterns
   - Review security considerations
   - Assess performance and scalability implications
   - Check for code duplication and reusability

7. **Missing Checklist Handling**
   - Clearly identify which checklists are missing from CLAUDE.md
   - Ask user permission to add missing checklists
   - If permitted, analyze the project's nature and scope
   - Generate appropriate best practices checklists tailored to the project
   - Add the new checklists to CLAUDE.md

8. **Feedback Generation**
   - Provide specific, actionable feedback for each issue found
   - Use clear symbols: ✓ (good), ⚠️ (warning), ✗ (violation)
   - Include line numbers or specific code references when possible
   - Suggest concrete improvements for each identified issue
   - Prioritize feedback by severity and impact

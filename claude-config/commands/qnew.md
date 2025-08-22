# qnew

Initialize a new coding session with best practices from CLAUDE.md

## Usage

```
/qnew
```

## Examples

```bash
# Start a new coding session with best practices loaded
/qnew

# Expected output when CLAUDE.md exists:
# ✓ Found CLAUDE.md in project root
# ✓ Read and understood all best practices
# ✓ Key practices identified: [summary of practices]
# Ready to begin coding with established best practices

# Expected output when CLAUDE.md is missing:
# ✗ CLAUDE.md not found in project root
# Please run /init to create the best practices file before proceeding
```

## Description

This command ensures that Claude Code reads and commits to following all coding best practices defined in the project's CLAUDE.md file before beginning any coding work. It acts as a quality gate to maintain consistent code standards across the entire development session.

This command will:

- Check for the existence of CLAUDE.md in the project root
- Read and parse all best practices from the file
- Commit to following these practices throughout the entire session
- Provide confirmation and summary of understood practices
- Prevent coding work if best practices are not available

## Implementation

The command should:

1. **File Existence Check**
   - Look for `CLAUDE.md` in the project root directory
   - If not found, display error message and request user to run `/init`
   - Do not proceed with any coding until this is resolved

2. **Best Practices Loading**
   - Read the entire contents of `CLAUDE.md`
   - Parse and understand all listed best practices
   - Identify key coding standards, patterns, and guidelines

3. **Commitment and Confirmation**
   - Explicitly acknowledge understanding of the best practices
   - Commit to following these practices for ALL code written in the session
   - Provide a summary of key practices to demonstrate comprehension

4. **Session Initialization**
   - Set the context for the entire coding session
   - Ensure all subsequent code follows the established practices
   - Maintain consistency across all development work

5. **Error Handling**
   - Handle cases where CLAUDE.md exists but is empty or malformed
   - Provide clear feedback about what was found and understood
   - Guide user to fix any issues with the best practices file

# qcheck_functions

Perform skeptical function-specific code review against Writing Functions Best Practices

## Usage

```
/qcheck_functions
```

## Examples

```bash
# Review all major function changes made in the session
/qcheck_functions

# Expected output when checklist is available:
# 🔍 SKEPTICAL FUNCTION REVIEW - Senior Engineer Analysis
#
# 📋 Analyzing MAJOR function changes only (skipping minor tweaks)...
#
# 🔧 Function: `calculateUserScore(user, metrics)`
# ✓ Writing Functions Best Practices (CLAUDE.md):
#   ✓ Function name clearly describes what it does
#   ✓ Parameters are properly typed and validated
#   ⚠️ Function is 45 lines long - consider breaking into smaller functions
#   ✗ Missing JSDoc documentation for complex calculation logic
#   ✓ Single responsibility principle maintained
#   ⚠️ Magic number 0.85 should be extracted to a named constant
#
# 🔧 Function: `validateEmailFormat(email)`
# ✓ Writing Functions Best Practices (CLAUDE.md):
#   ✓ Function name is clear and specific
#   ✓ Single parameter with appropriate type
#   ✓ Proper error handling for invalid inputs
#   ✓ Returns boolean as expected from name
#   ✓ Function length is appropriate (8 lines)

# Expected output when checklist is missing:
# ❌ Missing checklist: "Writing Functions Best Practices" not found in CLAUDE.md
#
# 🤔 Should I add a "Writing Functions Best Practices" checklist to CLAUDE.md
#    based on this project's nature and scope? (y/n)
```

## Description

This command performs a focused, skeptical code review specifically for function-related changes made during the session. Acting as a senior software engineer, it validates all major function additions and modifications against the "Writing Functions Best Practices" checklist from CLAUDE.md, providing detailed feedback on function design, implementation, and quality.

This command will:

- Identify all MAJOR function changes made during the session (new functions, significant edits)
- Apply skeptical analysis to each function individually
- Check against Writing Functions Best Practices from CLAUDE.md
- Flag missing checklist and offer to create it based on project needs
- Provide specific, function-level feedback and improvement suggestions

## Implementation

The command should:

1. **Function Change Identification**
   - Scan session history for all function-related modifications
   - Filter out minor changes (formatting, small parameter tweaks, comments)
   - Focus on MAJOR changes: new functions, significant logic changes, major refactors
   - Create a list of functions that need review

2. **Checklist Validation**
   - Look specifically for "Writing Functions Best Practices" checklist in CLAUDE.md
   - If checklist is missing, note it and ask permission to add it
   - Parse the checklist items for systematic evaluation

3. **Skeptical Function Analysis**
   - Adopt a SKEPTICAL senior software engineer mindset for each function
   - Question every design decision and implementation choice
   - Look for potential issues, code smells, and best practice violations
   - Be thorough and critical about function quality

4. **Per-Function Review Process**
   - Analyze each major function individually
   - Display function signature and brief context
   - Apply all checklist items from "Writing Functions Best Practices"
   - Provide specific feedback for each checklist item

5. **Function-Specific Best Practices Check**
   - **Naming**: Function names are descriptive, clear, and follow conventions
   - **Parameters**: Proper typing, validation, and reasonable parameter count
   - **Length**: Functions are appropriately sized and focused
   - **Single Responsibility**: Each function does one thing well
   - **Return Values**: Consistent and predictable return patterns
   - **Error Handling**: Proper error handling and edge case management
   - **Documentation**: Adequate comments and JSDoc for complex functions
   - **Side Effects**: Functions avoid unexpected side effects
   - **Testability**: Functions are designed to be easily testable

6. **Missing Checklist Handling**
   - If "Writing Functions Best Practices" is missing from CLAUDE.md
   - Ask user permission to add the checklist
   - If permitted, analyze the project's function patterns and requirements
   - Generate appropriate function best practices tailored to the project
   - Add the new checklist to CLAUDE.md

7. **Detailed Feedback Generation**
   - Use clear symbols: ✓ (compliant), ⚠️ (warning/suggestion), ✗ (violation)
   - Provide specific examples and line references when possible
   - Suggest concrete improvements for each identified issue
   - Include code snippets or examples where helpful
   - Prioritize feedback by impact on code quality and maintainability

8. **Summary and Recommendations**
   - Provide an overall assessment of function quality
   - Highlight patterns of issues across multiple functions
   - Suggest broader improvements or refactoring opportunities
   - Recommend next steps for addressing identified issues

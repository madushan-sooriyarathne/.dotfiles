# qplan

Analyze codebase consistency and create an implementation plan that follows existing patterns

## Usage

```
/qplan [feature or task description]
```

## Examples

```bash
# Plan a new feature implementation
/qplan Add user authentication to the dashboard

# Plan a refactoring task
/qplan Refactor the payment processing module

# Plan a bug fix
/qplan Fix memory leak in data processing pipeline

# Expected output:
# 🔍 Analyzing similar codebase patterns...
# 📋 Implementation Plan:
# ✓ Consistency Check: Follows existing auth patterns in /auth module
# ✓ Minimal Changes: Reuses 3 existing components, adds 2 new files
# ✓ Code Reuse: Leverages AuthProvider, validates with existing schemas
# 📝 Detailed Plan: [step-by-step implementation]
```

## Description

This command analyzes the existing codebase to create implementation plans that maintain consistency, minimize changes, and maximize code reuse. It helps ensure new features or modifications align with established patterns and architecture while avoiding unnecessary duplication or architectural drift.

This command will:

- Check for the existence of CLAUDE.md in the project root
- Read and parse all best practices from the file
- Scan the codebase for similar functionality and patterns
- Evaluate consistency with existing architectural decisions
- Identify opportunities for code reuse and component sharing
- Generate a plan that introduces minimal disruptive changes
- Provide specific recommendations for implementation approach

## Implementation

The command should:

1. **Codebase Analysis**
   - Scan relevant directories and files for similar functionality
   - Identify existing patterns, components, and architectural decisions
   - Map out current code structure and dependencies
   - Analyze naming conventions, file organization, and coding patterns

2. **Consistency Evaluation**
   - Compare proposed changes against existing codebase patterns
   - Check for alignment with current architectural decisions
   - Identify potential conflicts with established conventions
   - Ensure naming and structure follow project standards

3. **Minimal Changes Assessment**
   - Determine the smallest set of changes needed
   - Identify which existing files need modification vs new files needed
   - Prioritize extending existing functionality over creating new components
   - Minimize impact on existing APIs and interfaces

4. **Code Reuse Identification**
   - Find existing components, utilities, and patterns that can be leveraged
   - Identify shared functionality that shouldn't be duplicated
   - Recommend existing abstractions and interfaces to build upon
   - Suggest refactoring opportunities if beneficial

5. **Plan Generation**
   - Create a step-by-step implementation plan
   - Specify which files to modify, create, or refactor
   - Include consistency rationale for each decision
   - Provide code reuse recommendations with specific examples
   - Estimate the scope of changes (files affected, lines of code, etc.)

6. **Validation and Recommendations**
   - Verify the plan maintains backward compatibility
   - Suggest testing strategies that align with existing test patterns
   - Recommend documentation updates following project conventions
   - Identify potential risks or dependencies that need consideration

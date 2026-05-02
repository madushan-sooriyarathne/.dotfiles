# qplan

Analyze codebase consistency and create an implementation plan that follows existing patterns

## Description

This command analyzes the existing codebase to create implementation plans that maintain consistency, minimize changes, and maximize code reuse. It helps ensure new features or modifications align with established patterns and architecture while avoiding unnecessary duplication or architectural drift.

This command will:

- Analyze user's task request
- Check if graphify-out/GRAPH_REPORT.md file exists and if exists, Read graphify-out/GRAPH_REPORT.md for god nodes and community structure of the project before searching raw files.
- Scan the codebase for similar functionality and patterns
- Evaluate consistency with existing architectural decisions
- Identify opportunities for code reuse and component sharing
- Generate a plan that introduces minimal disruptive changes
- Provide specific recommendations for implementation approach

## Implementation

The command should:

1. **Codebase Analysis**
   - Read graphify-out/GRAPH_REPORT.md (if exists) for god nodes and community structure of the project before searching raw files.
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
   - Provide a summerized and compressed plan to user (use prevously loaded caveman skill)

6. **Validation and Recommendations**
   - Verify the plan maintains backward compatibility
   - Suggest testing strategies that align with existing test patterns
   - Recommend documentation updates following project conventions
   - Identify potential risks or dependencies that need consideration

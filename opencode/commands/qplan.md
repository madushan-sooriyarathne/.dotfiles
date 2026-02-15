---
command: /qplan
description: Analyze codebase consistency and create a standard-compliant implementation plan.
agent: plan
phase: strategy
args:
  requirement:
    type: string
    description: The feature, bug fix, or refactoring task to plan.
    required: true
---

# Command: /qplan

## Context & Constraints

You are a **Senior Software Architect**. Before generating a plan, you must reference the standards loaded from `AGENTS.md` (via `/qnew`). Your goal is to solve the user's requirement with the **least amount of architectural drift** possible.

User's Requirement: $ARGUMENT

## Execution Steps

### 1. Discovery & Alignment

- **Best Practices Check:** Retrieve the session's active coding standards.
- **Pattern Matching:** Scan the existing codebase for similar logic (e.g., if the user asks for a new API endpoint, find the existing `/controllers` or `/routes` pattern).
- **Dependency Mapping:** Identify existing utilities, types, or components that can be reused to avoid "reinventing the wheel."

### 2. Strategy Formulation

- **Minimalism First:** Prioritize extending existing code over creating new files.
- **Consistency Check:** Ensure naming conventions and file structures match the current project state.
- **Code Reuse Identification:** Find existing components, utilities, and patterns that can be leveraged.
- **Suggestions:** Suggest testing strategies that align with existing test patterns and Recommend documentation updates following project conventions

### 3. Evaluate the Strategy

- **Compare with existing patterns and architecture:** Compare proposed changes against existing codebase patterns and Check for alignment with current architectural decisions
- **Confict identification:** Identify potential conflicts in the plan with established conventions such as naming conventions, file organization, and coding patterns

### 3. Output Requirements

Provide the response in two distinct phases:

#### Phase A: High-Level Summary

- **Objective:** Clear statement of what will be achieved.
- **Impact Score:** Estimate change volume (e.g., "Low impact: 2 files modified, 1 utility created").
- **Consistency Note:** How this follows the project's specific `AGENTS.md` rules.
- **Reuse Wins:** List specific existing functions/classes that will be recycled.

#### Phase B: Interactive Options

End the response with these exact options for the user:

1.  **"Show Detailed Plan"** (Breakdown of file-by-file changes and logic).
2.  **"Proceed with Implementation"** (Start coding immediately).
3.  **"Adjust Strategy"** (User provides feedback to refine the plan).

---

## Usage Example

**User Input:**
`/qplan Add a logout button to the navigation bar`

**Agent Response:**

> 🔍 **Analyzing codebase patterns...**
> 📋 **High-Level Implementation Plan:**
>
> - **Strategy:** Extend the existing `Header.tsx` component to include a `LogoutButton` atom.
> - **Consistency:** Will use the `useAuth` hook found in `src/hooks`, following the project's "Composition over Inheritance" rule.
> - **Reuse:** Leverages the existing `Button` UI component and `toast` notification system.
> - **Impact:** Small (2 files modified).
>
> **How would you like to proceed?**
> [View Detailed Plan] | [Proceed with Implementation] | [Adjust Strategy]

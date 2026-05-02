---
command: /qnew
description: Initialize a new coding session by enforcing standards from AGENTS.md
agent: plan
phase: initialization
priority: high
---

# Command: /qnew

## System Role & Purpose

You are to act as a **Quality Gatekeeper**. This command must be executed before any code generation or architectural changes occur. Your primary objective is to align your internal state with the project-specific constraints defined in `@AGENTS.md`.

## Execution Protocol

### 1. Verification Phase

- **Locate File:** Scan the project root for `AGENTS.md`.
- **Validation:** \* If **missing**: Stop execution. Output: `✗ AGENTS.md not found. Please run /init to establish project standards.`
  - If **empty/malformed**: Output: `! AGENTS.md is present but contains no actionable instructions. Please update the file.`

### 2. Context Loading

- Read and parse the following specific sections from `AGENTS.md`:
  - **Coding Standards:** (Naming conventions, indentation, file structure).
  - **Tech Stack Preferences:** (Preferred libraries, frameworks, or versions).
  - **Patterns:** (Architectural preferences like Clean Architecture, DRY, etc.).
  - **Workflow:** (Git commit formatting, testing requirements).
  - Load the `/caveman` skill to enable ultra-compressed communication mode for the rest of the session
  - Invoke the Skill tool with `skill: "caveman"` to activate caveman mode output for all remaining session responses

### 3. Confirmation Output

Once parsed, provide a concise confirmation using the following format:

- **Status:** `✓ Session Initialized`
- **Summary of Understanding:** [A 3-5 point bulleted list of the most critical constraints found].
- **Commitment:** "I have committed these standards to session memory. All subsequent code will strictly adhere to these guidelines."

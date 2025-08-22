# qsum

Generate a comprehensive conversation summary with technical details and context

## Usage

```
/qsum
```

## Examples

```bash
# Generate a detailed summary of the current conversation
/qsum

# Expected output:
# <analysis>
# Reviewing the conversation chronologically:
# 1. User requested custom Claude Code commands for quality control
# 2. I created /qnew command for loading best practices
# 3. User then asked for /qplan for codebase consistency analysis
# [... detailed analysis continues ...]
# </analysis>
#
# <summary>
# 1. Primary Request and Intent:
#    User wanted to create a comprehensive set of custom Claude Code commands
#    for enforcing development best practices and quality control...
#
# 2. Key Technical Concepts:
#    - Claude Code custom commands and .claude/commands/ directory structure
#    - CLAUDE.md best practices file integration
#    - Conventional Commits specification
# [... summary continues with all 7 sections ...]
# </summary>
#
# 💾 Would you like me to:
# 1. Save this summary to claude-summary.md in the project root
# 2. Copy the summary to your system clipboard
# 3. Both save and copy
# 4. Neither (just display here)
```

## Description

This command creates a comprehensive, technically detailed summary of the entire conversation, capturing all user requests, technical decisions, code patterns, and architectural choices. It provides the essential context needed to continue development work without losing important details, organized in a structured format that preserves chronological development and technical accuracy.

This command will:

- Analyze the conversation chronologically to capture all user intents and requests
- Document all technical concepts, frameworks, and technologies discussed
- Enumerate specific files, code snippets, and modifications made
- Track problem-solving efforts and solutions implemented
- Identify pending tasks and current work status
- Suggest appropriate next steps based on recent work
- Offer to save the summary to a file or clipboard for reference

## Implementation

The command should:

1. **Comprehensive Conversation Analysis**
   - Review every message in the conversation chronologically
   - Identify all explicit user requests and underlying intents
   - Track the assistant's approach to addressing each request
   - Note key decisions, technical concepts, and code patterns
   - Capture specific details: file names, code snippets, function signatures

2. **Structured Analysis Process**
   - Wrap analysis in `<analysis>` tags for organization
   - For each conversation section, identify:
     - User's explicit requests and intents
     - Assistant's approach to addressing requests
     - Key decisions and technical concepts
     - Specific implementation details
   - Double-check for technical accuracy and completeness

3. **Primary Request and Intent Documentation**
   - Capture ALL explicit user requests in detail
   - Document the underlying intent behind each request
   - Identify patterns in user needs and objectives
   - Note any evolving or changing requirements

4. **Key Technical Concepts Identification**
   - List all important technical concepts discussed
   - Include technologies, frameworks, and methodologies
   - Document architectural patterns and design decisions
   - Note best practices and coding standards referenced

5. **Files and Code Sections Enumeration**
   - List all files examined, modified, or created
   - For each file, include:
     - Summary of why the file is important
     - Summary of changes made (if any)
     - Full code snippets where applicable
   - Pay special attention to recent messages and changes

6. **Problem Solving Documentation**
   - Document all problems that were solved
   - Note ongoing troubleshooting efforts
   - Include solution approaches and methodologies used
   - Track any unresolved issues or challenges

7. **Pending Tasks Tracking**
   - Outline tasks explicitly requested but not completed
   - Prioritize based on user emphasis and importance
   - Note any dependencies or prerequisites
   - Include specific requirements and constraints

8. **Current Work Analysis**
   - Describe precisely what was being worked on before summary request
   - Focus heavily on the most recent messages
   - Include specific file names and code snippets
   - Capture the exact state of work in progress

9. **Next Step Determination**
   - Only suggest next steps that are DIRECTLY aligned with user requests
   - Base suggestions on the most recent work being performed
   - If last task was concluded, only suggest if explicitly requested
   - Include direct quotes from recent conversation showing task context
   - Avoid tangential suggestions without user confirmation

10. **Summary Output Structure**

    ```
    <analysis>
    [Detailed chronological analysis ensuring all points covered]
    </analysis>

    <summary>
    1. Primary Request and Intent:
       [Comprehensive description of all user requests]

    2. Key Technical Concepts:
       - [Technical concept 1]
       - [Technical concept 2]
       - [...]

    3. Files and Code Sections:
       - [File Name 1]
         - [Importance summary]
         - [Changes summary]
         - [Code snippet]
       - [...]

    4. Problem Solving:
       [Problems solved and troubleshooting efforts]

    5. Pending Tasks:
       - [Explicit pending task 1]
       - [Explicit pending task 2]
       - [...]

    6. Current Work:
       [Precise description with file names and code snippets]

    7. Optional Next Step:
       [Next step with direct quotes from conversation]
    </summary>
    ```

11. **Post-Summary Options**
    - After generating the complete summary, ask user:
      - "💾 Would you like me to:"
      - "1. Save this summary to claude-summary.md in the project root"
      - "2. Copy the summary to your system clipboard"
      - "3. Both save and copy"
      - "4. Neither (just display here)"

12. **File Saving Implementation**
    - If user chooses to save to file:
      - Create `claude-summary.md` in project root
      - Include timestamp and conversation metadata
      - Format for easy reading and reference
    - If user chooses clipboard:
      - Format appropriately for clipboard usage
      - Include instructions for pasting/reference

13. **Quality Assurance**
    - Ensure technical accuracy in all details
    - Verify completeness of coverage
    - Check that no important context is lost
    - Maintain chronological accuracy
    - Preserve exact quotes and code snippets

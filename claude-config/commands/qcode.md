# qcode

Implement the planned solution

## Description

This command implements the previously planned solution while ensuring code quality as per the project instructions (CLAUDE.md / llm-instructions.md or documents in /guides directory) making sure the implementation is production-ready.

This command will:

- Execute the implementation plan created by previous planning commands
- Provide summerized progress reporting throughout the implementation (using minimum possible tokens - use previously loaded caveman skill)

## Implementation

The command should:

1. **Implementation Plan Execution**
   - Retrieve the most recent implementation plan from the session
   - If no plan exists, ask user to run `/qplan` first
   - Execute implementation steps in planned order
   - Track progress and report completion status for each step

2. **Code Implementation Process**
   - Create new files as specified in the plan
   - Modify existing files according to planned changes
   - Implement all required functionality and components
   - Follow existing code patterns and architectural decisions
   - Ensure consistency with project standards and conventions

3. \*_Comprehensive Testing Pipeline_
4. **Progress Reporting**
   - **Real-time Updates**: Show summerized progress throughout implementation (using previously loaded caveman skill)
     - File creation and modification status
     - Test execution progress and results
     - Quality check status and outcomes
   - **Summary Report**: Provide completion summary
     - List all files created/modified
     - Show test results and coverage changes
     - Report quality check outcomes
     - Highlight any remaining issues or warnings

5. **Project Configuration Detection**
   - **Automatic Detection**: Scan for project configuration files
     - `package.json` scripts and dependencies
     - Configuration files (biome.json, tsconfig.json, prettier, eslint, etc...)
     - CLAUDE.md specified commands and standards
   - **Fallback Commands**: Use common defaults if specific config not found
     - Try standard script names (`lint`, `format`, `test`, `check-types`)
     - Use common tool commands as fallbacks
     - Inform user about configuration assumptions made

6. **Integration with Other Commands**
   - **Plan Integration**: Work seamlessly with `/qplan` output
   - **Best Practices**: Follow standards from `/qnew` and CLAUDE.md
   - **Test Integration**: Complement `/qcheck_tests` validation
   - **Git Integration**: Prepare code for `/qgit` commit process

7. **Final Validation**
   - **Implementation Verification**: Confirm plan fully executed
   - **Ready State Confirmation**: Verify code is ready for commit/review
   - **Next Steps Suggestion**: Recommend `/qgit` or further testing if appropriate

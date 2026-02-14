---
description: Implement the planned solution with comprehensive quality checks and testing
agent: build
---

## Description

This command implements the previously planned solution while ensuring code quality through comprehensive testing, formatting, linting, and type checking as per the project instructions (in /guides directory) @AGENTS.md file. It follows a complete quality assurance pipeline that maintains code standards and prevents regressions, making sure the implementation is production-ready.

This command will:

- Check for the existence of @AGENTS.md in the project root
- Read and parse all best practices from the file
- Execute the implementation plan created by previous planning commands with any new requests / requirements from the user
- Run comprehensive test suites to verify functionality and prevent regressions
- Apply project-standard formatting to all newly created files
- Execute linting and type checking to ensure code quality
- Handle failures gracefully with automatic fixes where possible
- Provide detailed progress reporting throughout the implementation

User's Requirement: $ARGUMENT

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

3. **Comprehensive Testing Pipeline**
   - **New Tests Execution**: Run tests for newly implemented features
     - Verify all new functionality works as expected
     - Check that new tests pass completely
     - Report specific test results and coverage
   - **Regression Testing**: Run full existing test suite
     - Ensure no existing functionality is broken
     - Identify any failing tests caused by changes
     - Report the number of passing vs failing tests
   - **Test Failure Handling**: If tests fail
     - Analyze failure reasons and root causes
     - Implement fixes for failing tests
     - Re-run tests until all pass
     - Report fix actions taken

4. **Code Formatting Application**
   - **Detect Project Formatting**: Check for formatting configuration
     - Look for `.prettierrc`, `prettier.config.js`, or similar
     - Check `package.json` for formatting scripts
     - Identify project's preferred formatting tool
   - **Apply Formatting**: Run appropriate formatting command
     - Common commands: `pnpm run format`, `npm run format`, `yarn format`
     - Target only newly created/modified files when possible
     - Report formatting changes applied

5. **Linting Execution**
   - **Detect Linting Configuration**: Check for linting setup
     - Look for `.eslintrc`, `eslint.config.js`, or similar
     - Check `package.json` for lint scripts
     - Identify project's linting rules and standards
   - **Run Linting**: Execute linting checks
     - Common commands: `pnpm run lint`, `npm run lint`, `yarn lint`
     - Focus on newly created/modified files
     - Report any linting errors or warnings
   - **Fix Linting Issues**: If linting fails
     - Attempt automatic fixes where possible (`--fix` flag)
     - Manually resolve remaining issues
     - Re-run linting until all issues resolved

6. **Type Checking Execution**
   - **Detect Type Checking Setup**: Check for TypeScript configuration
     - Look for `tsconfig.json`, `jsconfig.json`
     - Check `package.json` for type checking scripts
     - Identify project's type checking requirements
   - **Run Type Checks**: Execute type checking
     - Common commands: `pnpm run check-types`, `tsc --noEmit`
     - Check all relevant files for type errors
     - Report type checking results
   - **Fix Type Issues**: If type checking fails
     - Analyze and fix type errors
     - Add necessary type annotations or imports
     - Update type definitions as needed
     - Re-run type checking until all issues resolved

7. **Quality Check Pipeline Order**
   1. **Implementation** → Complete the planned code changes
   2. **Testing** → Verify functionality and prevent regressions
   3. **Formatting** → Apply consistent code style
   4. **Linting** → Check code quality and standards
   5. **Type Checking** → Ensure type safety and correctness

8. **Error Handling and Recovery**
   - **Implementation Errors**: Handle coding errors gracefully
     - Provide clear error messages and context
     - Suggest fixes or alternative approaches
     - Allow user to modify plan if needed
   - **Quality Check Failures**: Handle pipeline failures
     - Stop pipeline on critical failures
     - Provide detailed failure information
     - Offer options to fix issues or override checks
     - Prevent pushing broken code

9. **Progress Reporting**
   - **Real-time Updates**: Show progress throughout implementation
     - File creation and modification status
     - Test execution progress and results
     - Quality check status and outcomes
   - **Summary Report**: Provide comprehensive completion summary
     - List all files created/modified
     - Show test results and coverage changes
     - Report quality check outcomes
     - Highlight any remaining issues or warnings

10. **Project Configuration Detection**
    - **Automatic Detection**: Scan for project configuration files
      - `package.json` scripts and dependencies
      - Configuration files (prettier, eslint, tsconfig)
      - AGENTS.md specified commands and standards
    - **Fallback Commands**: Use common defaults if specific config not found
      - Try standard script names (`lint`, `format`, `test`, `check-types`)
      - Use common tool commands as fallbacks
      - Inform user about configuration assumptions made

11. **Integration with Other Commands**
    - **Plan Integration**: Work seamlessly with `/qplan` output
    - **Best Practices**: Follow standards from `/qnew` and AGENTS.md
    - **Test Integration**: Complement `/qcheck_tests` validation
    - **Git Integration**: Prepare code for `/qgit` commit process

12. **Final Validation**
    - **Complete Quality Pipeline**: Ensure all checks pass
    - **Implementation Verification**: Confirm plan fully executed
    - **Ready State Confirmation**: Verify code is ready for commit/review
    - **Next Steps Suggestion**: Recommend `/qgit` or further testing if appropriate

## Usage

```
/qcode [optional insturctions]
```

## Examples

```bash
# Implement the current plan with full quality pipeline
/qcode

# Expected output:
# ✓ Found AGENTS.md in project root
# ✓ Read and understood all best practices
#
# 🚀 IMPLEMENTING PLANNED SOLUTION
#
# 📋 Implementation Plan:
# - Create user authentication components
# - Add login/logout functionality
# - Update routing and navigation
#
# 🔧 Implementation Progress:
# ✓ Created src/components/auth/LoginForm.tsx
# ✓ Created src/components/auth/AuthProvider.tsx
# ✓ Updated src/App.tsx with authentication routes
# ✓ Added authentication tests
#
# 🧪 Running Tests:
# ✓ New tests: 8/8 passing
# ✓ Existing tests: 156/156 passing
# ✓ All tests pass - no regressions detected
#
# 🎨 Running Formatting:
# ✓ pnpm run format (Prettier applied to 3 new files)
#
# 🔍 Running Quality Checks:
# ✓ pnpm run lint (no linting errors)
# ✓ pnpm run check-types (type checking passed)
#
# ✅ IMPLEMENTATION COMPLETE
# All quality checks passed - ready for review/commit

# Expected output with issues:
# 🧪 Running Tests:
# ✓ New tests: 8/8 passing
# ❌ Existing tests: 154/156 passing (2 failures)
#   → auth.test.js: Login validation test failing
#   → navigation.test.js: Route protection test failing
#
# 🔧 Fixing test failures...
# ✓ Fixed auth validation logic
# ✓ Updated route protection implementation
#
# 🧪 Re-running Tests:
# ✓ All tests: 156/156 passing
```

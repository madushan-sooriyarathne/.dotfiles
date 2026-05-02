# qcheck_tests

Perform skeptical test-specific code review against Writing Tests Best Practices

## Description

This command performs a focused, skeptical code review specifically for test-related changes made during the session. Acting as a senior software engineer, it validates all major test additions and modifications against the "Writing Tests Best Practices" checklist from CLAUDE.md, providing detailed feedback on test design, coverage, and quality.

This command will:

- Identify all MAJOR test changes made during the session (new tests, significant edits)
- Apply skeptical analysis to each test and test suite individually
- Check against Writing Tests Best Practices from CLAUDE.md
- Flag missing checklist and offer to create it based on project testing patterns
- Provide specific, test-level feedback and improvement suggestions

## Implementation

The command should:

1. **Test Change Identification**
   - Scan session history for all test-related modifications
   - Filter out minor changes (formatting, small assertion tweaks, comments)
   - Focus on MAJOR changes: new test files, new test cases, significant test logic changes
   - Identify both unit tests and integration tests that need review

2. **Checklist Validation**
   - Look specifically for "Writing Tests Best Practices" checklist in CLAUDE.md
   - If checklist is missing, note it and ask permission to add it
   - Parse the checklist items for systematic evaluation

3. **Skeptical Test Analysis**
   - Adopt a SKEPTICAL senior software engineer mindset for each test
   - Question every test design decision and implementation choice
   - Look for potential gaps in coverage, flaky tests, and best practice violations
   - Be thorough and critical about test quality and effectiveness

4. **Per-Test/Suite Review Process**
   - Analyze each major test file and test case individually
   - Display test names and brief context
   - Apply all checklist items from "Writing Tests Best Practices"
   - Provide specific feedback for each checklist item

5. **Test-Specific Best Practices Check**
   - **Test Names**: Descriptive, clear, and follow "should/when/given" patterns
   - **Test Structure**: Proper arrange-act-assert or given-when-then organization
   - **Test Isolation**: Tests are independent and don't rely on execution order
   - **Single Responsibility**: Each test verifies one specific behavior
   - **Coverage**: Edge cases, error conditions, and boundary values tested
   - **Assertions**: Clear, specific assertions that fail meaningfully
   - **Test Data**: Appropriate use of fixtures, mocks, and test data
   - **Performance**: Tests run efficiently without unnecessary delays
   - **Maintainability**: Tests are easy to understand and modify

6. **Test Coverage Analysis**
   - Evaluate if new functionality has corresponding tests
   - Check for missing edge cases and error scenarios
   - Assess integration test coverage for complex workflows
   - Identify over-testing or redundant test cases

7. **Missing Checklist Handling**
   - If "Writing Tests Best Practices" is missing from CLAUDE.md
   - Ask user permission to add the checklist
   - If permitted, analyze the project's testing framework and patterns
   - Generate appropriate test best practices tailored to the project's testing approach
   - Add the new checklist to CLAUDE.md

8. **Detailed Feedback Generation**
   - Use clear symbols: ✓ (compliant), ⚠️ (warning/suggestion), ✗ (violation)
   - Provide specific examples and test case references when possible
   - Suggest concrete improvements for each identified issue
   - Include code snippets or examples of better test patterns
   - Prioritize feedback by impact on test reliability and maintainability

9. **Test Quality Assessment**
   - Evaluate test readability and maintainability
   - Check for proper error message clarity when tests fail
   - Assess test execution speed and efficiency
   - Review mock usage and test doubles appropriateness

10. **Summary and Recommendations**
    - Provide an summerized overall assessment of test suite quality (use caveman skill for compressed output that uses less output tokens)
    - Highlight patterns of issues across multiple tests
    - Suggest broader testing improvements or refactoring opportunities
    - Recommend next steps for addressing identified testing gaps
    - Flag potential flaky tests or reliability concerns

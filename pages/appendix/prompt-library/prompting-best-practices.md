---
title: Prompting Best Practices
---

![MYOB Banner](../../../assets/images/myob-banner.png)

# Prompting Best Practices for AI-Assisted Development

## Overview

Effective prompting is the cornerstone of successful AI-assisted development. This guide covers modern prompting techniques, provider-specific nuances, and MYOB-specific patterns for getting the best results from AI tools in 2025.

## Table of Contents

- [General Prompting Principles](#general-prompting-principles)
- [Provider-Specific Nuances](#provider-specific-nuances)
- [Context Management](#context-management)
- [MYOB-Specific Prompting](#myob-specific-prompting)
- [Common Mistakes](#common-mistakes)

## General Prompting Principles

### Chain of Thought (CoT) Prompting

Encourage AI to think step-by-step for better reasoning:

❌ **Without CoT:**
```
Calculate the tax for this invoice.
```

✅ **With CoT:**
```
Calculate the tax for this invoice. Think step-by-step:
1. Identify the invoice amount and GST status
2. Determine the applicable tax rate
3. Calculate the tax amount
4. Show your working and final answer
```

**When to use CoT:**
- Complex calculations (financial, mathematical)
- Multi-step reasoning tasks
- Debugging complex issues
- Architecture decisions

**When to skip CoT:**
- Simple, straightforward tasks
- Code completion
- Quick questions with obvious answers

### Few-Shot Learning

Provide examples to guide the AI:

❌ **Zero-Shot (no examples):**
```
Generate a user story.
```

✅ **Few-Shot (with examples):**
```
Generate a user story following this format:

Example 1:
As a small business owner, I want to automatically categorize expenses 
so that I can save time during tax preparation.

Example 2:
As an accountant, I want to bulk-import client transactions so that 
I can process multiple clients efficiently.

Now generate a user story for: Automatic GST calculation on invoices.
```

**Best Practices:**
- Provide 2-3 examples (diminishing returns after that)
- Examples should match desired output format
- Use relevant examples (MYOB domain examples for MYOB work)
- Show edge cases in examples if important

### Specificity and Clarity

Be specific about what you want:

❌ **Vague:**
```
Make this code better.
```

✅ **Specific:**
```
Refactor this function to:
1. Use async/await instead of promises
2. Add error handling for network failures
3. Extract validation logic to separate function
4. Add JSDoc comments
5. Use TypeScript types instead of any
```

### Role-Based Prompting

Assign the AI a role for better responses:

```
You are an expert TypeScript developer at MYOB with deep knowledge of 
financial software development. Review this payment processing code for:
- Security vulnerabilities
- Financial calculation accuracy
- MYOB coding standards compliance
- Potential bugs or edge cases
```

**Effective Roles:**
- "Expert [language] developer"
- "Senior software architect"
- "Security review specialist"
- "Technical documentation writer"
- "MYOB financial domain expert"

### Structured Output

Request structured formats for easier parsing:

```
Analyze this code and provide output in this format:

## Security Issues
- [Issue 1]
- [Issue 2]

## Performance Concerns
- [Concern 1]

## Recommendations
1. [Priority 1]
2. [Priority 2]

## Code Quality Score
[Score out of 10 with justification]
```

## Provider-Specific Nuances

### OpenAI (GPT-4, GPT-4o, o1)

**Strengths:**
- Excellent code generation across languages
- Strong at following complex instructions
- JSON mode for structured outputs
- Function calling capabilities

**Prompting Tips:**
- Use system prompts for persistent context
- Leverage JSON mode for structured data
- Use function calling for tool integration
- Be explicit about TypeScript types wanted

**Example System Prompt:**
```
You are a MYOB TypeScript developer. Always:
- Use TypeScript strict mode
- Use Decimal for financial calculations
- Include JSDoc on public functions
- Follow MYOB coding standards
- Add comprehensive error handling
```

**GPT-4o Specific:**
- Faster than GPT-4, use as default
- Best for code completion and generation
- Good multimodal (can understand images of UIs, diagrams)

**o1 Specific (Reasoning Models):**
- Don't include "think step-by-step" (does it automatically)
- Give it complex problems directly
- Avoid over-prompting (let it reason freely)
- Use for architecture, complex debugging only

### Anthropic (Claude 3.5 Sonnet, Claude 3 Opus)

**Strengths:**
- Excellent long context handling (200k tokens)
- Thoughtful, detailed explanations
- Strong at analysis and reasoning
- Better at refusing harmful requests

**Prompting Tips:**
- Leverage long context (include entire files/docs)
- Ask for detailed analysis and explanations
- Use for code review (provides thorough feedback)
- Good for understanding large codebases

**Claude-Specific Techniques:**
- Prefers clear, direct instructions
- Responds well to "Please think carefully about..."
- Excellent at "Explain your reasoning"
- Use XML tags for structure: `<context>`, `<instructions>`, `<examples>`

**Example Claude Prompt:**
```
<context>
I'm refactoring our payment processing system at MYOB. We handle 
Australian and New Zealand transactions with different tax rules.
</context>

<instructions>
Analyze this payment processing code and suggest refactoring to:
1. Separate AU and NZ logic
2. Make it easier to add new countries
3. Ensure Decimal precision for all calculations
4. Maintain audit trail requirements
</instructions>

<code>
[paste code here]
</code>

Please explain your reasoning step-by-step.
```

### GitHub Copilot

**Strengths:**
- Fastest inline code completion
- Understands repository context well
- Good at following existing code patterns
- Excellent for boilerplate and repetitive code

**Prompting Tips:**
- Write detailed comments before code
- Use descriptive function/variable names
- Provide examples in surrounding code
- Break complex tasks into smaller steps

**Comment-Driven Development:**
```typescript
// Function to validate Australian Business Number (ABN)
// ABN is 11 digits, uses modulo 89 algorithm
// Returns true if valid, false if invalid
// Handles both string and number inputs
function validateABN(abn: string | number): boolean {
  // Copilot will generate the implementation
}
```

### Cursor

**Strengths:**
- Can choose models (GPT-4o, Claude, o1)
- MCP integration for rich context
- Composer for multi-file edits
- Best for complex refactoring

**Prompting Tips:**
- Use @ to specify context (@file, @folder, @docs)
- Leverage MCPs in prompts ("Search Glean for...")
- Use Composer for multi-file changes
- Activate Max Mode for complex problems only

**Cursor-Specific Prompt:**
```
@src/services/payment Using MCP, search our Glean docs for MYOB payment
processing standards, then refactor this service to follow those standards.
```

## Context Management

### How Much Context to Include

**Too Little Context:**
```
Fix this bug.

[No code, no error message, no context]
```
Result: Generic advice that doesn't help

**Too Much Context:**
```
[Pastes 50 files, 10,000 lines of code]

Fix line 247 in file X.
```
Result: Slow, expensive, AI may get confused

**Just Right:**
```
This function should calculate GST but returns incorrect results for
amounts less than $1.

Error: Expected $0.09 GST on $1.00, got $0.10

Code:
[paste the specific function - 20 lines]
[paste the test that fails - 10 lines]
[paste relevant type definitions - 5 lines]
```

### Structuring Context

**Order matters** - put most important information first:

1. **Problem statement**: What you're trying to accomplish
2. **Specific code**: The code being modified
3. **Related code**: Dependencies, interfaces, types
4. **Error messages**: Stack traces, error logs
5. **Requirements**: Business rules, constraints
6. **Examples**: Similar working code
7. **Documentation**: Relevant docs (if needed)

### Using MCPs for Context

Let MCPs do the heavy lifting:

```
Using available MCPs:
1. Search Glean for MYOB GST calculation standards
2. Search GitHub for existing GST calculation implementations  
3. Find similar tax calculation code in our codebase

Then: Implement GST calculation following discovered patterns.
```

## MYOB-Specific Prompting

### Financial Domain Terminology

Use precise financial terminology:

✅ **Good:**
```
Generate function to calculate GST (Goods and Services Tax) at 10% rate
for Australian businesses. Handle:
- GST-inclusive amounts (divide by 11)
- GST-exclusive amounts (multiply by 0.10)
- Use Decimal library for precision
- Round to 2 decimal places (half-up rounding)
```

❌ **Vague:**
```
Calculate Australian tax.
```

### MYOB Coding Standards in Prompts

Include MYOB standards directly:

```
Generate TypeScript code following MYOB standards:
- Use functional programming style
- Async/await for async operations (not .then())
- Comprehensive error handling with custom error types
- JSDoc comments on all public functions
- Unit tests with >80% coverage
- Use Decimal for all financial calculations
```

### Compliance and Regulatory Context

Mention compliance requirements:

```
Generate PAYG tax withholding calculation following ATO requirements:
- Must match ATO withholding schedules exactly
- Use current tax year tables (2024-2025)
- Maintain audit trail (log inputs, formula, result)
- Handle weekly, fortnightly, monthly pay periods
- Precision: Calculate to 4 decimals, round to nearest cent
```

### MYOB Example Prompts

**For Financial Calculations:**
```
Create a function to calculate superannuation guarantee at 11.5% for
Australian employees. Requirements:
- Input: Gross earnings (Decimal)
- Output: Super amount (Decimal)
- Round down to nearest cent (per ATO rules)
- Handle zero and negative inputs appropriately
- Include comprehensive unit tests
```

**For Business Logic:**
```
Implement BAS (Business Activity Statement) calculation logic:
- Sum G1 (Total Sales)
- Sum G2 (Export Sales)
- Sum G3 (GST-Free Sales)  
- Calculate 1A (GST on Sales) = (G1 - G2 - G3) / 11
- Use Decimal, round to nearest dollar per ATO rules
```

## Common Mistakes

### Mistake 1: Not Providing Examples

❌ **Bad:**
```
Write tests.
```

✅ **Good:**
```
Write Jest unit tests for this function following this example:

describe('calculateGST', () => {
  it('should calculate GST correctly for inclusive amount', () => {
    const result = calculateGST(new Decimal('110'), { inclusive: true });
    expect(result.toString()).toBe('10.00');
  });
});

Generate similar tests for calculatePAYG function.
```

### Mistake 2: Assuming AI Knows Your Codebase

❌ **Bad:**
```
Update the user service to use the new auth pattern.
```

✅ **Good:**
```
@src/services/user.service.ts
@src/auth/authMiddleware.ts

Update user service to use the auth middleware pattern shown in
authMiddleware.ts. Specifically:
- Add authenticate() call before operations
- Handle AuthenticationError
- Add audit logging
```

### Mistake 3: Not Specifying Technology

❌ **Bad:**
```
Create API endpoint for customers.
```

✅ **Good:**
```
Create Express.js API endpoint using TypeScript:
- Route: POST /api/v1/customers
- Request body: CreateCustomerRequest interface
- Response: CustomerResponse interface
- Error handling: Return 400 for validation errors
- Include: Input validation, error handling, tests
```

### Mistake 4: Including Sensitive Data

❌ **BAD:**
```
Generate code to connect to our production database:
Host: db.prod.myob.internal
User: admin
Password: MySecretPassword123
```

✅ **Good:**
```
Generate code to connect to a PostgreSQL database using environment variables:
- DB_HOST
- DB_USER
- DB_PASSWORD
- DB_NAME

Include error handling for connection failures.
```

## Best Practices by Task Type

### Code Generation

```
Generate [language] [type of code] that:
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

Include:
- Type definitions
- Error handling
- Unit tests
- Documentation

Follow [coding standard/style guide].
```

### Debugging

```
This [component] is failing with error: "[error message]"

Expected behavior: [what should happen]
Actual behavior: [what's happening]

Code:
[relevant code]

Error stack trace:
[stack trace]

Help me debug this issue.
```

### Refactoring

```
Refactor this code to:
1. [Improvement 1]
2. [Improvement 2]

Constraints:
- Don't change public API
- Maintain test compatibility
- Follow [standard]

Current code:
[code here]
```

### Code Review

```
Review this code for:
- Security vulnerabilities (especially OWASP Top 10)
- Performance issues
- [Domain] best practices (e.g., financial accuracy)
- Test coverage gaps
- Documentation completeness

Code:
[code here]
```

## Quick Reference

### Prompt Template

```
[Role assignment (optional)]

[Clear objective]

[Context/Background]

[Specific requirements as numbered list]

[Constraints or limitations]

[Examples (if helpful)]

[Desired output format]
```

### Checklist

Before submitting a prompt:
- [ ] Clear objective stated
- [ ] Sufficient context provided
- [ ] Specific requirements listed
- [ ] No sensitive data included
- [ ] Technology/language specified
- [ ] Examples provided (if needed)
- [ ] Output format specified (if needed)

## Resources

- **Prompt Library**: [Discovery](discovery/), [Requirements](requirements/), [Testing](testing/), [Delivery](delivery/)
- **Model Selection**: [Choosing the Right Model](../../getting-started/choosing-the-right-model.md)
- **MCP Usage**: [MCP Guide](../../feature-development/mcp-usage.md)

---

**Previous:** [← Prompt Library](README.md) | **Next:** [Discovery Prompts →](discovery/)

---


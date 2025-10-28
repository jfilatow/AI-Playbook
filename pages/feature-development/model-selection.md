---
title: Model Selection and Context Management
---

![MYOB Banner](../../assets/images/myob-banner.png)

# Model Selection and Context Management

## Overview

Choosing the right AI model for your task dramatically impacts speed, quality, and cost. Understanding when to use reasoning models vs fast models, how to manage context windows, and when to activate max mode in Cursor can 10x your productivity with AI.

This guide helps you make informed decisions about model selection and context management for MYOB development work.

## Table of Contents

- [Understanding AI Models](#understanding-ai-models)
- [When to Use Different Models](#when-to-use-different-models)
- [Cursor-Specific Features](#cursor-specific-features)
- [GitHub Copilot Model Features](#github-copilot-model-features)
- [Context Window Management](#context-window-management)
- [Token Usage Optimization](#token-usage-optimization)
- [Best Practices](#best-practices)

## Understanding AI Models

### Model Categories

**Reasoning Models (o1, o1-mini, DeepSeek R1):**
- Explicitly think through problems step-by-step
- Better at complex logic and multi-step reasoning
- Slower (10-30 seconds per response)
- More expensive (3-5x cost of fast models)
- Best for architecture, design, complex debugging

**Fast Models (GPT-4o, Claude 3.5 Sonnet):**
- Quick responses (1-3 seconds)
- Good for most development tasks
- Lower cost
- Excellent code generation and completion
- Best for everyday coding, documentation, simple refactoring

**Long Context Models (Claude 3.5 Sonnet 200k, Gemini 1.5 Pro 2M):**
- Handle massive context windows (200k-2M tokens)
- Can process entire codebases or large documentation sets
- Better at understanding relationships across many files
- Higher cost for large contexts
- Best for codebase analysis, large refactorings, migrations

### Model Capabilities Comparison

| Model | Context Window | Speed | Reasoning | Best For | Cost |
|-------|----------------|-------|-----------|----------|------|
| **o1** | 128k | Slow | Excellent | Architecture, complex problems | $$$$ |
| **o1-mini** | 128k | Medium | Good | Debugging, moderate complexity | $$$ |
| **GPT-4o** | 128k | Fast | Good | General coding, completion | $$ |
| **Claude 3.5 Sonnet** | 200k | Fast | Good | Long context, analysis | $$ |
| **Gemini 1.5 Pro** | 2M | Medium | Good | Massive context, migrations | $$$ |
| **DeepSeek R1** | 128k | Medium | Excellent | Cost-effective reasoning | $ |

**Context Window**: Maximum tokens (input + output)  
**Speed**: Time to first token  
**Cost**: Relative pricing ($ = cheapest, $$$$ = most expensive)

### Trade-offs: Speed vs Quality vs Cost

**When to prioritize speed:**
- Code completion during active typing
- Simple refactoring (rename, extract function)
- Generating boilerplate code
- Quick questions with obvious answers

**When to prioritize quality:**
- Architecture decisions with long-term impact
- Security-critical code review
- Complex algorithm design
- Debugging mysterious issues
- Performance optimization strategies

**When to prioritize cost:**
- High-volume usage (many requests per day)
- Learning/experimentation phase
- Simple, repetitive tasks
- When fast models give good enough results

## When to Use Different Models

### Reasoning Models (o1, o1-mini, DeepSeek R1)

Use reasoning models for complex problems requiring multi-step thinking:

**Ideal Use Cases:**
- **Architecture decisions**: "Should we use microservices or monolith for this?"
- **Complex debugging**: "This concurrency bug happens randomly, help me find the root cause"
- **Algorithm design**: "Design an efficient algorithm for matching transactions"
- **Refactoring strategy**: "How should we refactor this 10-file module?"
- **Trade-off analysis**: "Compare approaches A, B, C for this feature"
- **Code review (complex)**: "Review this security-critical authentication code"

**Example Scenarios:**

✅ **Good for o1:**
```
We have a race condition in our payment processing system. It happens
about 1% of the time when multiple requests hit the same account simultaneously.
Help me analyze the code and identify the root cause.

[Include: payment processor code, database schema, error logs]
```

❌ **Overkill for o1:**
```
Write a function that adds two numbers
```

**Cost Consideration:**
o1 costs 3-5x more than GPT-4o. Use it when the problem justifies the cost.

### Fast Models (GPT-4o, Claude 3.5 Sonnet)

Use fast models for everyday development tasks:

**Ideal Use Cases:**
- **Code generation**: Writing new functions, classes, components
- **Simple refactoring**: Renaming, extracting methods, code cleanup
- **Documentation**: Generating comments, README files, API docs
- **Test writing**: Unit tests, integration tests
- **Code review (simple)**: Style, conventions, simple logic
- **Bug fixing (obvious)**: Syntax errors, simple logic bugs
- **Boilerplate**: Configuration files, scaffolding, templates

**Example Scenarios:**

✅ **Perfect for GPT-4o/Claude:**
```
Generate a TypeScript function that validates Australian Business Numbers (ABN).
Should return true/false and follow MYOB coding standards.
```

```
Write unit tests for this calculateGST function using Jest.
Cover normal cases and edge cases.
```

**When to Use Claude vs GPT-4o:**
- **Claude 3.5 Sonnet**: Better for longer contexts (up to 200k), more detailed explanations
- **GPT-4o**: Faster responses, better for code completion, good general-purpose

### Long Context Models (Claude 200k, Gemini 1.5 Pro)

Use when you need to analyze large amounts of code or documentation:

**Ideal Use Cases:**
- **Codebase analysis**: Understanding large, unfamiliar codebases
- **Migration projects**: React 17 → 18, Node 16 → 20, major framework upgrades
- **Cross-file refactoring**: Changes that affect many files
- **Legacy code understanding**: Analyzing old code without documentation
- **Dependency analysis**: Understanding complex dependency trees
- **Large document analysis**: Processing extensive requirements or specifications

**Example Scenarios:**

✅ **Good for Claude 200k:**
```
Analyze our entire authentication module (15 files, 5000 lines).
Identify:
1. Security vulnerabilities
2. Code duplication
3. Opportunities for refactoring
4. Missing test coverage areas

[Include: All 15 authentication files]
```

✅ **Good for Gemini 1.5 Pro:**
```
We're migrating from REST to GraphQL. Analyze our 50 REST endpoints
and suggest how to structure our GraphQL schema.

[Include: All 50 endpoint files, current data models]
```

**Context Window Advantage:**
- Claude 200k: Can handle ~150k words of code
- Gemini 1.5 Pro: Can handle ~1.5M words (entire medium-sized codebase)

## Cursor-Specific Features

### Normal Mode vs Max Mode

Cursor offers two modes that affect model usage and response quality:

#### Normal Mode (Default)

**Characteristics:**
- Fast responses (2-5 seconds)
- Uses standard model calls
- Good for most development tasks
- Lower cost per request
- Suitable for 90% of coding work

**When to use Normal Mode:**
- Code completion and generation
- Simple refactoring
- Writing tests
- Generating documentation
- Quick questions and explanations
- Routine development work

**How to use:**
- Default mode, no action needed
- Use Cmd+K (Mac) or Ctrl+K (Windows) for inline edits
- Use Chat for questions and explanations

#### Max Mode

**Characteristics:**
- Deeper analysis (10-30 seconds)
- Multiple model calls and reasoning steps
- Better for complex problems
- Higher cost (3-5x normal mode)
- Uses reasoning models (o1-like behavior)

**When to activate Max Mode:**
- Complex refactoring affecting many files
- Architecture decisions requiring deep analysis
- Difficult debugging problems
- Performance optimization requiring analysis
- Security code review
- Design pattern decisions

**How to activate:**
1. In Cursor Chat, click "Max" toggle
2. Or use Composer (Cmd+Shift+K) which uses Max Mode automatically
3. Model indicator shows "Max Mode" when active

**Cost Implications:**
- Max Mode uses significantly more tokens
- Reserve for problems that justify the cost
- Set team guidelines on Max Mode usage

### Model Selection in Cursor

Cursor allows you to choose models for different tasks:

#### For Inline Edits (Cmd+K):

**Fast models work best:**
- GPT-4o: Fastest, good for most edits
- Claude 3.5 Sonnet: Better for longer edits

**When to use:**
- Adding features to existing code
- Refactoring small sections
- Fixing bugs
- Implementing specific functionality

#### For Chat:

**Choose based on question complexity:**
- Normal questions → Fast models (GPT-4o)
- Complex questions → Reasoning models (o1)
- Long context needed → Claude 200k

**How to switch:**
Settings → Models → Select preferred model for Chat

#### For Composer (Multi-file editing):

**Composer uses Max Mode:**
- Automatically uses advanced reasoning
- Can edit multiple files simultaneously
- Better for large changes

**When to use Composer:**
- Refactoring across 3+ files
- Implementing features touching multiple components
- Migrations affecting many files
- Creating new features with tests, docs, and implementation

### Context Selection (@-mentions)

Cursor lets you control context with @ symbol:

**@Files**: Include specific files in context
```
@auth.ts @user.model.ts How do we validate user permissions?
```

**@Folders**: Include entire directories
```
@src/services/ Explain our service layer architecture
```

**@Code**: Include selected code snippet
```
@[selected code] Refactor this to use async/await
```

**@Docs**: Search and include documentation
```
@docs authentication How do we implement OAuth?
```

**@Web**: Search web for current information
```
@web latest TypeScript 5.3 features
```

## GitHub Copilot Model Features

### Completions Model vs Chat Model

**Inline Completions:**
- Powered by specialized completion model
- Optimized for fast, short suggestions
- Predicts next lines of code as you type
- Uses local code context automatically

**Copilot Chat:**
- Uses GPT-4 class models
- Better for explanations and questions
- Can generate larger code blocks
- Supports multi-turn conversations

### When to Use Inline vs Chat

**Use Inline Completions for:**
- Writing code line-by-line
- Following established patterns
- Completing function signatures
- Generating boilerplate quickly

**Use Copilot Chat for:**
- Understanding existing code ("Explain this function")
- Generating new functions or classes
- Debugging ("Why isn't this working?")
- Learning ("How does async/await work?")

### Limitations of GitHub Copilot

**What Copilot can't do (use Cursor instead):**
- Multi-file refactoring
- Large context analysis (>50k tokens)
- Custom MCP integration (no Glean, Atlassian access)
- Composer-style multi-file generation
- Terminal command generation

**Copilot Strengths:**
- Faster inline completions
- Better IDE integration (VS Code, JetBrains)
- Familiar for teams already using VS Code
- Lower learning curve

## Context Window Management

### Understanding Context Windows

**What is a Context Window:**
The maximum amount of text (measured in tokens) that an AI model can process in a single request:
- **Input tokens**: Your prompt + context (code, docs, conversation history)
- **Output tokens**: AI's response
- **Total limit**: Input + output must fit within context window

**Token Estimation:**
- ~1 token = 0.75 words
- ~1 token = 4 characters
- 1000 tokens ≈ 750 words ≈ 3-4 paragraphs of text
- 10,000 tokens ≈ 25 pages of text
- 100,000 tokens ≈ 250 pages or ~50,000 lines of code

**Context Window Sizes (2025):**
- GPT-4o: 128,000 tokens (~320 pages)
- o1/o1-mini: 128,000 tokens
- Claude 3.5 Sonnet: 200,000 tokens (~500 pages)
- Gemini 1.5 Pro: 2,000,000 tokens (~5,000 pages!)

### Why Context Windows Matter

**Better context = better results:**
- AI understands surrounding code and dependencies
- Generates code consistent with your patterns
- Avoids suggesting deprecated or incompatible approaches
- Produces more accurate, relevant responses

**Too much context = problems:**
- Slow response times
- Higher costs
- AI may get confused by irrelevant information
- May hit context window limits

### Managing Context Effectively

#### What to Include in Context

**Essential Context:**
- The specific code you're working on
- Related interfaces and types
- Relevant test files
- Error messages or logs (for debugging)
- Requirements or specifications

**Helpful Context:**
- Similar code examples from your codebase
- Related documentation
- Recent conversation history
- Architecture diagrams (as text)

**Usually Exclude:**
- Test data and fixtures
- node_modules or vendor directories
- Generated files (build artifacts)
- Unrelated code files
- Excessive conversation history (>10 messages)

#### Context Strategies by Task Size

**Small Tasks (<10k tokens):**
- Include only the specific function or file
- Add interface definitions if needed
- Keep it focused

**Example:**
```
Optimize this calculateGST function for performance.

Context:
- calculateGST function (30 lines)
- GST type definitions (10 lines)
- Related test file (40 lines)

Total: ~80 lines = ~2k tokens
```

**Medium Tasks (10-50k tokens):**
- Include the file being modified
- Add related files (interfaces, parent classes, callers)
- Include relevant tests
- Add pertinent documentation

**Example:**
```
Refactor our authentication middleware to support OAuth2.

Context:
- Current auth middleware (200 lines)
- User model and types (100 lines)
- Auth configuration (50 lines)
- Related tests (300 lines)
- OAuth requirements doc (500 words)

Total: ~15k tokens
```

**Large Tasks (50k+ tokens):**
- Use long context models (Claude 200k, Gemini 1.5 Pro)
- Include all affected files
- Add architecture documentation
- Include comprehensive test suites
- Add migration or refactoring plans

**Example:**
```
Migrate our backend from Express to Fastify.

Context:
- All route files (2000 lines)
- Middleware files (800 lines)
- Server configuration (200 lines)
- Tests (3000 lines)
- Performance requirements (1000 words)
- Migration strategy doc (2000 words)

Total: ~50k+ tokens
Use Claude 200k or Gemini 1.5 Pro
```

### Context Prioritization

**Order matters!** Put most relevant context first:

1. **Problem statement**: Clear description of what you need
2. **Specific code**: The exact code being modified
3. **Dependencies**: Types, interfaces, imports
4. **Related code**: Similar functions, parent classes
5. **Tests**: Existing test patterns
6. **Documentation**: Requirements, specifications
7. **Conversation history**: Previous exchanges (if relevant)

**Why order matters:**
- AI pays more attention to information early in context
- If context is truncated, most important info remains
- Helps AI focus on the specific problem

### Using .cursorignore

Control what Cursor includes in context automatically:

**Create `.cursorignore` in project root:**
```
# Dependencies
node_modules/
vendor/
.venv/
dist/
build/

# Sensitive files
.env
.env.*
*.key
*.pem
secrets/
credentials/

# Test data
test-data/
fixtures/
mock-data/

# Generated files
*.generated.*
*.min.js
*.bundle.js

# Large files
*.log
*.csv
*.json (if large data files)

# Documentation (include selectively)
docs/ (use @docs when needed)
```

**Benefits:**
- Prevents sensitive data from being included
- Reduces unnecessary context
- Improves AI response speed
- Lowers token costs

## Token Usage Optimization

### Reducing Token Costs

**Strategy 1: Start Small, Add More if Needed**
```
First attempt: Small context
If result isn't good → Add more context
If still not good → Add even more or switch to better model
```

**Strategy 2: Use Appropriate Models**
- Don't use o1 for simple tasks
- Don't use Gemini 1.5 Pro if 128k context is enough
- Start with GPT-4o, escalate only if needed

**Strategy 3: Reuse Conversations Wisely**
- Continue conversation for related questions
- Start fresh for new topics (old context wastes tokens)
- Clear context when switching tasks

**Strategy 4: Batch Operations**
```
Instead of 5 separate requests:
"Add error handling to function1"
"Add error handling to function2"
...

Do one batch request:
"Add error handling to these 5 functions: [list]"
```

### Monitoring Token Usage

**In Cursor:**
- Settings → Usage → View token consumption
- Monitor monthly totals
- Set personal budgets

**In GitHub Copilot:**
- Enterprise admin can view team usage
- Individual usage tracking not exposed

**Cost Management Tips:**
- Set team guidelines (e.g., "Max Mode only for complex problems")
- Share prompts that work well (reuse instead of experimenting)
- Use cheaper models for learning and experimentation
- Monitor usage weekly, adjust if costs spike

### When to Start Fresh Conversation

**Start new conversation when:**
- Switching to completely different task
- Context from previous conversation isn't relevant
- Conversation history is getting long (>10 exchanges)
- AI seems confused by old context
- You've solved the problem and moving on

**Continue conversation when:**
- Follow-up questions on same topic
- Iterating on solution (refining code)
- Building on previous response
- Still working on same file/feature

## Best Practices

### Model Selection Best Practices

**1. Default to Fast Models**
- Start with GPT-4o or Claude 3.5 Sonnet
- Only escalate to o1 if problem is genuinely complex
- Saves cost and time for most tasks

**2. Match Model to Task Type**
- Code completion → GPT-4o (fastest)
- Complex debugging → o1-mini (good reasoning, lower cost than o1)
- Codebase analysis → Claude 200k (long context)
- Architecture → o1 (best reasoning)

**3. Use Cursor Modes Appropriately**
- Normal Mode: Default for everything
- Max Mode/Composer: Complex refactoring, multi-file changes
- Inline edit (Cmd+K): Quick local changes

**4. Context Management Rules**
- Include only relevant files
- Use .cursorignore for sensitive/large files
- Prioritize most important context first
- Use MCPs to automate context gathering

**5. Cost Management**
- Monitor usage monthly
- Set personal or team budgets
- Use cheaper models for learning
- Reserve expensive models for high-value problems

### Do:
- Experiment with different models for same task
- Document which models work best for your common tasks
- Share effective prompts with your team
- Monitor costs and adjust usage
- Use MCPs to provide rich context automatically
- Start with smaller context, add more if needed

### Don't:
- Use o1 for everything (unnecessary cost)
- Include entire codebase when not needed
- Ignore context window limits
- Forget to use .cursorignore for sensitive files
- Let costs run wild without monitoring
- Trust AI without validating outputs

## Quick Decision Tree: Which Model?

```
What type of task is this?

├─ Code completion as I type
│  └─ Use: GPT-4o (fastest)
│
├─ Simple function or test generation
│  └─ Use: GPT-4o or Claude 3.5 Sonnet (fast models)
│
├─ Bug that I can't figure out
│  ├─ Obvious once you see it?
│  │  └─ Use: GPT-4o (fast model is fine)
│  └─ Complex, mysterious bug?
│     └─ Use: o1-mini in Max Mode
│
├─ Refactoring
│  ├─ Single file, simple changes?
│  │  └─ Use: GPT-4o, Normal Mode
│  ├─ Multiple files, moderate complexity?
│  │  └─ Use: Claude 3.5 Sonnet, Normal Mode or Composer
│  └─ Large refactoring, many files?
│     └─ Use: Claude 200k or o1 in Max Mode/Composer
│
├─ Architecture or design decision?
│  └─ Use: o1 in Max Mode (needs deep reasoning)
│
├─ Understanding large codebase?
│  └─ Use: Claude 200k or Gemini 1.5 Pro (long context)
│
└─ Migration or major upgrade?
   └─ Use: Claude 200k or Gemini 1.5 Pro (long context)
```

## Common Scenarios with Recommendations

### Scenario 1: Writing a New Feature

```
Task: Implement new expense categorization feature

Model: GPT-4o or Claude 3.5 Sonnet
Mode: Normal Mode
Context: Requirements doc, related code examples, types/interfaces
Why: Straightforward implementation, fast model fine
```

### Scenario 2: Mysterious Production Bug

```
Task: "Payment processing fails randomly for Australian accounts"

Model: o1 or o1-mini
Mode: Max Mode
Context: Payment code, logs, database schema, related tests
Why: Needs deep reasoning to find subtle race condition or edge case
```

### Scenario 3: Large Refactoring

```
Task: Refactor authentication across 10 microservices

Model: Claude 200k or Gemini 1.5 Pro
Mode: Composer or Max Mode
Context: All 10 services' auth code, shared auth library, tests
Why: Needs long context to understand relationships, maintain consistency
```

### Scenario 4: Learning a New Codebase

```
Task: Understand how invoicing works in legacy system

Model: Claude 200k
Mode: Normal Mode
Context: All invoicing files, database schema, documentation
Why: Long context model can process entire invoicing module
```

### Scenario 5: Code Review

```
Task: Review PR with 300 lines of changes

Simple changes: GPT-4o, Normal Mode
Security-critical: o1, Max Mode
```

## MYOB Context

### MYOB-Specific Model Recommendations

**For Financial Calculations:**
- Use reasoning models (o1-mini minimum)
- Accuracy is critical, worth the cost
- Include requirements and compliance context

**For UI/UX Work:**
- Fast models (GPT-4o, Claude) work well
- Less need for deep reasoning
- Iterate quickly with fast responses

**For Integration Work:**
- Long context models (Claude 200k)
- Need to understand multiple systems
- Integration points and data flows

**For Security Reviews:**
- Reasoning models (o1)
- Security is worth the extra cost and time
- Thorough analysis needed

### Cost Management at MYOB

Set team norms:
- **Normal Mode first**: Try fast model before escalating
- **Max Mode budget**: Limit expensive calls (e.g., <20 per week)
- **Monitor monthly**: Review team usage, adjust if needed
- **Share learnings**: "This type of task works great with GPT-4o"

## Resources

- **Cursor Documentation**: [cursor.com/docs](https://cursor.com/docs)
- **Model Context Protocol**: [modelcontextprotocol.io](https://modelcontextprotocol.io)
- **OpenAI Models**: [platform.openai.com/docs/models](https://platform.openai.com/docs/models)
- **Anthropic Claude**: [anthropic.com/claude](https://anthropic.com/claude)

## Next Steps

With model selection knowledge, enhance your AI workflow:

1. **Set Up IDEs**: [IDE Setup Guides](../getting-started/ide-setup/)
2. **Learn Prompting**: [Prompting Best Practices](../appendix/prompt-library/prompting-best-practices.md)
3. **Use AI Agents**: [AI Agents Guide](ai-agents.md)

---

**Previous:** [← MCP Usage](mcp-usage.md) | **Next:** [AI Agents →](ai-agents.md)

---


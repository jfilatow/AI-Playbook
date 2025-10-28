---
title: Choosing the Right AI Model - Quick Reference
---

![MYOB Banner](../../assets/images/myob-banner.png)

# Choosing the Right AI Model - Quick Reference

## Quick Decision Guide

Use this page as a quick reference when you're unsure which AI model to use for your task.

## At-a-Glance Decision Tree

```
┌─ Writing code as I type?
│  └─ GPT-4o (fastest completions)
│
├─ Need to write a new function/feature?
│  └─ GPT-4o or Claude 3.5 Sonnet
│
├─ Simple bug or error?
│  └─ GPT-4o (Normal Mode)
│
├─ Complex/mysterious bug?
│  └─ o1-mini (Max Mode)
│
├─ Refactoring?
│  ├─ 1 file → GPT-4o (Normal Mode)
│  ├─ 2-5 files → Claude 3.5 Sonnet (Composer)
│  └─ 5+ files → Claude 200k (Composer/Max Mode)
│
├─ Architecture or design decision?
│  └─ o1 (Max Mode)
│
├─ Understanding large codebase?
│  └─ Claude 200k or Gemini 1.5 Pro
│
├─ Major migration or upgrade?
│  └─ Claude 200k or Gemini 1.5 Pro
│
└─ Not sure?
   └─ Start with GPT-4o, escalate if needed
```

## Model Quick Reference Table

| Task Type | Model | Cursor Mode | Context Size | Speed | Cost |
|-----------|-------|-------------|--------------|-------|------|
| **Code completion** | GPT-4o | Normal | 1-5k tokens | ⚡⚡⚡ | $ |
| **Simple function** | GPT-4o | Normal | 5-10k tokens | ⚡⚡⚡ | $ |
| **Tests generation** | GPT-4o | Normal | 5-15k tokens | ⚡⚡⚡ | $ |
| **Documentation** | GPT-4o | Normal | 10-20k tokens | ⚡⚡⚡ | $ |
| **Simple refactoring** | Claude 3.5 | Normal | 10-30k tokens | ⚡⚡ | $$ |
| **Bug fixing** | GPT-4o | Normal | 10-30k tokens | ⚡⚡⚡ | $ |
| **Complex debugging** | o1-mini | Max | 20-50k tokens | ⚡ | $$$ |
| **Multi-file refactor** | Claude 3.5 | Composer | 30-60k tokens | ⚡⚡ | $$ |
| **Architecture design** | o1 | Max | 50-100k tokens | ⚡ | $$$$ |
| **Codebase analysis** | Claude 200k | Max | 100k+ tokens | ⚡ | $$$ |
| **Large refactoring** | Claude 200k | Composer | 100k+ tokens | ⚡ | $$$ |
| **Migration project** | Gemini 1.5 Pro | Max | 200k+ tokens | ⚡⚡ | $$$$ |

**Legend:**
- ⚡⚡⚡ = Very Fast (1-3 sec)
- ⚡⚡ = Fast (3-10 sec)
- ⚡ = Slower (10-30 sec)
- $ = Low cost
- $$$$ = High cost

## When to Use Each Model

### GPT-4o (Your Default Choice)

**Use for:** 90% of your daily coding tasks

**Strengths:**
- Fastest responses
- Excellent code generation
- Good for most programming languages
- Handles TypeScript/JavaScript exceptionally well
- Low cost

**Best for:**
- Writing new functions
- Generating tests
- Creating documentation
- Simple refactoring
- Code review
- Explaining code
- Quick questions

**Example:**
"Generate a TypeScript function to validate email addresses with error messages"

### Claude 3.5 Sonnet (Long Context Specialist)

**Use for:** Tasks needing more context or detailed analysis

**Strengths:**
- 200k context window (larger than GPT-4o's 128k)
- Better at longer, more detailed explanations
- Excellent for multi-file analysis
- Strong at following complex instructions

**Best for:**
- Refactoring across 3-5 files
- Analyzing relationships between components
- Understanding complex logic
- Detailed code explanations
- Working with large configuration files

**Example:**
"Refactor these 4 service files to share common authentication logic"

### o1-mini (Reasoning on a Budget)

**Use for:** Problems needing reasoning without the full cost of o1

**Strengths:**
- Explicit step-by-step reasoning
- Better at complex logic
- Cheaper than o1
- Good for moderate complexity

**Best for:**
- Debugging tricky bugs
- Algorithm design
- Complex business logic
- Performance optimization
- Security review (moderate complexity)

**Example:**
"This payment calculation sometimes gives wrong results for international transactions. Find the bug."

### o1 (Maximum Reasoning Power)

**Use for:** Genuinely complex problems justifying the cost

**Strengths:**
- Best reasoning capability
- Solves complex multi-step problems
- Excellent for architecture and design
- Thorough analysis

**Best for:**
- Critical architecture decisions
- Complex algorithm design
- Difficult debugging (already tried o1-mini)
- Security-critical code review
- Performance optimization (complex)

**Cost:** 3-5x more expensive than GPT-4o  
**When:** Only when simpler models fail or problem is genuinely complex

**Example:**
"Design a distributed caching strategy for our microservices that handles eventual consistency and minimizes latency"

### Claude 200k / Gemini 1.5 Pro (Massive Context)

**Use for:** Analyzing entire codebases or large documentation

**Claude 200k:**
- Better for code-focused tasks
- Strong at understanding code patterns
- 200k token context (~ 500 pages)

**Gemini 1.5 Pro:**
- Massive 2M token context (~ 5,000 pages)
- Can process entire medium codebases
- Good for document-heavy analysis

**Best for:**
- Codebase analysis and understanding
- Large refactorings (10+ files)
- Migration projects
- Legacy code modernization
- Analyzing extensive documentation

**Example:**
"Analyze our entire backend monolith (200 files) and suggest how to extract a payments microservice"

## Cursor Mode Guide

### Normal Mode

**Default mode** - Use for everything unless you have a specific reason for Max Mode

**When to use:**
- All code completion
- Simple to moderate refactoring
- Writing tests
- Documentation
- Most development work

**Activate:**
- Just use Cursor normally (default)
- Cmd+K for inline edits
- Chat for questions

### Max Mode

**Deep analysis mode** - Use sparingly for complex problems

**When to activate:**
- Architecture decisions needing deep reasoning
- Complex bugs you can't solve
- Large refactoring affecting many files
- Performance optimization needing analysis
- Security code review

**Activate:**
- Toggle "Max" in Chat interface
- Or use Composer (Cmd+Shift+K) which auto-uses Max Mode

**Cost:**
- 3-5x more expensive than Normal Mode
- Multiple reasoning steps
- Set team guidelines (e.g., <20 Max Mode requests per week)

### Composer (Multi-file Mode)

**Special mode** for editing multiple files simultaneously

**When to use:**
- Creating new features (implementation + tests + docs)
- Refactoring across 3+ files
- Migrations affecting multiple files
- Implementing complex user stories

**Activate:**
- Cmd+Shift+K (Mac) or Ctrl+Shift+K (Windows)
- Select files to edit
- AI edits all files together

**Note:** Composer uses Max Mode automatically

## Common Mistakes to Avoid

### ❌ Using o1 for Everything

**Don't:**
```
Using o1 to generate every function "because it's better"
```

**Why it's wrong:**
- o1 is 5x more expensive
- o1 is slower (20-30 seconds)
- GPT-4o handles 90% of tasks just as well

**Do instead:**
- Default to GPT-4o
- Only escalate to o1 for genuinely complex problems

### ❌ Not Providing Enough Context

**Don't:**
```
"Fix the bug in calculateTax"
[No context provided]
```

**Why it's wrong:**
- AI doesn't know your code structure
- Can't give specific advice
- May suggest generic solutions

**Do instead:**
```
"Fix the bug in calculateTax function"
[Include: calculateTax function, types, related tests, error message]
```

### ❌ Including Too Much Irrelevant Context

**Don't:**
```
[Paste entire 10,000-line file]
"Fix line 247"
```

**Why it's wrong:**
- Wastes tokens and money
- Slows down response
- AI may get distracted by irrelevant code

**Do instead:**
```
[Include: Function with bug, related functions, types]
"Fix this specific issue: [describe bug]"
```

### ❌ Using Short Context Model for Long Context Task

**Don't:**
```
Using GPT-4o to analyze 50-file codebase
[Hitting 128k token limit repeatedly]
```

**Why it's wrong:**
- Can't fit all necessary context
- Need to break into multiple requests
- Loses the big picture

**Do instead:**
- Use Claude 200k or Gemini 1.5 Pro
- Can process entire codebase in one go
- Better understanding of relationships

## Cost Examples (Relative)

Assuming GPT-4o costs $1 per task:

| Model | Relative Cost | When Worth It |
|-------|---------------|---------------|
| GPT-4o | $1 | Default choice |
| Claude 3.5 Sonnet | $1-2 | Need long context or detailed analysis |
| o1-mini | $3-4 | Complex bugs, moderate reasoning |
| o1 | $5-8 | Architecture, critical decisions only |
| Claude 200k | $2-5 | Large codebase analysis (depends on context size) |
| Gemini 1.5 Pro | $3-6 | Massive context needs |

**Monthly budget example:**
- 100 GPT-4o requests = $100
- 20 Claude requests = $30
- 5 o1-mini requests = $15
- 2 o1 requests = $12
- Total: ~$157/month

## Tips for Your Team

### Establish Team Norms

**Create guidelines:**
1. "Default to GPT-4o, escalate if it doesn't work"
2. "Max Mode only for problems taking >30 min to solve manually"
3. "Share prompts that worked well in team Slack"
4. "Review monthly usage and adjust if costs spike"

### Share Learnings

**Document what works:**
- "GPT-4o great for our financial calculation tests"
- "Use o1 for currency conversion edge cases (gets it right)"
- "Claude 200k perfect for understanding our monolith"

### Monitor and Adjust

**Weekly:** Check your usage (Cursor Settings → Usage)  
**Monthly:** Team review of costs and effectiveness  
**Quarterly:** Adjust guidelines based on learnings

## See Also

- **Full Guide**: [Model Selection & Context Management](../feature-development/model-selection.md)
- **MCP Setup**: [MCP Usage Guide](../feature-development/mcp-usage.md)
- **IDE Setup**: [IDE Setup Guides](ide-setup/)

---

**Previous:** [← MCP Servers Setup](mcp-servers-setup.md) | **Next:** [AI Training Programs →](ai-training-programs.md)

---


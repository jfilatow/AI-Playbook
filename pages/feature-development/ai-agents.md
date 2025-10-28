---
title: AI Agents and Automation
---

![MYOB Banner](../../assets/images/myob-banner.png)

# AI Agents and Automation

## Overview

AI agents are autonomous or semi-autonomous AI systems that can perform tasks, make decisions, and interact with tools without constant human direction. This guide covers background agents, automated PR reviews, and agent orchestration for MYOB development.

## Table of Contents

- [Understanding AI Agents](#understanding-ai-agents)
- [Background Agents](#background-agents)
- [Automated PR Reviews](#automated-pr-reviews)
- [Agent Orchestration](#agent-orchestration)
- [Best Practices](#best-practices)
- [MYOB Context](#myob-context)

## Understanding AI Agents

### What are AI Agents?

**Traditional AI Usage:**
```
Human → Prompt AI → AI Response → Human Acts
```

**AI Agent Usage:**
```
Human → Task to Agent → Agent Acts Autonomously → Results
```

**Key Difference:**
- Traditional: AI suggests, human executes
- Agent: AI both suggests AND executes

**Types of Agents:**
1. **Background Agents**: Run continuously, proactively improving code
2. **PR Review Agents**: Automatically review pull requests
3. **Task Agents**: Execute specific development tasks
4. **Orchestrated Agents**: Multiple agents working together

## Background Agents

### What are Background Agents?

Background agents run continuously in your IDE, monitoring code and proactively suggesting improvements.

**Available in:**
- Cursor (experimental feature)
- Some IDEs with agent plugins
- Custom implementations

**What They Do:**
- Monitor code quality as you write
- Suggest refactoring opportunities
- Generate documentation automatically
- Create/update tests proactively
- Identify potential bugs or issues
- Keep code aligned with standards

### Cursor Background Agents

**Enabling Background Agents in Cursor:**

1. Settings → Features → Background Agent
2. Toggle "Enable Background Agent"
3. Configure agent behavior:
   - Frequency (continuous, periodic)
   - Scope (current file, project)
   - Actions (suggest, auto-fix, notify)

**Example Configurations:**

**Code Quality Agent:**
```json
{
  "backgroundAgent.codeQuality": {
    "enabled": true,
    "checks": [
      "complexity",
      "duplication",
      "unused-code",
      "potential-bugs"
    ],
    "autoFix": false,  // Suggest, don't auto-fix
    "notify": true
  }
}
```

**Documentation Agent:**
```json
{
  "backgroundAgent.documentation": {
    "enabled": true,
    "generateJSDoc": true,
    "updateOnCodeChange": true,
    "includeExamples": true
  }
}
```

**Test Coverage Agent:**
```json
{
  "backgroundAgent.testCoverage": {
    "enabled": true,
    "targetCoverage": 80,
    "suggestMissingTests": true,
    "autoGenerateTests": false
  }
}
```

### Use Cases for Background Agents

**Code Cleanup:**
- Identify and suggest removing unused imports
- Find and flag unused variables
- Suggest simplifying complex functions
- Identify code duplication

**Documentation:**
- Generate missing JSDoc comments
- Update outdated documentation
- Create README sections
- Generate API documentation

**Test Generation:**
- Suggest tests for uncovered code
- Generate test cases for new functions
- Update tests when code changes
- Identify missing edge case tests

**Security Monitoring:**
- Flag potential security issues
- Identify hardcoded credentials
- Suggest input validation
- Check for vulnerable dependencies

### Performance Impact

Background agents consume resources:

**Impact:**
- CPU: Low to moderate (depends on agent frequency)
- Memory: Additional 100-500MB
- Battery: Reduced battery life on laptops
- Network: API calls to AI providers

**When to Disable:**
- Working on battery power
- Limited network bandwidth
- AI responses are slow
- Not actively developing (reading code only)

**Toggle quickly:** Settings → Background Agent → Enable/Disable

## Automated PR Reviews

Automated agents can review pull requests, checking code quality, security, and adherence to standards.

### Available PR Review Agents

#### 1. GitHub Copilot Pull Request Summaries

**What it does:**
- Generates PR descriptions automatically
- Summarizes changes in PR
- Suggests reviewers based on code changes

**Setup:**
- Available in GitHub web interface
- Automatic with Copilot for Business
- Click "Generate" in PR description

**Best for:**
- Quick PR summaries
- Finding relevant reviewers
- Generating change descriptions

#### 2. Cursor PR Reviews

**What it does:**
- Reviews code changes in Cursor
- Provides inline feedback
- Suggests improvements

**Setup:**
- Open PR diff in Cursor
- Use Chat: "Review this PR for quality and security"
- Or use Cmd+K on specific changes

#### 3. Third-Party Review Agents

**CodeRabbit:**
- Automated code review bot
- Comments on PRs automatically
- Checks style, bugs, security

**Graphite Reviewer:**
- AI-powered code review
- Understands context from past PRs
- Learns team preferences

**Qodo (formerly CodiumAI):**
- Generates test suggestions in PRs
- Identifies missing test coverage
- Suggests edge cases

**Setup:** See each tool's documentation, check MYOB approval status first

### Configuring Automated Reviews for MYOB Standards

**Include MYOB standards in review config:**

Create `.github/ai-review-config.yml`:
```yaml
review:
  focus:
    - security
    - performance
    - MYOB-coding-standards
    - test-coverage
    - documentation
  
  rules:
    - no-hardcoded-credentials
    - use-decimal-for-money
    - minimum-80-percent-coverage
    - jsdoc-on-public-apis
  
  autoApprove: false  # Always require human approval
  
  commentStyle: "inline"  # Comment on specific lines
```

### Review Checklist

AI agents should check:

- [ ] **Security**: No hardcoded secrets, proper input validation
- [ ] **Performance**: No obvious performance issues
- [ ] **Style**: Follows MYOB coding standards
- [ ] **Tests**: New code has test coverage
- [ ] **Documentation**: Public APIs have documentation
- [ ] **Error Handling**: Errors are handled appropriately
- [ ] **Type Safety**: TypeScript types are correct
- [ ] **Financial Logic**: Decimal used for money calculations

### Interpreting Agent Feedback

**When to Accept:**
- ✅ Clear security issues identified
- ✅ Obvious bugs or logic errors
- ✅ Style violations (linting issues)
- ✅ Missing test coverage for new code
- ✅ Performance problems with evidence

**When to Question:**
- ⚠️ Subjective design opinions
- ⚠️ Suggestions without clear justification
- ⚠️ Changes that break existing patterns
- ⚠️ Overly complex "improvements"
- ⚠️ Agent doesn't understand business context

**Always:**
- Human reviews the agent's review
- Don't merge based solely on AI approval
- Validate agent's security/performance claims
- Check agent isn't hallucinating issues

## Agent Orchestration

Running multiple agents together for complex workflows.

### Multi-Agent Workflows

**Example: Complete Feature Workflow**

```
Task: "Implement expense categorization feature"

Agent 1 (Planner):
→ Breaks down into tasks
→ Identifies files to modify
→ Creates implementation plan

Agent 2 (Implementer):
→ Generates code for each task
→ Follows MYOB standards
→ Creates comprehensive tests

Agent 3 (Reviewer):
→ Reviews generated code
→ Checks security and quality
→ Suggests improvements

Agent 4 (Documenter):
→ Generates API documentation
→ Updates README
→ Creates runbook

Human (Final Review):
→ Reviews all outputs
→ Makes go/no-go decision
→ Merges when confident
```

**Tools for Orchestration:**
- **AutoGen** (Microsoft): Multi-agent framework
- **CrewAI**: Coordinated agent workflows
- **LangGraph**: Agent workflow visualization

**Note:** Advanced agent orchestration is complex and experimental. Start with single agents before building multi-agent systems.

### Handling Agent Conflicts

When multiple agents suggest different approaches:

**Resolution Strategy:**
1. Review each agent's reasoning
2. Consider which agent's specialty aligns with the task
3. Test both approaches if feasible
4. Make final decision based on MYOB priorities
5. Document decision for future reference

**Example Conflict:**
```
Planner Agent: "Use microservices architecture"
Security Agent: "Monolith is more secure with our current auth"

Resolution: Consider MYOB priorities (security > scalability initially),
choose monolith, document decision, plan future microservices migration
```

### Cost Management for Multiple Agents

Agents multiply AI usage and costs:

**Cost Example:**
- 1 agent: $50/month
- 3 agents running simultaneously: $150/month
- Background agent continuous: $200+/month

**Cost Control Strategies:**
- Run agents selectively (not all the time)
- Use cheaper models for background agents
- Set budget limits per agent
- Monitor usage weekly
- Disable agents when not actively developing

## Best Practices

### Background Agents

**Do:**
- Start with one agent type (e.g., documentation only)
- Review agent suggestions before accepting
- Configure conservative thresholds initially
- Monitor performance impact
- Disable when working on battery
- Use for repetitive tasks you'd otherwise do manually

**Don't:**
- Enable all agents at once without testing
- Auto-accept agent changes without review
- Run agents on highly sensitive code
- Let agents consume excessive resources
- Forget agents are running (check your usage)

### PR Review Agents

**Do:**
- Use agents as first pass, humans as final review
- Configure agents for MYOB standards
- Train teams to interpret agent feedback
- Validate agent security/performance claims
- Use agent reviews to educate junior developers

**Don't:**
- Merge based solely on AI approval
- Skip human code review because "AI reviewed it"
- Trust agent understanding of business logic
- Let agents block PRs without human judgment
- Ignore patterns in agent feedback (may indicate real issues)

### Agent Orchestration

**Do:**
- Start simple (one agent at a time)
- Document agent workflows
- Monitor costs carefully
- Have human oversight at key decision points
- Test agents on non-critical features first

**Don't:**
- Build complex multi-agent systems without experience
- Let agents make critical decisions autonomously
- Skip human review of agent-generated code
- Deploy agent-generated code to production without testing
- Forget that agents can amplify errors

## MYOB Context

### Using Agents for MYOB Development

**Good Use Cases:**
- Background documentation agent for internal tools
- PR review agent for style and test coverage
- Test generation agent for new features
- Code cleanup agent for tech debt

**Caution Areas:**
- Financial calculation code (requires manual validation)
- Security-critical features (human review essential)
- Compliance-sensitive code (regulatory requirements)
- Customer-facing features (quality must be perfect)

### Agent Approval at MYOB

**Check approval status:**
- Cursor background agents: Generally approved
- GitHub Copilot PR summaries: Approved
- Third-party agents: Check with Security team first

See [MYOB-Approved Tools](../appendix/MYOB-approved-tools.md) for current approved agent list.

### Ethics and Disclosure

**Disclose AI usage:**
- Note in PR descriptions when AI agents used
- Document which agents reviewed code
- Be transparent about AI-generated code
- Maintain human accountability for all code

**Example PR Description:**
```markdown
## Changes
Implemented expense categorization feature

## AI Assistance
- Cursor Composer: Initial implementation
- Background agent: Generated JSDoc comments
- CodeRabbit: Automated code review
- Human review: Validated all AI outputs, tested thoroughly
```

## Best Practices

### Cost vs Productivity Trade-offs

**High Value Agent Usage:**
- Background documentation (saves hours of manual work)
- PR review first pass (catches obvious issues before human review)
- Test generation (ensures good coverage)

**Low Value Agent Usage:**
- Background agents for simple code (overhead not worth it)
- Multiple agents doing redundant checks
- Agents for tasks humans can do quickly

**Decision Framework:**
```
Agent Cost per Month: $X
Time Saved per Month: Y hours
Your Hourly Rate: $Z

Value = (Y * Z) - X

Positive value = Worth using agent
Negative value = Skip agent, do manually
```

## Troubleshooting

### Background Agents Not Working

**Check:**
- Agent feature enabled in settings
- API limits not exceeded
- Network connectivity
- Cursor version supports agents

**Try:**
- Restart Cursor
- Disable/re-enable agent
- Check logs (Help → Show Logs)

### PR Review Agents Missing Issues

**Agents may miss:**
- Complex business logic errors
- Domain-specific requirements
- Subtle security vulnerabilities
- Performance issues requiring profiling

**Solution:** Combine agent reviews with thorough human review

### Agent Providing Incorrect Feedback

**Agents can hallucinate problems:**
- False positives (flagging correct code)
- Misunderstanding business context
- Outdated best practices
- Overly opinionated suggestions

**Solution:** Always validate agent feedback, don't trust blindly

## Resources

- **GitHub Copilot**: [github.com/features/copilot](https://github.com/features/copilot)
- **Cursor Agents**: [cursor.com/docs/agents](https://cursor.com/docs) (check for agent documentation)
- **AutoGen**: [microsoft.github.io/autogen](https://microsoft.github.io/autogen/)
- **CrewAI**: [crewai.com](https://crewai.com)

## Next Steps

1. **Configure Your IDE**: [IDE Setup Guides](../getting-started/ide-setup/)
2. **Learn Prompting**: [Prompting Best Practices](../appendix/prompt-library/prompting-best-practices.md)
3. **Use Frameworks**: [AI Frameworks Guide](ai-frameworks-practical.md)

---

**Previous:** [← AI Development Frameworks](ai-development-frameworks.md) | **Next:** [Continuous Improvement →](continuous-improvement.md)

---

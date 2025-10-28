---
title: AI in Build and Delivery
---

![MYOB Banner](../../assets/images/myob-banner.png)

# AI in Build and Delivery

## Overview

After validating your solution in the Discovery phase, you're ready to **Build and Deliver**. This page bridges Discovery to Delivery, showing how AI accelerates the build process while maintaining quality and compliance.

The Build phase focuses on: **Deliver Solutions** → **Launch** → **Customer Release** →  **Evolve**

## From Discovery to Delivery

### The Transition

You've validated:
- ✅ The problem is real and significant
- ✅ Your solution concept resonates with customers
- ✅ Technical feasibility is confirmed
- ✅ Business case justifies the investment

Now you need to:
1. Generate detailed requirements
2. Build the solution
3. Test thoroughly
4. Deploy to customers
5. Measure and iterate

AI can accelerate every step of this process.

## AI in the Build Phase

### Generating Requirements

Transform validated solution concepts into detailed requirements:

**See the full guide:** [Generating Requirements with AI](../generating-requirements/README.md)

**Quick Example:**
```
From this validated solution concept:

"[solution description from validation]"

Generate:
1. Epic-level user stories (5-7 major themes)
2. Detailed user stories for MVP scope
3. Acceptance criteria for each story
4. Technical requirements and constraints
5. Non-functional requirements (performance, security, accessibility)
```

### Development with AI

Build features faster using AI-assisted development:

**See the full guide:** [Feature Development with AI](../feature-development/README.md)

**Key AI capabilities:**
- Code generation aligned to requirements
- Test generation (unit, integration, e2e)
- Documentation generation
- Code review and refactoring
- Bug fixing and debugging

### Testing and Quality

Use AI to improve test coverage and quality:

**See the full guide:** [Testing with AI](../feature-development/testing.md)

**AI helps with:**
- Test case generation from requirements
- Test data creation (synthetic, realistic)
- Edge case identification
- Regression test planning
- Bug report analysis

### Deployment and Launch

AI assists with deployment and launch activities:

**Deployment Planning:**
```
Create a deployment checklist for this feature:

Feature: "[description]"
Environments: Dev, Staging, Production
Dependencies: "[systems, APIs, data migrations]"

Generate checklist covering:
1. Pre-deployment (code complete, tests pass, docs updated)
2. Deployment steps (database migrations, feature flags, rollout plan)
3. Post-deployment (smoke tests, monitoring, rollback plan)
4. Communication (internal teams, customers, support)
```

**Release Notes:**
```
Generate release notes for this feature launch:

Feature: "[description]"
Target audience: "[customers, internal users]"
Release date: "[date]"

Include:
- What's new (customer-facing description)
- Why it matters (benefits and value)
- How to use it (quick start guide)
- Who it's for (relevant customer segments)
- Where to learn more (documentation links)
```

## Measuring Success

### Defining Success Metrics

```
Define success metrics for this feature:

Feature: "[description]"
Goals: "[from business case and validation]"

Recommend metrics for:
1. Adoption (how many customers use it)
2. Engagement (how often and deeply they use it)
3. Value delivery (impact on customer outcomes)
4. Business impact (revenue, retention, NPS)
5. Technical performance (speed, reliability, errors)

For each metric:
- How to measure it
- Target value (what success looks like)
- Timeframe (when to evaluate)
```

### Continuous Improvement

After launch, use AI to analyze usage data and customer feedback:

```
Analyze feature usage data and feedback from first month:

Feature: "[name]"
Usage data: "[metrics]"
Customer feedback: "[support tickets, surveys, app reviews]"

Identify:
1. Adoption patterns (who's using it, who isn't)
2. Usage patterns (how they're using it)
3. Issues and complaints (what's not working)
4. Feature requests (what's missing)
5. Improvement opportunities (quick wins vs major enhancements)
6. Next iteration recommendations
```

## AI Throughout the Product Lifecycle

### Discovery Phase (Where You Are)
- Problem discovery and definition
- Solution discovery and validation
- Business case development

### Build Phase (Where You're Going)
- **Requirements**: [Generating Requirements](../generating-requirements/README.md)
- **Development**: [Feature Development](../feature-development/README.md)
- **Testing**: [Testing with AI](../feature-development/testing.md)
- **Documentation**: [Documentation with AI](../feature-development/documentation.md)

### Delivery Phase
- Deployment planning and execution
- Launch coordination
- Customer communication

### Evolve Phase
- Usage monitoring and analysis
- Customer feedback synthesis
- Continuous improvement planning

## MYOB Build & Delivery Context

### Small Batch Delivery

MYOB values working in small batches:
- Deploy frequently (at least weekly)
- Small PRs (under 400 lines)
- Iterative improvement over big bang releases

**AI helps maintain small batches:**
- Break large features into deliverable increments
- Generate deployment plans for phased rollouts
- Identify minimal viable slices of functionality

```
Break this feature into small, independently deployable increments:

Feature: "[full feature description]"

Each increment should:
- Deliver customer value independently
- Be deployable in 1-2 weeks
- Be under 400 lines of code changes
- Build toward the full feature vision

Generate 5-7 incremental releases with:
- Increment name
- Functionality included
- Value delivered to customers
- Dependencies on previous increments
```

### Integration with MYOB Delivery Practices

This playbook focuses on AI acceleration. For general delivery practices, see:
- **MYOB Architecture Codex** - Complete delivery standards and requirements
- **Engineering Practices** - CI/CD, testing strategies, deployment processes
- **Quality Standards** - Code review, security, performance requirements

## Next Steps

You're ready to transition from Discovery to Delivery:

1. **Generate Requirements**: [Product Requirements](../generating-requirements/product-requirements.md)
2. **Start Development**: [Feature Development](../feature-development/README.md)
3. **Set Up AI Tools**: [Getting Started](../getting-started/README.md)

---

**Previous:** [← AI for Solution Validation](ai-for-solution-validation.md) | **Next:** [Generating Requirements →](../generating-requirements/README.md)

---


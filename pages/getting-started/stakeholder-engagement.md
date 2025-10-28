---
title: Stakeholder Engagement for AI Adoption
---

![MYOB Banner](../../assets/images/myob-banner.png)

# Stakeholder Engagement for AI Adoption

## Overview

Successfully adopting AI tools for software delivery requires engaging stakeholders across the organization. This guide helps you communicate AI initiatives, address concerns, build trust, and secure buy-in from executives, teams, and customers.

Effective stakeholder engagement ensures AI adoption is:
- **Transparent** - Everyone understands what AI tools are being used and why
- **Inclusive** - Concerns and feedback are heard and addressed
- **Trusted** - Security, privacy, and ethics are clearly communicated
- **Successful** - Stakeholders support and enable AI initiatives

## Table of Contents

- [Identifying Stakeholders](#identifying-stakeholders)
- [Communication Strategies](#communication-strategies)
- [Building Trust and Transparency](#building-trust-and-transparency)
- [Addressing Common Concerns](#addressing-common-concerns)
- [Governance and Approval](#governance-and-approval)
- [Measuring and Reporting Success](#measuring-and-reporting-success)
- [MYOB Context](#myob-context)

## Identifying Stakeholders

### Key Stakeholder Groups

**Executive Leadership:**
- CTO, VP of Engineering, Product Leaders
- **Interests:** ROI, competitive advantage, risk management, strategic alignment
- **Concerns:** Cost, security, compliance, organizational change
- **Engagement:** Business case, success metrics, risk mitigation plans

**Engineering Teams:**
- Developers, QA engineers, DevOps, architects
- **Interests:** Productivity, tool quality, learning opportunities, workflow integration
- **Concerns:** Job security, learning curve, tool reliability, vendor lock-in
- **Engagement:** Training, hands-on demos, feedback loops, pilot programs

**Product Managers:**
- Product owners, business analysts, designers
- **Interests:** Faster delivery, better insights, data-driven decisions, customer value
- **Concerns:** AI accuracy, customer impact, competitive differentiation
- **Engagement:** Discovery use cases, requirement generation examples, success stories

**Security and Compliance:**
- Security team, privacy officers, compliance managers
- **Interests:** Data protection, regulatory compliance, risk mitigation
- **Concerns:** Data leakage, security vulnerabilities, audit trails, compliance
- **Engagement:** Security assessments, compliance documentation, monitoring plans

**Customers:**
- End users of MYOB products (may be indirectly affected by AI-assisted development)
- **Interests:** Product quality, privacy, reliability, features
- **Concerns:** Data privacy, AI-generated code quality, transparency
- **Engagement:** Privacy policies, quality assurance, opt-out mechanisms (if AI in product)

### Stakeholder Mapping

Create a stakeholder map for your AI initiative:

| Stakeholder | Interest Level | Influence Level | Engagement Strategy |
|-------------|----------------|-----------------|---------------------|
| CTO | High | High | Monthly updates, ROI reports |
| Engineering Teams | High | Medium | Weekly demos, training, feedback |
| Security Team | High | High | Security reviews, ongoing monitoring |
| Product Managers | Medium | Medium | Use case showcases, training |
| Customers | Low | Low | Quality assurance, privacy transparency |

**Prioritization:**
- **High Interest + High Influence**: Actively engage, frequent communication
- **High Interest + Low Influence**: Keep informed, involve in feedback
- **Low Interest + High Influence**: Keep satisfied, periodic updates
- **Low Interest + Low Influence**: Monitor, general updates

## Communication Strategies

### Tailoring Communication by Stakeholder

**For Executives:**
- **Focus:** Business value, ROI, strategic advantages
- **Format:** Executive summaries, business cases, dashboard metrics
- **Frequency:** Monthly or quarterly updates
- **Content:** High-level outcomes, cost savings, competitive position

**Example Executive Update:**
```
Q3 AI Adoption Update:
- Developer productivity: +35% faster feature delivery
- Code quality: 20% reduction in bugs
- Cost: $50k investment, $200k+ value delivered
- ROI: 4x return in first quarter
- Next: Expand to Product Managers for discovery work
```

**For Engineering Teams:**
- **Focus:** Practical benefits, hands-on experience, skill development
- **Format:** Demos, workshops, documentation, Slack channels
- **Frequency:** Weekly or as-needed
- **Content:** Tool capabilities, best practices, success stories, challenges

**Example Engineering Communication:**
```
New AI Tool Available: Cursor IDE
- What: AI-first code editor with MCP support
- Why: 50% faster refactoring, better context understanding
- How: Setup guide available, training sessions this week
- Try: Install and test on non-critical project first
- Support: #ai-tools Slack channel for questions
```

**For Security/Compliance:**
- **Focus:** Risk mitigation, data protection, audit trails
- **Format:** Security assessments, compliance documentation, review meetings
- **Frequency:** Before adoption, quarterly reviews
- **Content:** Security posture, data handling, audit mechanisms

**Example Security Communication:**
```
AI Tool Security Review: GitHub Copilot
- Data Handling: Code sent to GitHub, not used for training (enterprise tier)
- Compliance: SOC 2 Type II, ISO 27001 certified
- Approved Data: Internal code only, no customer data/PII
- Monitoring: Audit logs enabled, quarterly access reviews
- Status: ✅ Approved for all developers
```

## Building Trust and Transparency

### Transparency Practices

**Publish AI Guardrails:**
- Document what AI tools can and cannot be used for
- Define data classification rules for AI usage
- Specify approval processes for new tools
- Share security and privacy requirements

**Example: AI Usage Guardrails**
```markdown
## MYOB AI Tool Usage Guidelines

### Approved Tools
- Cursor IDE, GitHub Copilot, ChatGPT Teams (see full list)

### Approved Uses
- Code generation and completion
- Documentation and test generation
- Code review and refactoring
- Discovery and requirements analysis

### Prohibited Uses
- Processing customer PII or financial data
- Generating code for production without review
- Auto-deploying AI-generated code
- Using unapproved AI tools or models

### Data Classification
- Public/Internal: ✅ OK with approved cloud AI tools
- Confidential: ⚠️ Local AI tools only
- Restricted: ❌ Never with AI tools
```

**Communicate Decisions:**
- Maintain Architecture Decision Records (ADRs) for AI tool choices
- Share ADRs publicly within MYOB (Confluence, GitHub)
- Explain rationale for tool selections
- Document security trade-offs and mitigations

**Provide Opt-Outs:**
- Allow teams to opt-out of specific AI tools if they have concerns
- Provide alternative workflows for those not using AI
- Don't mandate AI usage without addressing concerns
- Support gradual adoption at team's pace

### Regular Updates

**Establish Update Cadence:**
- **Weekly:** Team-level updates (new prompts, tips, success stories)
- **Monthly:** Organization updates (adoption metrics, new approvals, training)
- **Quarterly:** Executive updates (ROI, strategic initiatives, roadmap)

**Update Channels:**
- **Slack:** #ai-tools channel for quick updates and Q&A
- **Confluence:** Formal documentation and guidelines
- **Email:** Monthly newsletter to stakeholders
- **All-hands:** Quarterly presentations on AI impact
- **1-on-1s:** Address individual concerns and gather feedback

## Addressing Common Concerns

### "Will AI Replace My Job?"

**Response:**
- AI tools augment developers, they don't replace them
- AI handles repetitive tasks, freeing developers for creative work
- Demand for developers remains high; AI makes them more productive
- MYOB is investing in AI to make our teams more effective, not smaller
- Learning AI skills makes developers more valuable, not less

**Evidence:**
- Share productivity gains (developers deliver more value)
- Show how AI enables tackling larger challenges
- Highlight skill development opportunities
- Present industry data on AI + human collaboration

### "How Do We Ensure AI-Generated Code is Secure?"

**Response:**
- All AI-generated code goes through standard code review
- Security team has reviewed and approved all AI tools
- We have specific checklists for AI code review
- AI tools follow MYOB security policies (see security.md)
- Regular security audits of AI tool usage
- Developers remain responsible for all code, AI-assisted or not

**Evidence:**
- Share security review documentation
- Demonstrate code review processes
- Show monitoring and audit mechanisms
- Present security training materials

### "What Data Are We Sharing with AI Providers?"

**Response:**
- We only use MYOB-approved AI tools with strict data policies
- Customer data, PII, and production secrets NEVER go to AI
- We use data classification framework to determine what's safe
- Enterprise tier agreements guarantee data privacy
- Regular audits of what data AI tools access
- Full transparency in privacy policies

**Evidence:**
- Share data classification framework
- Show tool vendor security certifications
- Demonstrate monitoring and auditing
- Provide data processing agreements (DPAs)

### "How Much Will This Cost?"

**Response:**
- Initial investment: [Tool licenses, training, setup]
- Expected ROI: [Productivity gains, faster delivery, quality improvements]
- Cost per developer: $20-40/month for AI tools
- Value delivered: 20-50% productivity increase = $X per developer per month
- Break-even: Typically 1-2 months
- Long-term: Significant competitive advantage

**Evidence:**
- Share business case with calculations
- Present pilot program results
- Show productivity metrics from early adopters
- Compare to industry benchmarks

### "What If the AI Makes Mistakes?"

**Response:**
- Humans review all AI outputs before deployment
- Comprehensive testing catches AI errors
- AI suggests, humans decide and validate
- We have processes for handling AI errors (like any other bugs)
- AI improves code quality overall (catches more bugs than it creates)

**Evidence:**
- Share code review processes
- Demonstrate testing requirements
- Show bug metrics (AI-assisted vs traditional code)
- Present error handling procedures

## Governance and Approval

### AI Tool Approval Process

**Communicate the Process Clearly:**

1. **Request:** Developer or team identifies need for AI tool
2. **Security Review:** Security team evaluates tool (see [Security](../../responsible-practices/security.md))
3. **Data Assessment:** Privacy team reviews data handling
4. **Approval Decision:** Security and Architecture teams approve or deny
5. **Documentation:** Approved tools added to registry
6. **Training:** Teams trained before tool rollout

**Timeline:** Typically 2-4 weeks for new tool approval

**Share the registry:** [MYOB-Approved Tools](../../appendix/MYOB-approved-tools.md)

### Decision Documentation

**Architecture Decision Records (ADRs):**
- Document AI tool selection decisions
- Explain rationale, alternatives considered, trade-offs
- Share ADRs in Confluence for transparency
- Reference ADRs in training materials

**Example ADR Topics:**
- Why we chose Cursor over other AI IDEs
- GitHub Copilot approval criteria
- MCP server security requirements
- Data classification for AI usage

### Escalation Paths

**Provide Clear Escalation:**
- Questions about AI tools → #ai-tools Slack channel
- Security concerns → #svc-security Slack channel
- Policy questions → Architecture team
- Tool approval requests → Security team
- Executive decisions → CTO/VP Engineering

## Measuring and Reporting Success

### Key Metrics to Track

**Adoption Metrics:**
- Number of developers using AI tools
- Frequency of AI tool usage (daily active users)
- Tool diversity (how many different AI tools used)
- Team coverage (percentage of teams using AI)

**Productivity Metrics:**
- Time to complete features (before vs after AI)
- Pull request throughput (PRs per week)
- Code review cycle time
- Bug fix time

**Quality Metrics:**
- Bug rates in AI-assisted code vs traditional code
- Test coverage in AI-generated code
- Security vulnerabilities caught/prevented
- Code review feedback volume

**Business Metrics:**
- Developer satisfaction scores
- Estimated cost savings (time saved × hourly rate)
- Features delivered per quarter
- Time-to-market improvements

### Reporting Cadence

**Weekly (Teams):**
- Quick wins and success stories
- New prompts or techniques discovered
- Challenges encountered and solutions

**Monthly (Management):**
- Adoption metrics and trends
- Productivity improvements
- Training completion rates
- Upcoming initiatives

**Quarterly (Executives):**
- ROI calculations and business impact
- Strategic initiatives and roadmap
- Risk assessments and mitigations
- Competitive positioning

### Success Stories

**Share Concrete Examples:**

```
Success Story: Payment Processing Refactoring

Challenge: Refactor legacy payment code across 10 microservices
Traditional Estimate: 6 weeks, 2 developers
With AI (Cursor + Claude 200k): 2 weeks, 2 developers
Savings: 4 weeks of effort = ~$40k value
Quality: Better test coverage, fewer bugs than manual refactoring
Lessons: Long context models excel at large refactorings
```

## MYOB Context

### Aligning with MYOB Values

**Small Batches:**
- AI enables smaller, more frequent deployments
- Faster iteration with AI-assisted development
- Reduced risk through incremental AI adoption

**Everyone is Responsible:**
- AI doesn't change accountability
- Developers own AI-generated code
- Collective responsibility for AI adoption success

**Continuous Improvement:**
- Regular feedback loops on AI tool effectiveness
- Iterative improvement of prompts and workflows
- Sharing learnings across teams

### MYOB-Specific Stakeholder Channels

**Internal Communication:**
- **#ai-tools** - General AI tool discussions and support
- **#sig-tech-codex** - Architecture and standards discussions
- **#svc-security** - Security questions and concerns
- **Confluence** - Formal documentation and guidelines

**External Communication:**
- **Privacy Policy** - Customer-facing transparency about AI usage
- **Developer Blog** - Sharing AI adoption journey (if appropriate)
- **Recruitment** - Highlight AI tools in job postings and interviews

### Stakeholder Engagement Checklist

Before launching an AI initiative:

- [ ] Identified all stakeholder groups
- [ ] Mapped stakeholder interests and concerns
- [ ] Developed tailored communication for each group
- [ ] Scheduled regular update cadence
- [ ] Created feedback mechanisms
- [ ] Documented approval processes
- [ ] Prepared FAQs for common concerns
- [ ] Established escalation paths
- [ ] Defined success metrics
- [ ] Planned training and support
- [ ] Set up monitoring and reporting
- [ ] Published guardrails and approved tools

## Best Practices

### Do:
- Start with pilots and success stories
- Be transparent about limitations and risks
- Listen to and address concerns genuinely
- Share both successes and failures
- Provide multiple feedback channels
- Celebrate early adopters
- Make it easy to learn and experiment safely

### Don't:
- Mandate AI adoption without addressing concerns
- Hide AI tool usage or data handling
- Dismiss security or privacy concerns
- Over-promise AI capabilities
- Deploy without proper training
- Ignore feedback from teams
- Rush organization-wide rollout

## Resources

- **[MYOB-Approved Tools](../../appendix/MYOB-approved-tools.md)** - Official approved AI tools list
- **[Security](../../responsible-practices/security.md)** - AI security practices for stakeholders
- **[Data Privacy](../../responsible-practices/data-privacy-security.md)** - Privacy and compliance
- **[Ethics](../../responsible-practices/ethics.md)** - Ethical AI usage principles

For stakeholder engagement questions, contact the Architecture team or post in #sig-tech-codex on Slack.

---

**Previous:** [← AI Training Programs](ai-training-programs.md) | **Next:** [AI-first Mindset →](ai-first-mindset.md)

---

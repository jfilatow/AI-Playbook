---
title: AI for Problem Discovery
---

![MYOB Banner](../../assets/images/myob-banner.png)

# AI for Problem Discovery

## Overview

Problem Discovery is the first phase of the Double Diamond process, where teams **diverge** to explore the problem space as widely as possible. The goal is to understand customer needs, market trends, and business challenges before converging on which problems to solve.

AI tools excel at processing large amounts of information quickly, helping you explore more ground in less time. However, human empathy, customer relationships, and strategic judgment remain essential.

## Table of Contents

- [AI Tools for Problem Discovery](#ai-tools-for-problem-discovery)
- [Market Research with AI](#market-research-with-ai)
- [User Research Synthesis](#user-research-synthesis)
- [Competitive Analysis](#competitive-analysis)
- [Ideation and Brainstorming](#ideation-and-brainstorming)
- [MYOB Financial Domain Context](#myob-financial-domain-context)
- [Practical Prompts](#practical-prompts)

## AI Tools for Problem Discovery

### Recommended MYOB-Approved Tools

**For Research and Analysis:**
- **ChatGPT Teams** - Market research, trend analysis, document synthesis
- **Claude** - Long-form analysis, research paper summaries
- **Cursor** - Code-related problem exploration, technical feasibility

**For Collaboration:**
- **Glean** (via MCP) - Search internal MYOB documentation and past discoveries
- **Atlassian** (via MCP) - Access Jira insights, Confluence documentation

**For Data Analysis:**
- **GitHub Copilot** - Analyze user feedback data, survey results
- **ChatGPT Data Analysis** - Process and visualize discovery data

See [MYOB-Approved Tools](../appendix/MYOB-approved-tools.md) for complete list and setup instructions.

## Market Research with AI

Use AI to quickly understand market landscape, industry trends, and competitive dynamics.

### Trend Analysis

**What AI Can Do:**
- Identify emerging trends in financial software
- Analyze industry reports and summarize key insights
- Track technology adoption patterns
- Monitor regulatory changes and their impact

**Example Prompts:**
```
Analyze the top 5 trends in small business accounting software for 2025. 
Focus on: cloud adoption, AI features, mobile-first approaches, and 
integration ecosystems. Provide data sources for each trend.
```

```
Summarize recent regulatory changes affecting payroll software in 
Australia. Include: implementation deadlines, affected features, and 
compliance requirements.
```

### Competitor Research

**What AI Can Do:**
- Analyze competitor product features and positioning
- Compare pricing models and market strategies
- Identify gaps in competitive offerings
- Synthesize customer reviews of competitor products

**Example Prompts:**
```
Compare the invoice management features of Xero, QuickBooks, and FreshBooks.
Create a feature comparison table highlighting: automation capabilities, 
user experience, pricing, and integration options.
```

```
Analyze customer reviews for [competitor product] focusing on:
- Most common complaints
- Most praised features
- Feature requests and gaps
- User personas and use cases
```

**Best Practices:**
- Cross-reference AI insights with your own product experience
- Verify AI findings with actual competitor product trials
- Use multiple sources; don't rely on AI alone
- Update competitive analysis monthly

### Market Sizing and Opportunity Assessment

**What AI Can Do:**
- Estimate market sizes using available data
- Project growth rates and trends
- Calculate addressable market segments
- Identify underserved market niches

**Example Prompts:**
```
Estimate the Total Addressable Market (TAM) for cloud-based expense 
management software for Australian small businesses (1-50 employees).
Use 2024 data and show calculations.
```

```
Calculate the growth rate of mobile-first accounting apps over the past
3 years. Project forward 2 years and identify key growth drivers.
```

**Limitations:**
- AI estimates require validation with authoritative sources
- Market data may be outdated (check AI training data cutoff)
- Regional market data (especially AU/NZ) may be limited
- Always verify with industry reports and analyst data

## User Research Synthesis

AI can dramatically speed up analysis of customer interviews, surveys, and feedback.

### Interview Analysis

**What AI Can Do:**
- Transcribe interviews (with customer consent)
- Identify recurring themes and patterns
- Extract pain points and needs
- Generate insight summaries
- Create affinity maps and categories

**Example Workflow:**

1. **Transcribe**: Use AI to transcribe interview recordings (ensure customer consent)
2. **Analyze**: Identify patterns across multiple interviews
3. **Synthesize**: Generate insight summaries and themes
4. **Validate**: Review AI findings against your own interview notes

**Example Prompts:**
```
Analyze these 5 customer interview transcripts about expense reporting.
Identify:
1. Top 3 pain points mentioned by multiple customers
2. Desired features or improvements
3. Current workaround strategies
4. Customer segment patterns
```

```
From this interview transcript, extract quotes that illustrate the 
customer's frustration with manual data entry. Organize by: frequency
of issue, impact severity, and emotional intensity.
```

**Privacy Considerations:**
- ⚠️ **Remove customer names and identifying information** before using AI
- Obtain consent for AI-assisted analysis if required
- Use internal AI tools for sensitive customer feedback
- Never upload interview recordings to public AI services

### Survey Analysis

**What AI Can Do:**
- Analyze open-ended survey responses at scale
- Categorize feedback into themes
- Identify correlations between responses
- Generate summary insights and visualizations

**Example Prompts:**
```
Analyze 200 open-ended survey responses about our mobile app experience.
Categorize responses into themes, rank by frequency, and identify
the top 5 improvement opportunities.
```

```
From this survey data (CSV format), identify correlations between:
- Business size and feature usage
- Industry and pain points
- User role and desired improvements
```

### User Feedback Aggregation

**What AI Can Do:**
- Aggregate feedback from multiple channels (support tickets, app reviews, social media)
- Identify trends over time
- Prioritize issues by customer impact
- Generate insight reports for stakeholders

**Example Prompts:**
```
Synthesize these 50 support tickets related to invoicing. Create:
1. Issue categories with frequency counts
2. Common root causes
3. Temporary workarounds customers found
4. Suggested product improvements
```

## Competitive Analysis

### Feature Gap Analysis

**Example Prompts:**
```
Compare MYOB's expense tracking features with Xero and QuickBooks.
Identify:
- Features we have that they don't
- Features they have that we don't
- Features all three have (table stakes)
- Unique differentiators for each product
```

### Customer Sentiment Analysis

**Example Prompts:**
```
Analyze App Store reviews for [product name] from the past 6 months.
Focus on:
- Feature requests and missing functionality
- Usability complaints
- Performance and reliability issues
- Positive differentiators
Create a prioritized list of improvement opportunities.
```

## Ideation and Brainstorming

Use AI to generate diverse ideas and explore problem spaces creatively.

### Brainstorming Techniques

**Divergent Thinking:**
AI can help generate many ideas quickly:

```
Generate 20 different ways to solve the problem: "Small business owners
spend too much time on manual data entry for expense reporting."
Consider solutions ranging from incremental improvements to radical
reimagining. Include technical and non-technical approaches.
```

**SCAMPER Method:**
Use AI to apply creative frameworks:

```
Apply the SCAMPER method to our current invoice creation process:
- Substitute: What could we replace?
- Combine: What could we merge?
- Adapt: What could we adapt from other domains?
- Modify: What could we change or exaggerate?
- Put to other uses: Alternative uses?
- Eliminate: What could we remove?
- Reverse: What could we reverse or rearrange?
```

**Jobs-to-be-Done:**
```
Analyze customer interviews and identify the "jobs" customers are
trying to accomplish with expense management software. Use Jobs-to-be-Done
framework to extract:
- Functional jobs (practical tasks)
- Emotional jobs (how they want to feel)
- Social jobs (how they want to be perceived)
```

## MYOB Financial Domain Context

### Financial Software Problem Discovery

When exploring problems in the financial domain:

**Unique Considerations:**
- Compliance and regulatory requirements shape problem space
- Financial accuracy and audit trails are non-negotiable
- Industry-specific pain points (tax, payroll, reporting)
- Regional differences (Australian vs New Zealand vs UK tax systems)

**AI-Assisted Discovery:**

```
Identify the top 10 pain points small business owners face with
Australian tax compliance. Focus on:
- BAS (Business Activity Statement) preparation
- GST calculations and reporting
- PAYG withholding
- STP (Single Touch Payroll) requirements
- Tax filing deadlines and penalties
```

```
Analyze how accountants currently manage client tax obligations
across multiple small business clients. Identify:
- Time-consuming manual tasks
- Error-prone processes
- Communication bottlenecks with clients
- Opportunities for automation
```

### Customer Segment Discovery

**Example Prompts:**
```
Generate detailed personas for different MYOB customer segments:
1. Sole trader (no employees)
2. Small business (1-10 employees)
3. Growing business (11-50 employees)
4. Accounting practice (managing multiple clients)

For each persona include: business type, pain points, tech savviness,
budget sensitivity, and feature priorities.
```

## Practical Prompts

### Problem Space Exploration

```
I'm exploring problems related to [topic]. Help me understand:
1. What are the main categories of problems in this space?
2. Who experiences these problems most acutely?
3. What are the underlying causes vs symptoms?
4. Which problems are most frequently discussed in industry forums?
5. What emerging trends might create new problems?
```

### Root Cause Analysis

```
Customers complain that "[surface problem]". Help me explore potential
root causes:
1. Generate 10 possible root causes
2. For each cause, explain the chain of events
3. Suggest how to validate each hypothesis
4. Recommend which to investigate first
```

### Opportunity Mapping

```
Given this problem: "[problem statement]", help me map the opportunity:
1. Who experiences this problem? (segments)
2. How frequently does it occur?
3. What is the current cost/impact?
4. What alternatives or workarounds exist?
5. What would success look like for each segment?
```

## Best Practices

### Do:
- Use AI to explore many angles quickly
- Combine AI insights with your own customer knowledge
- Validate AI findings with real customer conversations
- Use AI to generate hypotheses, then test them
- Document AI-assisted insights for your team

### Don't:
- Replace customer interviews with AI analysis alone
- Trust AI market sizing without verification
- Use AI for sensitive competitive intelligence gathering
- Include customer PII or confidential data in prompts
- Make strategic decisions based solely on AI recommendations

## Next Steps

After Problem Discovery, move to:

1. **[AI for Problem Definition](ai-for-problem-definition.md)** - Narrow to the right problem
2. **[Discovery Prompts](../appendix/prompt-library/discovery/)** - Ready-to-use discovery prompts
3. **[Generating Requirements](../generating-requirements/README.md)** - Turn problems into requirements

---

**Previous:** [← Discovery Overview](README.md) | **Next:** [AI for Problem Definition →](ai-for-problem-definition.md)

---


---
title: AI for Solution Validation
---

![MYOB Banner](../../assets/images/myob-banner.png)

# AI for Solution Validation

## Overview

Solution Validation is the convergence phase of the second diamond, where teams narrow from multiple solution concepts to a validated solution ready for build. This is the final decision point before significant development investment: **"What are we building? What is the priority?"**

AI tools can help design validation experiments, analyze results, and assess solution readiness, but the decision to build requires human judgment, customer validation, and stakeholder alignment.

## Table of Contents

- [Validation Experiment Design](#validation-experiment-design)
- [Prototype Testing with AI](#prototype-testing-with-ai)
- [Customer Feedback Analysis](#customer-feedback-analysis)
- [Solution Assessment](#solution-assessment)
- [Business Case Development](#business-case-development)
- [Readiness Evaluation](#readiness-evaluation)
- [Decision Making](#decision-making)
- [Practical Prompts](#practical-prompts)

## Validation Experiment Design

AI can help you design lean experiments to test solution concepts quickly and cheaply.

### Experiment Planning

```
Design a validation experiment for this solution concept:

Solution: "[solution description]"
Hypothesis: "[what we believe about this solution]"

Create an experiment plan:
1. What we're testing (specific hypotheses)
2. Validation method (prototype, survey, wizard-of-oz, landing page, etc.)
3. Success criteria (what results validate the solution)
4. Failure criteria (what results invalidate it)
5. Participant selection (who, how many, which segments)
6. Timeline and milestones (recommend 1-2 weeks)
7. Resource requirements (people, tools, budget)
8. Data collection approach
9. Analysis plan
```

### A/B Test Design

```
Design an A/B test to compare these solution approaches:

Approach A: "[description]"
Approach B: "[description]"

Plan should include:
1. Test duration and sample size needed
2. Primary metric (what we're measuring)
3. Secondary metrics (supporting measurements)
4. Segmentation strategy (which user types)
5. Success threshold (what result makes us choose A or B)
6. Statistical significance requirements
7. Potential confounding factors to control
```

### Minimal Viable Prototype Scoping

```
Scope a minimal viable prototype to test this solution:

Solution: "[full solution vision]"

Define:
1. Core feature to prototype (minimum to test hypothesis)
2. What to include (essential for validation)
3. What to fake or simulate (not built yet)
4. What to exclude (not needed for validation)
5. Fidelity level (sketch, wireframe, interactive prototype, working code)
6. Build time estimate (aim for 1-5 days)
7. What we'll learn from this prototype
```

## Prototype Testing with AI

AI can help analyze prototype testing sessions and feedback.

### Usability Test Analysis

```
Analyze these usability test sessions for our prototype:

Prototype: "[description]"
Test sessions: 5 users, 30 minutes each
Observations: "[paste test notes or recordings]"

Identify:
1. Task success rates and completion times
2. Points of confusion or friction
3. Positive reactions and delights
4. Feature requests or missing capabilities
5. Comparison to current solution (if applicable)
6. Severity of issues found (critical/major/minor)
7. Recommended improvements prioritized
```

### Think-Aloud Protocol Analysis

```
From these think-aloud usability sessions:

"[paste anonymized session transcripts]"

Extract:
1. User mental models (how they think it works)
2. Expectation violations (where it surprised them)
3. Terminology issues (confusing labels or concepts)
4. Workflow preferences (how they want to accomplish tasks)
5. Comparison statements (to other tools or processes)
6. Emotional reactions (frustration, delight, confusion)
```

## Customer Feedback Analysis

Systematically analyze feedback from solution concept testing.

### Feedback Categorization

```
Categorize this customer feedback on our solution concept:

Feedback from 15 customer interviews: "[paste feedback]"

Organize into categories:
1. **Enthusiasm**: Features customers are excited about
2. **Concerns**: Worries or objections raised
3. **Confusion**: Aspects customers don't understand
4. **Requests**: Additions or changes suggested
5. **Deal-breakers**: Things that would prevent adoption
6. **Comparisons**: How they compare to current solutions

For each category, rank items by frequency and provide representative quotes.
```

### Sentiment and Confidence Analysis

```
Analyze customer sentiment about this solution concept:

Solution: "[description]"
Customer feedback: "[anonymized feedback]"

Assess:
1. Overall sentiment (positive/neutral/negative distribution)
2. Confidence in adoption (definitely/probably/maybe/no)
3. Willingness to pay signals (explicit and implicit)
4. Comparison to current solution satisfaction
5. Enthusiasm level (passionate advocates vs lukewarm)
6. Segment differences (does sentiment vary by customer type?)

Provide percentages and representative quotes for each.
```

### Feature Priority from Feedback

```
From this customer feedback, prioritize features for our solution:

Feedback: "[paste customer responses]"

Create a prioritized feature list:
1. Must-have (mentioned by >70% as critical)
2. Should-have (mentioned by 40-70% as important)
3. Nice-to-have (mentioned by 10-40% as beneficial)
4. Won't-have (mentioned but low priority or out of scope)

For each feature:
- Frequency mentioned
- Customer segments requesting
- Effort estimate (if known)
- Business value score
```

## Solution Assessment

Evaluate solution readiness using structured criteria.

### Solution Scorecard

```
Score this validated solution concept against our criteria:

Solution: "[description]"
Validation data: "[summary of validation results]"

Score each criterion (0-10):
1. Customer Value: How much customers need/want this
2. Business Value: Revenue, retention, strategic benefits
3. Technical Feasibility: Can we build it reliably?
4. Differentiation: Unique vs competitors
5. Strategic Fit: Alignment with MYOB direction
6. Go-to-Market: Can we launch and scale it?

Total score: [sum]
Weighted score: [if different weights apply]
Recommendation: Go/No-Go with justification
```

### Value Proposition Development

```
Develop a clear value proposition for this solution:

Solution: "[description]"
Target customers: "[segment]"
Validation insights: "[key findings]"

Create a value proposition using this format:

For [target customer]
Who [customer's problem or need]
Our [solution name] is a [solution category]
That [key benefit or value]
Unlike [current alternative or competitor]
Our solution [unique differentiator]

Also generate:
- 3 key benefit statements
- 1 elevator pitch (30 seconds)
- 5 messaging pillars for marketing
```

## Business Case Development

AI can help generate initial business case components for review.

### Financial Projection

```
Create a financial projection for this solution:

Solution: "[description]"
Target market: "[segment and size]"
Pricing model: "[subscription, one-time, freemium, etc.]"

Project for 3 years:
1. Customer acquisition (new customers per month/year)
2. Revenue projections (conservative, expected, optimistic)
3. Development costs (initial and ongoing)
4. Operating costs (infrastructure, support, etc.)
5. Customer lifetime value (LTV)
6. Payback period
7. ROI calculation

State all assumptions clearly.
```

### Resource Requirements

```
Estimate resource requirements for building this solution:

Solution: "[description]"
Scope: MVP for validation vs full solution

Estimate:
1. Team composition (roles and FTEs)
2. Timeline (weeks to MVP, weeks to full release)
3. Technical dependencies (infrastructure, integrations)
4. Budget requirements (development, tools, infrastructure)
5. Ongoing maintenance (support, hosting, updates)
6. Risks to timeline or budget
```

## Readiness Evaluation

Assess whether the solution is ready to move to the Build phase.

### Readiness Checklist Generation

```
Create a readiness checklist for this solution:

Solution: "[description]"

Generate checklist covering:
1. Customer validation (problem validated, solution validated, pricing validated)
2. Technical readiness (architecture defined, feasibility confirmed, risks mitigated)
3. Business readiness (business case approved, resources allocated, stakeholders aligned)
4. Design readiness (UX validated, accessibility considered, mobile + desktop)
5. Compliance readiness (regulatory requirements identified, privacy reviewed, security assessed)
6. Go-to-market readiness (positioning defined, launch plan drafted, support prepared)

For each item, specify what "done" looks like.
```

### Gap Analysis

```
Identify gaps in our solution validation:

Solution: "[description]"
Validation completed: "[list what we've done]"

Identify:
1. Missing validation (what haven't we tested?)
2. Insufficient evidence (where do we need more data?)
3. Unstated assumptions (what are we assuming without validation?)
4. Risk areas (what could go wrong that we haven't assessed?)
5. Recommended additional validation before build decision
```

## Decision Making

### Decision Recommendation

```
Generate a go/no-go recommendation for this solution:

Solution: "[description]"

Evidence:
- Customer validation: "[summary]"
- Technical assessment: "[summary]"
- Business case: "[summary]"
- Competitive analysis: "[summary]"

Provide:
1. Recommendation: Go / No-Go / Pivot
2. Confidence level: High / Medium / Low
3. Key supporting evidence (top 3 reasons)
4. Key risks or concerns (top 3)
5. Conditions for "Go" (what must be true)
6. Alternative options if "No-Go"
```

### Stakeholder Communication

```
Create a stakeholder presentation for this solution decision:

Solution: "[description]"
Recommendation: "[Go/No-Go/Pivot]"
Audience: "[executives, engineering leaders, etc.]"

Create presentation outline with:
1. Problem summary (why this matters)
2. Solution concept (what we're proposing)
3. Validation results (evidence from customer testing)
4. Business case (ROI, revenue, strategic value)
5. Technical feasibility (can we build it?)
6. Risks and mitigations
7. Recommendation and next steps
8. Decision required from stakeholders

Keep each section to 2-3 key points.
```

## MYOB Context

### Financial Product Validation

Specific considerations for validating financial software solutions:

**Regulatory Validation:**
```
Validate that this solution meets regulatory requirements:

Solution: "[description]"
Markets: Australia, New Zealand

Check against:
1. ATO (Australian Taxation Office) requirements
2. IRD (Inland Revenue New Zealand) requirements
3. Financial reporting standards (AASB, NZIFRS)
4. Data protection regulations (Privacy Act)
5. Industry-specific requirements (accounting, payroll)

Identify:
- Compliance requirements met
- Gaps or risks
- Validation needed from legal/compliance team
```

**Accuracy and Audit Validation:**
```
Assess audit trail and accuracy requirements for this solution:

Solution: "[description involving financial calculations or data]"

Evaluate:
1. What financial data does it process or generate?
2. What accuracy level is required? (to the cent, percentage acceptable)
3. What audit trail is needed? (who did what when, change history)
4. What reporting requirements exist? (tax reports, financial statements)
5. How do we validate calculations are correct?
6. What happens if there's an error? (correction process, customer impact)
```

## Practical Prompts

### Validation Experiment Design

```
Design a 2-week validation sprint for this solution:

Solution: "[description]"
Budget: $[amount] and [X] people
Goal: Validate customers will use and pay for this

Week 1: Build
- What to build (minimal prototype)
- Who builds it (roles needed)
- What to fake/simulate

Week 2: Test
- Who to test with (segments, sample size)
- What to test (hypotheses to validate)
- How to collect feedback

Success criteria: What results mean "go ahead and build"
```

### Solution Refinement

```
Based on this validation feedback, refine the solution:

Original concept: "[description]"
Validation feedback: "[key findings]"

Recommend:
1. What to keep (validated features)
2. What to change (needs modification based on feedback)
3. What to add (customer-requested additions)
4. What to remove (didn't resonate or too complex)
5. Updated solution description incorporating feedback
```

## Best Practices

### Do:
- Test with real target customers
- Use multiple validation methods (not just one)
- Set clear success criteria before testing
- Analyze both positive and negative feedback
- Iterate solution based on feedback
- Document validation decisions

### Don't:
- Skip validation and go straight to build
- Test only with friendly or internal users
- Ignore negative feedback or concerns
- Over-index on one customer's opinion
- Validate only happy path, ignore edge cases
- Rush validation due to timeline pressure

## Transition to Build

Once the solution is validated and the decision is "Go":

1. **Document Solution**: Final solution description, validated value proposition
2. **Plan Build**: [Generating Requirements](../generating-requirements/README.md)
3. **Start Development**: [Feature Development](../feature-development/README.md)

---

**Previous:** [← AI for Solution Discovery](ai-for-solution-discovery.md) | **Next:** [Generating Requirements →](../generating-requirements/README.md)

---


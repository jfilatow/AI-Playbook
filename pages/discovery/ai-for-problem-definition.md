---
title: AI for Problem Definition
---

![MYOB Banner](../../assets/images/myob-banner.png)

# AI for Problem Definition

## Overview

Problem Definition is the convergence phase of the first diamond, where teams narrow from broad problem exploration to a focused, well-defined problem worth solving. This is a critical decision point: **"Should we build this?"**

AI tools can help analyze data, prioritize opportunities, and refine problem statements, but the final decision requires human judgment, strategic alignment, and stakeholder buy-in.

## Table of Contents

- [From Discovery to Definition](#from-discovery-to-definition)
- [Refining Problem Statements](#refining-problem-statements)
- [Opportunity Assessment](#opportunity-assessment)
- [Prioritization with AI](#prioritization-with-ai)
- [Problem Validation](#problem-validation)
- [Decision Making](#decision-making)
- [MYOB Context](#myob-context)
- [Practical Prompts](#practical-prompts)

## From Discovery to Definition

### The Convergence Process

After exploring many problems in the discovery phase, you now need to converge on the right problem to solve.

**AI Helps With:**
- Analyzing patterns across discovery insights
- Scoring and ranking opportunities
- Identifying dependencies and relationships
- Generating problem statement variations

**Humans Essential For:**
- Strategic alignment with business goals
- Stakeholder negotiation and buy-in
- Risk assessment and feasibility judgment
- Final go/no-go decision

### Decision Point: Should We Build This?

The Problem Definition phase answers critical questions:
- Is this problem significant enough to solve?
- Does it align with MYOB's strategy?
- Can we solve it better than alternatives?
- Will customers pay for the solution?
- Do we have the capability to deliver?

AI can provide data and analysis, but humans make the decision.

## Refining Problem Statements

Use AI to iterate on problem statements until they're clear, specific, and actionable.

### Good Problem Statement Criteria

**A well-defined problem statement:**
- Describes who experiences the problem
- Explains what they're trying to accomplish
- Identifies why current solutions fail
- Quantifies the impact or frequency
- Focuses on the problem, not the solution

### AI-Assisted Problem Statement Refinement

**Iterative Refinement Process:**

1. **Draft**: Write initial problem statement
2. **Critique**: Ask AI to identify weaknesses
3. **Refine**: Use AI suggestions to improve
4. **Validate**: Test with stakeholders

**Example Prompt for Critique:**
```
Critique this problem statement for clarity, specificity, and actionability:

"Small business owners struggle with expense management."

Identify:
1. What's missing or vague?
2. Is it solution-focused vs problem-focused?
3. Does it specify who, what, why?
4. How could it be more specific?
5. What questions should we answer before solving this?
```

**Expected AI Response:**
```
Weaknesses identified:
1. "Struggle" is vague - what specifically is difficult?
2. Which aspect of expense management?
3. What is the impact of this struggle?
4. How do they currently handle it?
5. What would improvement look like?

Suggested refinement:
"Small business owners (1-10 employees) spend 3-5 hours per week manually 
categorizing expenses from bank statements because automated categorization 
is inaccurate (60% accuracy), causing delayed BAS submissions and stress 
during tax time."
```

### Multiple Problem Statement Formats

**Generate variations** for different audiences:

```
Rewrite this problem statement for three different audiences:
1. Executive leadership (business impact focus)
2. Engineering team (technical challenge focus)
3. Customers (pain point and outcome focus)

Original: "[your problem statement]"
```

## Opportunity Assessment

Evaluate the business opportunity using AI for analysis.

### Market Validation

**Market Size Estimation:**

```
Estimate the market opportunity for solving this problem:

Problem: Small Australian businesses (1-20 employees) lack affordable,
accurate automated expense categorization.

Calculate:
1. Total Addressable Market (TAM) - all Australian small businesses
2. Serviceable Available Market (SAM) - those using cloud accounting
3. Serviceable Obtainable Market (SOM) - realistic MYOB capture
4. Annual revenue potential at $10/month per business
5. Key assumptions and data sources used
```

**Impact Assessment:**

```
Assess the customer impact of solving this problem:

Problem: "[problem statement]"

Analyze:
1. Time saved per customer per month
2. Error reduction and accuracy improvement
3. Stress/frustration reduction (qualitative)
4. Financial impact (cost savings, revenue potential)
5. Secondary benefits (compliance, insights, etc.)
```

### Competitive Landscape Analysis

```
Analyze how competitors address this problem:

Problem: "[problem statement]"

For each major competitor (Xero, QuickBooks, FreshBooks):
1. Do they solve this problem?
2. How effective is their solution?
3. What are their solution's limitations?
4. Customer satisfaction with their approach
5. Opportunities for differentiation
```

## Prioritization with AI

Use AI to apply prioritization frameworks and scoring models.

### RICE Framework (Reach, Impact, Confidence, Effort)

```
Score this opportunity using the RICE framework:

Problem: "[problem statement]"

For each dimension, provide:
- Reach: How many customers affected (per quarter)
- Impact: How much it helps (0.25 = minimal, 3 = massive)
- Confidence: How certain we are (0-100%)
- Effort: Person-months to deliver

Calculate RICE score: (Reach × Impact × Confidence) / Effort

Include assumptions and rationale for each score.
```

### Value vs Complexity Matrix

```
Position this problem on a Value vs Complexity matrix:

Problem: "[problem statement]"

Assess:
Value (0-10):
- Customer value: How much they'd pay/use
- Business value: Revenue, retention, differentiation
- Strategic value: Platform, data, competitive advantage

Complexity (0-10):
- Technical complexity: New technology, integration challenges
- Design complexity: UX/UI difficulty, edge cases
- Organizational complexity: Cross-team dependencies, approvals

Recommend: High value + low complexity = do first
```

### MoSCoW Prioritization

```
Apply MoSCoW prioritization to these problem candidates:

Problems:
1. "[problem 1]"
2. "[problem 2]"
3. "[problem 3]"
4. "[problem 4]"
5. "[problem 5]"

Categorize each as:
- Must have: Critical, clear ROI, customer retention at risk
- Should have: Important, strong value, but not critical
- Could have: Nice to have, positive impact
- Won't have (this time): Defer to later

Provide rationale for each categorization.
```

## Problem Validation

Before committing to solving a problem, validate it's real and significant.

### Hypothesis Generation

```
Generate falsifiable hypotheses for this problem:

Problem: "[problem statement]"

Create 5 hypotheses we could test to validate:
1. The problem exists at stated frequency
2. Customers would pay to solve it
3. Current solutions are inadequate
4. Our proposed approach is feasible
5. We can deliver better value than competitors

For each hypothesis, suggest a validation method.
```

### Validation Experiment Design

```
Design a lean validation experiment for this problem:

Problem: "[problem statement]"

Suggest:
1. Experiment type: Survey, interview, prototype, data analysis
2. Target participants: How many, which segments
3. Key questions to answer
4. Success criteria: What would validate the problem
5. Failure criteria: What would invalidate it
6. Timeline and resource requirements
7. How to analyze results
```

## Decision Making

### Generating Decision Criteria

```
Generate decision criteria for evaluating this problem:

Problem: "[problem statement]"

Create a decision rubric with:
1. Must-have criteria (deal-breakers if missing)
2. Weighted criteria (importance 1-10)
3. Scoring guidelines for each criterion
4. Overall scoring formula

Criteria should cover: customer value, business value, feasibility,
strategic fit, and risk.
```

### Risk Analysis

```
Identify risks associated with solving this problem:

Problem: "[problem statement]"

Analyze:
1. Customer risks (will they actually use it?)
2. Technical risks (can we build it reliably?)
3. Market risks (will competitors beat us?)
4. Business risks (ROI, resource allocation)
5. Compliance risks (regulatory challenges)

For each risk, rate likelihood (low/medium/high) and impact, and suggest
mitigation strategies.
```

## MYOB Context

### Financial Domain Problem Definition

When defining problems in financial software:

**Consider:**
- **Compliance first**: Does this problem involve regulatory requirements?
- **Data accuracy**: How critical is precision for this problem?
- **Audit requirements**: Will the solution need audit trails?
- **Regional variations**: Does the problem differ by country/market?

**Example MYOB-Specific Prompts:**

```
Refine this problem statement for the Australian small business market:

Draft: "Businesses struggle with tax compliance"

Consider:
- BAS vs IAS vs Annual tax returns
- GST-registered vs non-GST businesses
- PAYG obligations vs no employees
- Different business structures (sole trader, partnership, company)
```

### Integration with MYOB Discovery Frameworks

Link AI analysis to existing MYOB processes:

- **Opportunity Assessment Template**: Use AI to populate sections
- **Business Case Development**: AI generates initial analysis for review
- **Stakeholder Alignment**: AI summarizes insights for different audiences

**Note:** AI-generated analysis supplements (doesn't replace) MYOB's formal discovery documentation.

## Practical Prompts

### Problem Statement Refinement

```
Improve this problem statement by making it more specific and measurable:

Current: "[vague problem statement]"

Enhanced version should include:
1. Specific customer segment
2. Measurable impact or frequency
3. Root cause analysis
4. Current alternatives and their limitations
5. What success would look like
```

### Opportunity Prioritization

```
Rank these 5 problem opportunities by total value potential:

Problems:
1. "[problem 1]"
2. "[problem 2]"
3. "[problem 3]"
4. "[problem 4]"
5. "[problem 5]"

For each, estimate:
- Customer value (willingness to pay, usage frequency)
- Business value (revenue, retention, competitive advantage)
- Strategic value (platform benefits, data opportunities)

Provide ranking with justification.
```

### Validation Planning

```
Create a validation plan for this problem hypothesis:

Hypothesis: "[problem statement]"

Plan should include:
1. What we need to validate (problem exists, severity, willingness to pay)
2. Validation methods (interviews, surveys, data analysis, prototypes)
3. Target participants and sample sizes
4. Timeline (2 weeks recommended for lean validation)
5. Success metrics
6. Resources required
7. Decision criteria (what results mean go vs no-go)
```

## Best Practices

### Do:
- Iterate problem statements multiple times
- Use AI to challenge your assumptions
- Apply multiple prioritization frameworks
- Validate AI analysis with customer data
- Document decision criteria before analysis
- Include quantitative and qualitative factors

### Don't:
- Skip customer validation in favor of AI analysis
- Trust AI market sizing without verification
- Use AI scores as the sole decision input
- Forget regional and compliance considerations
- Rush to solution ideas during problem definition
- Include sensitive business strategy in prompts

## Transition to Solution Discovery

Once the problem is well-defined and validated:

1. **Document Decision**: Problem statement, validation results, prioritization rationale
2. **Align Stakeholders**: Get buy-in on the problem to solve
3. **Proceed to Solution Discovery**: [AI for Solution Discovery](ai-for-solution-discovery.md)

---

**Previous:** [← AI for Problem Discovery](ai-for-problem-discovery.md) | **Next:** [AI for Solution Discovery →](ai-for-solution-discovery.md)

---


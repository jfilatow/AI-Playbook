---
title: AI for Solution Discovery
---

![MYOB Banner](../../assets/images/myob-banner.png)

# AI for Solution Discovery

## Overview

Solution Discovery is the first phase of the second diamond, where teams **diverge** to explore many possible solutions to the defined problem. The goal is creative exploration without premature convergence on a single approach.

AI tools can significantly accelerate ideation, prototyping concepts, and analyzing solution approaches. However, human creativity, technical feasibility judgment, and customer insight remain irreplaceable.

## Table of Contents

- [Solution Ideation with AI](#solution-ideation-with-ai)
- [Prototype and Concept Generation](#prototype-and-concept-generation)
- [Customer Feedback Analysis](#customer-feedback-analysis)
- [Technical Feasibility Assessment](#technical-feasibility-assessment)
- [Solution Pattern Research](#solution-pattern-research)
- [MYOB Context](#myob-context)
- [Practical Prompts](#practical-prompts)

## Solution Ideation with AI

Use AI to generate diverse solution concepts quickly, exploring more options than traditional brainstorming allows.

### Divergent Solution Generation

**Generate Many Options:**

```
For this well-defined problem:

"[problem statement]"

Generate 15 different solution approaches ranging from:
1. Incremental improvements (enhance existing features)
2. Moderate innovations (new features using proven patterns)
3. Radical reimagining (completely new approaches)

For each solution, briefly describe:
- Core concept
- Key differentiator
- Implementation complexity (low/medium/high)
- Estimated customer value
```

**Expected Output Style:**
- Mix of realistic and creative options
- Range of effort levels
- Different technology approaches
- Various user experience patterns

### Solution Space Exploration

**Explore Different Dimensions:**

```
Explore solutions to this problem across multiple dimensions:

Problem: "[problem statement]"

Dimension 1 - Technology Approach:
- AI/ML powered
- Rule-based automation
- Manual but streamlined
- Hybrid approach

Dimension 2 - User Experience:
- Fully automated (zero user input)
- Supervised automation (user validates)
- Assisted manual (AI suggests, user decides)
- Enhanced manual (better tools for manual work)

Dimension 3 - Integration Pattern:
- Built into existing workflow
- Standalone new feature
- External integration
- Platform capability

Generate solution concepts exploring different combinations.
```

### Analogous Problem Solutions

```
Find solutions from analogous problems in other domains:

Our problem: "[your financial software problem]"

Find similar problems solved in:
1. Consumer finance apps (personal budgeting, expense tracking)
2. Enterprise software (ERP, CRM automation)
3. Healthcare (compliance, audit trails, accuracy)
4. E-commerce (fraud detection, pattern recognition)

For each analogy:
- How did they solve it?
- What patterns could we adapt?
- What would be different in our context?
```

## Prototype and Concept Generation

AI can help create low-fidelity prototypes and concept descriptions quickly.

### User Story Generation

```
Generate user stories for this solution concept:

Solution: "[brief solution description]"
Target users: "[persona description]"

Create 5-10 user stories in format:
"As a [user type], I want to [action], so that [benefit]"

Include:
- Primary happy path stories
- Edge cases and error scenarios
- Different user personas
- Acceptance criteria for each story
```

### Workflow Design

```
Design the user workflow for this solution:

Solution: "[solution concept]"

Create a step-by-step workflow showing:
1. Entry point (how users access the feature)
2. Key steps in the process
3. Decision points and branching
4. Success and error states
5. Exit points

Use a text-based flowchart or numbered list format.
```

### Feature Description Generation

```
Generate a detailed feature description for this solution:

Solution: "[solution concept]"

Include:
1. Feature name and one-line description
2. Problem it solves (link to problem statement)
3. How it works (user perspective)
4. Key benefits (user value proposition)
5. Core capabilities (what it does)
6. Out of scope (what it doesn't do)
7. Success metrics (how we'll measure value)
```

## Customer Feedback Analysis

Analyze customer reactions to solution concepts using AI.

### Feedback Synthesis

After presenting solution concepts to customers:

```
Analyze customer feedback on these 3 solution concepts:

Concept A: "[description]"
Concept B: "[description]"
Concept C: "[description]"

Feedback from 10 customer interviews: "[feedback summary or transcripts]"

Identify:
1. Which concept resonated most and why
2. Common concerns or objections for each
3. Feature requests or variations suggested
4. Willingness to pay indicators
5. Preferred solution ranking with reasoning
```

### Quote Mining and Theme Extraction

```
From these customer feedback sessions about our solution concepts,
extract and organize key quotes:

[Paste anonymized customer feedback]

Categorize quotes by:
1. Strong positive reactions ("I love this!")
2. Concerns and objections ("I worry that...")
3. Feature requests ("What if it could...")
4. Deal-breakers ("I wouldn't use it if...")
5. Willingness to pay signals

For each category, include 3-5 representative quotes.
```

## Technical Feasibility Assessment

Use AI to quickly assess technical feasibility of solution concepts.

### Technology Stack Research

```
Research technology options for implementing this solution:

Solution concept: "[description]"

Requirements:
- Must handle [specific technical requirement]
- Should integrate with [existing systems]
- Performance needs: [latency, throughput]
- Scale requirements: [users, data volume]

Suggest:
1. Technology stack options (3 different approaches)
2. Pros and cons of each
3. Estimated complexity (low/medium/high)
4. Key technical risks for each
5. Recommended approach with justification
```

### Integration Analysis

```
Analyze integration requirements for this solution:

Solution: "[solution concept]"

Current MYOB systems:
- [System 1]: [brief description]
- [System 2]: [brief description]

Identify:
1. Which systems need integration
2. Integration patterns (API, event-driven, batch)
3. Data flow requirements
4. Authentication and authorization needs
5. Potential integration challenges
6. Estimated integration effort
```

### Risk and Constraint Analysis

```
Identify technical risks and constraints for this solution:

Solution: "[solution concept]"

Analyze:
1. Technical risks (what could go wrong?)
2. Performance constraints (speed, scale limitations)
3. Data constraints (availability, quality, privacy)
4. Infrastructure constraints (compute, storage, cost)
5. Skill constraints (team capabilities needed)
6. Third-party dependencies and risks

Rate each risk (low/medium/high) and suggest mitigations.
```

## Solution Pattern Research

Learn from existing solution patterns and best practices.

### Design Pattern Research

```
Research UI/UX patterns for this type of solution:

Solution type: "[e.g., automated expense categorization]"

Find and describe:
1. Common UX patterns used by successful products
2. Best practices from industry leaders
3. Anti-patterns to avoid
4. Accessibility considerations
5. Mobile vs desktop considerations
6. Examples from financial software specifically
```

### Technical Architecture Patterns

```
Suggest architecture patterns for this solution:

Solution: "[technical solution description]"

Consider patterns like:
- Microservices vs monolith
- Event-driven vs request-response
- Batch vs real-time processing
- Client-side vs server-side processing

For each viable pattern:
- When to use it
- Pros and cons for this solution
- Examples of successful implementations
- MYOB precedents if any
```

## MYOB Context

### Financial Software Solution Discovery

When exploring solutions for financial software:

**Unique Considerations:**

**Compliance and Regulatory:**
- Solutions must handle regulatory requirements correctly
- Audit trails and data accuracy are non-negotiable
- Regional compliance variations matter (AU vs NZ)
- ATO (Australia) and IRD (New Zealand) requirements differ

**Data Security:**
- Financial data protection must be built-in, not added later
- Encryption, access controls, and audit logging required
- Customer trust is paramount

**Integration Requirements:**
- Must integrate with MYOB platform and ecosystem
- Banking integrations often required
- Accounting standards (GAAP, IFRS) may apply

**Example MYOB Solution Prompt:**

```
Generate solution concepts for automating GST calculation in expense management:

Requirements:
- Must comply with Australian GST rules
- Handle mixed GST and non-GST transactions
- Support GST-registered and non-registered businesses
- Generate audit trail for ATO compliance
- Integrate with existing MYOB invoice and receipt capture

Generate 5 solution concepts with different automation levels and UX approaches.
```

### Solution Exploration Example

```
For this MYOB problem: "Accountants managing multiple clients waste hours
manually consolidating financial data for advisory conversations"

Explore solutions across these dimensions:
1. Automation level: Fully automated vs AI-assisted vs enhanced manual
2. Delivery model: In MYOB app vs separate dashboard vs mobile app
3. Data aggregation: Real-time vs scheduled vs on-demand
4. Visualization: Standard reports vs custom dashboards vs AI insights
5. Collaboration: Solo accountant vs shared with client

Generate 3-5 solution concepts exploring different combinations.
```

## Practical Prompts

### Solution Concept Generation

```
Generate solution concepts for:

Problem: "[problem statement]"

Constraints:
- Budget: [small/medium/large]
- Timeline: [weeks to deliver]
- Team size: [number of people]
- Technical capability: [existing tech stack]

Generate 10 solution concepts, each with:
- One-sentence description
- Key innovation or differentiator
- Estimated effort (S/M/L)
- Expected customer value (Low/Medium/High)
- Main technical risk
```

### User Experience Ideation

```
Generate UX concepts for this solution:

Solution: "[solution description]"

For each UX concept, describe:
1. User interface approach (conversational, dashboard, forms, etc.)
2. Interaction pattern (proactive vs reactive, guided vs freeform)
3. Information architecture (how data is organized)
4. Feedback mechanisms (how users know it worked)
5. Error handling approach (how failures are communicated)

Generate 3 distinctly different UX approaches.
```

### Solution Comparison

```
Compare these solution concepts across key dimensions:

Concept A: "[description]"
Concept B: "[description]"
Concept C: "[description]"

Create comparison table for:
| Dimension | Concept A | Concept B | Concept C |
|-----------|-----------|-----------|-----------|
| Customer value | | | |
| Implementation effort | | | |
| Technical risk | | | |
| Time to market | | | |
| Differentiation | | | |
| Scalability | | | |

Recommend which to pursue and why.
```

## Best Practices

### Do:
- Generate many options before evaluating
- Explore unconventional approaches
- Use AI to challenge assumptions
- Combine multiple solution concepts
- Validate concepts with customers early
- Document solution exploration process

### Don't:
- Converge too quickly on first "good" idea
- Let AI limit your creative thinking
- Skip customer feedback on concepts
- Ignore technical feasibility entirely
- Include proprietary solution details in public AI prompts
- Forget compliance and security in solution concepts

## When NOT to Use AI

AI isn't appropriate for:
- Creating truly novel solution concepts (AI suggests patterns, not innovation)
- Understanding emotional customer reactions to concepts
- Assessing organizational readiness for change
- Making strategic product bets
- Design decisions requiring deep domain expertise

Use AI to generate options, humans to evaluate and decide.

## Transition to Solution Validation

After exploring many solutions, move to validation:

1. **Select Top Concepts**: Narrow to 2-3 most promising solutions
2. **Prepare for Validation**: Design experiments to test concepts
3. **Proceed to**: [AI for Solution Validation](ai-for-solution-validation.md)

---

**Previous:** [← AI for Problem Definition](ai-for-problem-definition.md) | **Next:** [AI for Solution Validation →](ai-for-solution-validation.md)

---


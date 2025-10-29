---
title: AI Development Frameworks - Practical Guide
---

![MYOB Banner](../../assets/images/myob-banner.png)

# AI Development Frameworks - Practical Guide

## Overview

AI development frameworks provide structured approaches to building AI-enhanced applications. This guide focuses on practical frameworks that help MYOB developers deliver better software faster, with emphasis on GitHub SpecKit for spec-driven development.

This is a practical guide focused on **using** these frameworks, not building custom AI applications from scratch. For deep AI engineering, see [AI Development Frameworks](ai-development-frameworks.md).

## Table of Contents

- [GitHub SpecKit Deep Dive](#github-speckit-deep-dive)
- [Framework Comparison](#framework-comparison)
- [Integration Best Practices](#integration-best-practices)
- [MYOB-Specific Patterns](#myob-specific-patterns)

## GitHub SpecKit Deep Dive

### What is SpecKit?

**GitHub SpecKit** is a framework for Spec-Driven Development (SDD) that inverts the traditional development process:

**Traditional Development:**
```
Requirements → Code → Tests → Documentation
```

**Spec-Driven Development:**
```
Natural Language Spec → Validated Spec → AI-Generated Code + Tests + Docs
```

The specification becomes the primary artifact, with code generated as the expression of that specification.

### Why Use SpecKit?

**Benefits:**
- **Clarity**: Specifications are clearer than code for understanding requirements
- **AI-Optimized**: Designed specifically for AI coding agents
- **Verifiable**: Automated checklists ensure specs are complete
- **Maintainable**: Update specs, regenerate code when requirements change
- **Collaborative**: Non-technical stakeholders can understand and validate specs

**Best for:**
- Complex features with detailed requirements
- Team projects needing clear specifications
- Compliance-heavy features (financial calculations, tax logic)
- Features requiring extensive documentation
- Projects with changing requirements

**Not ideal for:**
- Simple, obvious features (specification overhead not worth it)
- Exploratory prototypes (spec too rigid for experimentation)
- One-off scripts or utilities
- Features with unclear requirements (discover first, then spec)

### Quick Start with SpecKit

#### Installation

```bash
# Install the SpecKit CLI globally
npm install -g @github/spec-kit

# Or use with npx (no installation)
npx @github/spec-kit init
```

#### Initialize in Your Project

```bash
# Navigate to your project
cd your-project

# Initialize SpecKit
specify init

# This creates:
# - .speckit/ directory with templates
# - .speckit/constitution.md (project principles)
# - .speckit/specs/ directory for specifications
```

#### SpecKit Workflow

**Step 1: Establish Constitution** (Project Principles)

Run in your AI tool (Cursor, etc.):
```
/speckit.constitution

Create project constitution for: [your project name]

Include:
- Technology stack (TypeScript, React, Node.js, etc.)
- Code standards (MYOB coding standards, linting rules)
- Testing requirements (Jest, >80% coverage)
- Security requirements (authentication, data protection)
- Compliance needs (financial regulations, audit trails)
```

**Step 2: Create Specification**

```
/speckit.specify

Feature: Automated GST calculation for expenses

Create detailed specification including:
- User stories and acceptance criteria
- Data models and schemas
- Business logic rules (Australian GST rules)
- Edge cases and error handling
- Security requirements (audit trail)
- Performance requirements
- Integration points (invoice system, reporting)
```

**Step 3: Validate Specification**

SpecKit generates a validation checklist:
- [ ] User stories complete with acceptance criteria
- [ ] Data models defined
- [ ] Business logic specified
- [ ] Error handling covered
- [ ] Security requirements included
- [ ] Performance criteria stated

**Step 4: Generate Implementation Plan**

```
/speckit.plan

From the validated specification, create technical implementation plan:
- Architecture approach
- File structure
- Implementation sequence
- Testing strategy
- Deployment considerations
```

**Step 5: Generate Tasks**

```
/speckit.tasks

Break down implementation plan into actionable tasks:
- Create task list for development
- Estimate effort for each task
- Identify dependencies
- Assign priority
```

**Step 6: Implement**

```
/speckit.implement

Implement [feature name] according to specification and plan.

Generate:
- Production code
- Unit tests
- Integration tests
- Documentation
```

### Customizing SpecKit for MYOB

#### MYOB Financial Domain Templates

Create MYOB-specific SpecKit templates for common feature types:

**Template: Financial Calculation Feature**

```markdown
# Specification: [Feature Name]

## Financial Calculation Requirements

### Calculation Logic
- Formula: [precise mathematical formula]
- Precision: Decimal to [X] places
- Rounding rules: [rounding methodology]
- Currency handling: [AUD, NZD, etc.]

### Compliance Requirements
- Regulatory standard: [Australian tax law, accounting standard]
- Audit trail: [what to log, retention period]
- Validation requirements: [how to verify correctness]

### Edge Cases
- Zero values
- Negative values
- Maximum amounts
- Currency conversion (if applicable)
- Historical calculation changes (tax rate changes)

### Error Handling
- Invalid inputs
- Calculation overflow
- Missing required data
- External service failures

### Testing Requirements
- Unit tests for formula correctness
- Integration tests with real scenarios
- Regression tests for historical cases
- Performance tests (calculation speed)
```

#### Example: GST Calculation Spec

```markdown
# Specification: Automated GST Calculation

## Overview
Automatically calculate GST (Goods and Services Tax) for Australian business expenses based on transaction details.

## User Stories

1. As a small business owner, I want expenses to be automatically categorized as GST or non-GST so that I can accurately claim GST credits.

2. As an accountant, I want to review and override GST calculations so that I can handle edge cases and ensure compliance.

## Business Logic

### GST Rules (Australia)
- GST rate: 10% (1/11 of gross amount)
- GST-free items: Basic food, certain medical, education
- Input-taxed: Financial services, residential rent
- GST calculation: Amount × 10/110 for GST-inclusive prices

### Calculation Precision
- Use Decimal library (no floating point errors)
- Round to 2 decimal places
- Rounding: Round half up (standard accounting)

## Data Model

```typescript
interface Expense {
  id: string;
  amount: Decimal;
  description: string;
  category: ExpenseCategory;
  gstAmount?: Decimal;
  gstApplicable: boolean;
  gstOverride?: {
    amount: Decimal;
    reason: string;
    overriddenBy: string;
    overriddenAt: Date;
  };
}
```

## Acceptance Criteria

Given an expense of $110 (GST-inclusive)
When GST calculation runs
Then gstAmount should equal $10.00
And net amount should equal $100.00

[Additional criteria...]

## Security & Compliance

- Audit log all GST calculations and overrides
- Retain audit trail for 7 years (ATO requirement)
- User authentication required for overrides
- Role-based access for manual adjustments

## Testing Strategy

- Unit tests: 20+ test cases covering edge cases
- Integration tests: End-to-end expense processing
- Regression tests: Historical expense recalculation
- Performance: Calculate 1000 expenses <1 second
```

### SpecKit with Cursor/AI Tools

**In Cursor Composer:**

1. Create spec file: `.speckit/specs/feature-name.md`
2. Use SpecKit commands in Composer
3. Generate code from validated spec
4. Iterate as needed

**Benefits in Cursor:**
- Composer can read spec and maintain consistency
- Multiple files generated in sync with spec
- Changes to spec trigger code updates
- Spec serves as documentation

### When to Use SpecKit at MYOB

**Use SpecKit for:**
- ✅ Complex financial calculations requiring precision
- ✅ Compliance-heavy features (tax, payroll, reporting)
- ✅ Features with detailed business logic
- ✅ Cross-team features needing clear specifications
- ✅ Features that may change (spec easier to update than code)

**Skip SpecKit for:**
- ❌ Simple CRUD operations
- ❌ UI-only changes without business logic
- ❌ Quick prototypes or experiments
- ❌ Internal tools with simple requirements

## Framework Comparison

### Choosing the Right Framework

| Framework | Purpose | Best For | MYOB Use Cases | Complexity |
|-----------|---------|----------|----------------|------------|
| **GitHub SpecKit** | Spec-driven development | Complex features, compliance | Tax calculations, payroll, reporting | Medium |
| **LangChain** | AI agent chains & workflows | Data processing pipelines | Document processing, data extraction | High |
| **Semantic Kernel** | Enterprise AI integration | AI features in existing apps | Smart suggestions, automation | Medium |
| **AutoGen** | Multi-agent orchestration | Complex autonomous workflows | Multi-step approvals, complex workflows | High |
| **Vercel AI SDK** | AI-powered UIs | Chat interfaces, streaming | Customer support chat, AI assistants | Low-Medium |

### GitHub SpecKit

**When to use:**
- Implementing features with complex business rules
- Need clear specifications before coding
- Team collaboration on feature design
- Compliance requirements need documentation

**MYOB Examples:**
- GST calculation engine
- PAYG withholding calculations
- BAS report generation
- Multi-currency conversion

**Learning curve:** Medium (1-2 days to get productive)

### LangChain

**When to use:**
- Building AI workflows and chains
- Processing documents or data with AI
- Creating AI-powered automation

**MYOB Examples:**
- Invoice data extraction from PDFs
- Receipt categorization pipeline
- Financial document analysis

**Learning curve:** High (1-2 weeks)  
**Note:** Requires understanding of AI concepts (embeddings, vector stores, prompts)

### Semantic Kernel

**When to use:**
- Integrating AI into existing .NET or TypeScript applications
- Enterprise features with AI capabilities
- Skills-based AI architecture

**MYOB Examples:**
- Adding AI insights to existing MYOB features
- Smart expense categorization
- Predictive cash flow analysis

**Learning curve:** Medium (3-5 days with .NET/TS background)

### AutoGen

**When to use:**
- Multi-agent systems with complex interactions
- Autonomous workflows requiring coordination
- Advanced AI orchestration

**MYOB Examples:**
- Complex approval workflows with multiple AI agents
- Automated compliance checking pipelines
- Multi-step document processing

**Learning curve:** High (2-3 weeks)  
**Note:** Advanced framework, requires significant AI architecture knowledge

### Vercel AI SDK

**When to use:**
- Building chat interfaces
- Streaming AI responses in UI
- Simple AI-powered web features

**MYOB Examples:**
- Customer support chat assistant
- AI-powered help in MYOB apps
- Interactive financial advice features

**Learning curve:** Low-Medium (2-3 days with React knowledge)

## Integration Best Practices

### Combining Frameworks

Frameworks can work together:

**SpecKit + LangChain:**
- Use SpecKit to define data processing requirements
- Use LangChain to implement the AI pipeline
- Spec provides contract, LangChain provides implementation

**SpecKit + Semantic Kernel:**
- SpecKit defines the feature specification
- Semantic Kernel provides AI capabilities
- Spec guides what AI skills to build

**Example Combined Workflow:**
```
1. SpecKit: Define "Receipt processing feature" specification
2. LangChain: Build pipeline (OCR → extraction → categorization)
3. SpecKit /implement: Generate integration code
4. Validate: Spec checklist ensures all requirements met
```

### Framework Selection Decision Tree

```
What are you building?

├─ Complex feature with detailed requirements?
│  └─ Use SpecKit (spec-first approach)
│
├─ AI workflow/pipeline for data processing?
│  └─ Use LangChain (if Python/TypeScript) or Semantic Kernel (if .NET)
│
├─ AI-powered chat or conversational UI?
│  └─ Use Vercel AI SDK (simple) or LangChain (complex)
│
├─ Multi-agent system with orchestration?
│  └─ Use AutoGen (advanced) or LangChain (moderate)
│
└─ Adding AI to existing feature?
   └─ Use Semantic Kernel (enterprise integration)
```

### Performance Optimization

**For All Frameworks:**
- Cache AI responses when possible (same input = same output often)
- Use faster models for simple tasks (GPT-4o vs o1)
- Batch API calls where possible
- Implement timeouts and fallbacks
- Monitor costs and usage

**SpecKit-Specific:**
- Reuse validated specs (don't regenerate from scratch)
- Use /speckit.implement selectively (not for entire codebase)
- Cache generated plans and tasks

**LangChain-Specific:**
- Use streaming for better UX
- Implement caching for vector stores
- Optimize chunk sizes for embeddings

## MYOB-Specific Patterns

### SpecKit for Financial Calculations

Financial calculations at MYOB require exceptional precision and compliance:

**Pattern: Decimal-Based Calculation Spec**

```markdown
# Spec: Tax Calculation

## Precision Requirements
- Use Decimal library (import { Decimal } from 'decimal.js')
- NEVER use JavaScript number type for money
- All calculations to 4 decimal places, round final result to 2
- Rounding: Half-up (standard accounting method)

## Audit Trail
- Log all calculation inputs
- Log calculation result
- Log user overrides with justification
- Retain 7 years for ATO compliance

## Validation
- Cross-check with ATO calculators
- Test with known tax scenarios
- Validate against previous year's calculations
- Unit tests for all edge cases
```

**Then use /speckit.implement to generate:**
- TypeScript class using Decimal
- Comprehensive test suite
- Audit logging implementation
- Documentation with compliance notes

### Framework Selection for MYOB Features

**Financial Calculations:**
- Primary: **SpecKit** (precision and compliance critical)
- Alternative: Manual implementation with thorough spec

**Document Processing:**
- Primary: **LangChain** (AI pipelines for extraction)
- Alternative: **Semantic Kernel** (if .NET ecosystem)

**Customer-Facing AI:**
- Primary: **Vercel AI SDK** (simple chat UIs)
- Alternative: **LangChain** (complex conversations)

**Internal Automation:**
- Primary: **Semantic Kernel** (integrate into existing apps)
- Alternative: **AutoGen** (if multi-step workflows)

### Avoiding Common Pitfalls

**Pitfall 1: Over-Engineering**
- Don't use complex frameworks for simple features
- SpecKit overhead not worth it for trivial CRUD
- Start simple, add framework if complexity justifies

**Pitfall 2: Vendor Lock-In**
- Keep business logic separate from framework code
- Use framework for orchestration, not core logic
- Make frameworks swappable if possible

**Pitfall 3: Ignoring Costs**
- AI frameworks can be expensive (API calls add up)
- Monitor costs especially with LangChain/AutoGen
- Set budgets and limits
- Use caching aggressively

**Pitfall 4: Trusting AI-Generated Code Blindly**
- Even with SpecKit, review generated code
- Test thoroughly (specs can have errors too)
- Validate financial calculations manually
- Security review for sensitive features

## SpecKit Examples for MYOB

### Example 1: Expense Categorization

**Specification:**
```markdown
# Spec: AI-Powered Expense Categorization

## Purpose
Automatically categorize business expenses using AI to reduce manual data entry.

## Input
- Expense description (string)
- Merchant name (string)
- Amount (Decimal)
- Transaction date (Date)

## Output
- Primary category (CategoryEnum)
- Subcategory (optional)
- Confidence score (0-100)
- Suggested GST treatment (taxable, GST-free, input-taxed)

## Business Rules
1. If confidence < 80%, flag for manual review
2. Never auto-categorize amounts > $1000 (requires human approval)
3. Learn from user corrections (feedback loop)
4. Maintain audit trail of all categorizations

## Categories
- Office Expenses
- Travel & Accommodation
- Utilities
- Professional Services
- [etc.]

## Edge Cases
- Duplicate descriptions with different categories
- Ambiguous merchants (e.g., "Amazon" could be many things)
- New merchants not in training data
- Foreign currencies
```

**SpecKit Commands:**
```
/speckit.validate → Check spec completeness
/speckit.plan → Generate implementation plan
/speckit.tasks → Create task breakdown
/speckit.implement → Generate TypeScript code + tests
```

### Example 2: Payroll Calculation

**Specification:**
```markdown
# Spec: PAYG Tax Withholding Calculation

## Regulatory Requirements
- Comply with ATO PAYG withholding schedules
- Use current year tax tables (updated annually)
- Support all payment frequencies (weekly, fortnightly, monthly)
- Handle tax-free threshold claims

## Inputs
- Gross payment amount (Decimal)
- Pay frequency (WeeklyConfig | FortnightlyConfig | MonthlyConfig)
- Tax-free threshold claimed (boolean)
- HELP/HECS debt (boolean)
- Medicare levy adjustment

## Calculation Method
- Use ATO withholding formulas exactly
- Reference: ATO Tax Withholding Tables [current year]
- Precision: Calculate to 4 decimals, round to nearest cent
- Validate against ATO examples

## Audit Requirements
- Log calculation: inputs, formula used, result
- Reference tax table version used
- Flag calculations differing from ATO examples
- Retain 7 years minimum

## Testing
- All ATO example scenarios must pass
- Edge cases: Minimum wage, maximum tax bracket, threshold boundaries
- Historical test: Previous year calculations still work
- Regression test: Updates don't break existing calculations
```

## Best Practices

### Spec-First Development with AI

**1. Write Good Specifications**
- Clear, unambiguous language
- Include all business rules
- Specify edge cases and error handling
- Define success criteria and validation

**2. Validate Before Implementing**
- Use SpecKit validation checklists
- Review specs with domain experts
- Test spec completeness (can you implement from this alone?)
- Get stakeholder sign-off on specs

**3. Generate Iteratively**
- Start with /speckit.plan (don't jump to code)
- Review plan before generating code
- Generate in small pieces (one file at a time)
- Validate each piece before continuing

**4. Maintain Specs**
- Update specs when requirements change
- Regenerate affected code from updated specs
- Keep specs in version control
- Review specs during code review

### Framework Integration with MYOB Practices

**Align with MYOB Values:**
- **Small batches**: Use SpecKit for features, not entire systems
- **Continuous delivery**: Spec changes → code changes → deploy quickly
- **Quality**: Specs + generated tests = higher quality

**Integration Points:**
- Store specs in GitHub alongside code
- Reference Jira tickets in specs
- Link specs to Architecture Decision Records (ADRs)
- Include specs in code review process

## Resources

### Official Documentation

- **SpecKit**: [github.com/github/spec-kit](https://github.com/github/spec-kit)
- **LangChain**: [python.langchain.com](https://python.langchain.com)
- **Semantic Kernel**: [learn.microsoft.com/semantic-kernel](https://learn.microsoft.com/en-us/semantic-kernel/)
- **AutoGen**: [microsoft.github.io/autogen](https://microsoft.github.io/autogen/)
- **Vercel AI SDK**: [sdk.vercel.ai](https://sdk.vercel.ai)

### Learning Resources

- **SpecKit Quick Start**: [deepwiki.com/github/spec-kit/quick-start](https://deepwiki.com/github/spec-kit/2.2-quick-start-tutorial)
- **Spec-Driven Development**: Philosophy and methodology articles

### MYOB Resources

- **MYOB AI Frameworks**: Internal Confluence page (link to be added)
- **Framework Approval Status**: Check [MYOB-Approved Tools](../appendix/MYOB-approved-tools.md)

## Next Steps

Ready to use frameworks in your development?

1. **Try SpecKit**: Start with one feature, create a spec
2. **Learn Prompting**: [Prompting Best Practices](../appendix/prompt-library/prompting-best-practices.md)
3. **Set Up MCPs**: [MCP Usage Guide](mcp-usage.md)

---

**Previous:** [← Context Engineering](context-engineering-spec-driven-development.md) | **Next:** [MCP Usage →](mcp-usage.md)

---


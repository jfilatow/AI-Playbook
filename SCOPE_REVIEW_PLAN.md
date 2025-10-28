# AI Playbook Scope Review & Refactoring Plan

**Date:** October 28, 2025  
**Purpose:** Refocus repository from "Technology Codex with AI" to "AI SDLC Playbook for delivery teams"  
**Status:** PLANNING - Awaiting approval before execution

---

## Executive Summary

### Current State
The repository contains a mix of:
- ✅ **AI-specific delivery guidance** (intended scope)
- ❌ **Deep technical standards** (belongs in Architecture Codex)
- ❌ **General SDLC practices** (not AI-specific)
- ❌ **Infrastructure/platform standards** (out of scope)

### Target State
**AI Playbook should be:**
- A practical guide for delivery teams learning to work with AI
- Focused on AI tooling, prompting, and acceleration techniques
- References (not duplicates) Architecture Codex for technical standards
- Lightweight and accessible for all skill levels

---

## Scope Definition

### ✅ IN SCOPE: What to Keep/Enhance

#### 1. AI Tooling & Resources
- **Getting Started** - AI tool setup, training, mindset
- **AI-Specific Feature Development** - Context engineering, prompt engineering, AI frameworks
- **Prompt Library** - Practical prompts for common tasks
- **Rules for AI** - Cursor rules, AI IDE configuration
- **Approved Tools** - AI tool guidance and governance

#### 2. AI-Accelerated SDLC
- **Requirements Generation with AI** - Using AI to create user stories, technical specs
- **Test Generation with AI** - AI-assisted testing strategies
- **Documentation with AI** - AI-powered documentation generation
- **Refactoring with AI** - AI-assisted code improvement

#### 3. Responsible AI Practices
- **Ethics** - Responsible use of AI tools
- **Security for AI** - Specific AI security concerns (prompt injection, data leakage)
- **Sustainability** - Environmental impact of AI usage
- **Data Privacy with AI** - Handling sensitive data in AI contexts

### ❌ OUT OF SCOPE: What to Remove/Reference

#### 1. General API Standards (23+ files) ⚠️ REMOVE SECTION
**Why:** These are technical architecture standards, not AI-specific
- `/pages/apis/api-design/` - REST API design principles
- `/pages/apis/api-security/` - General API security (not AI-specific)
- `/pages/apis/api-observability/` - Monitoring/logging standards
- `/pages/apis/api-discoverability/` - API documentation standards

**Action:** Replace with single page: "Using AI to Design and Document APIs"
**References:** Link to Architecture Codex for actual API standards

#### 2. Deep Technical Standards ⚠️ REMOVE SECTION
**Why:** These belong in Architecture Codex, not delivery playbook
- `/pages/standards/` - Engineering standards, security requirements
- Deep technical requirements in `.cursorrules`

**Action:** Create lightweight "Integration with MYOB Standards" page that references Codex
**Keep:** Security concerns specific to AI (prompt injection, model security)

#### 3. General Delivery Practices (20 files) ⚠️ SIMPLIFY/REFOCUS
**Why:** These aren't AI-specific; general SDLC practices
- `/pages/delivery/` - CI/CD, trunk-based dev, pair programming, feature toggles

**Current:** 20 files of general delivery practices
**Action:** Replace with "AI-Enhanced Delivery Practices" (3-5 pages)
  - How AI accelerates CI/CD
  - Using AI for code review
  - AI-assisted testing strategies
  - References to Codex for baseline practices

#### 4. Data Products (5 files) ⚠️ REMOVE SECTION
**Why:** Data product architecture, not AI delivery guidance
- `/pages/data/` - Data product certification, design, identification

**Action:** Remove entirely or create single page "Using AI for Data Analysis"
**References:** Link to Data Product documentation if needed

#### 5. Cloud Operations (4 files) ⚠️ REMOVE SECTION
**Why:** Cloud platform standards, not AI-specific
- `/pages/cloud/` - Cloud operating models, account responsibilities

**Action:** Remove section
**Alternative:** Single page "AI Tools in Cloud Environments" if relevant

#### 6. Governance Frameworks (12 files) ⚠️ SIMPLIFY DRASTICALLY
**Why:** Organizational processes, not delivery guidance
- `/pages/governance/` - ADR process, RFC process, architecture principles

**Action:** Replace with "AI Governance Light" (1-2 pages)
  - When to use AI vs not
  - Getting approval for AI tools
  - AI experiment governance
**References:** Link to Codex for architecture governance

#### 7. Operations (8 files) ⚠️ SIMPLIFY/REFOCUS
**Why:** General operations, not AI-specific
- `/pages/operations/` - Logging, monitoring, incident management

**Action:** Replace with "Observing AI-Enhanced Systems" (2-3 pages)
  - Monitoring AI tool usage
  - Logging AI decisions
  - AI-specific operational concerns

---

## Detailed Analysis by Section

### Section 1: APIs & Integration (REMOVE)

**Current:** 26 files, 23 substantive API guidance docs

**Files to Remove:**
```
/pages/apis/
├── api-design/ (5 files) - REST principles, design patterns
├── api-security/ (10 files) - Authentication, authorization, OWASP
├── api-observability/ (6 files) - Monitoring, logging, tracing
├── api-discoverability/ (2 files) - Documentation, cataloging
├── api-testing.md - API testing strategies
├── documentation.md - API documentation
└── README.md - API overview
```

**Replacement:** Single page (1 file)
```
/pages/feature-development/ai-for-apis.md
```

**Content:**
- Using AI to design API contracts
- AI-generated API documentation
- AI-assisted API testing
- Links to Architecture Codex for API standards

**Justification:**
- API design principles don't change with AI
- These are architecture standards, not delivery practices
- Duplicates content that should be in Architecture Codex
- Delivery teams need "how to use AI for APIs", not "how to design APIs"

---

### Section 2: Standards (REMOVE/REPLACE)

**Current:** 4 files of technical standards

**Files to Remove:**
```
/pages/standards/
├── engineering.md - Engineering standards codes
├── security.md - Security requirements (175 lines)
├── glossary.md - Technical glossary (299 lines)
└── README.md
```

**Replacement:** 2 files
```
/pages/ai-integration/
├── working-with-standards.md - How to reference Codex standards
└── ai-security-specific.md - AI-specific security (prompt injection, etc.)
```

**Content for working-with-standards.md:**
- Link to MYOB Architecture Codex
- How to find relevant standards
- When to consult Architecture team
- AI tools to help understand standards

**Content for ai-security-specific.md:**
- Prompt injection risks
- Data leakage through AI tools
- Model security considerations
- Secure prompting practices
- References to general security standards

**Keep from Current:**
- AI-specific security concerns
- Glossary entries related to AI (move to appendix)

---

### Section 3: Delivery (SIMPLIFY)

**Current:** 20 files of general SDLC practices

**Files to Remove:**
```
/pages/delivery/
├── build-security-in.md
├── change-management.md
├── code-review.md
├── configuration-management.md
├── continuous-delivery.md
├── continuous-deployment.md
├── continuous-integration.md
├── data-and-schema-management.md
├── defect-triage.md
├── feature-toggles.md
├── infrastructure-as-code.md
├── pair-programming.md
├── quality-strategy.md
├── release-management.md
├── software-deployment.md
├── test-environments.md
├── testing-strategy.md
├── trunk-based-development.md
└── principles.md
```

**Replacement:** 4-5 files focused on AI enhancement
```
/pages/feature-development/ (merge into existing)
├── ai-assisted-code-review.md - Using AI for code review
├── ai-testing-acceleration.md - AI test generation & execution
├── ai-ci-cd-enhancement.md - AI in pipelines
└── delivery-with-ai.md - AI-enhanced delivery overview
```

**Content:**
- How AI accelerates code review (not code review practices)
- Using AI to generate tests (not testing strategy)
- AI in CI/CD pipelines (not CI/CD setup)
- References to Codex for baseline practices

**Keep Concept, Change Focus:**
- Pair programming → "Pair programming with AI"
- Code review → "AI-assisted code review"
- Testing strategy → "AI-enhanced testing"

---

### Section 4: Data Products (REMOVE)

**Current:** 5 files on data product architecture

**Files to Remove:**
```
/pages/data/
├── data-product.md
├── identifying-data-products.md
├── designing-data-product.md
├── data-product-certification.md
└── README.md
```

**Replacement:** None or optional single page
```
/pages/feature-development/ai-for-data-analysis.md (optional)
```

**Justification:**
- Data product architecture is not AI delivery guidance
- Belongs in Architecture/Data governance documentation
- Not relevant to delivery teams learning AI tools
- If kept, focus only on "Using AI to analyze data" not "designing data products"

---

### Section 5: Cloud (REMOVE)

**Current:** 4 files on cloud operations

**Files to Remove:**
```
/pages/cloud/
├── account-responsibilities.md
├── cloud-operating-model.md
├── running-our-systems.md
└── README.md
```

**Replacement:** None

**Justification:**
- Cloud platform standards, not AI delivery
- Belongs in Infrastructure/Cloud documentation
- No AI-specific content
- Delivery teams use cloud, don't define cloud strategy

---

### Section 6: Governance (SIMPLIFY DRASTICALLY)

**Current:** 12 files on architecture governance

**Files to Remove/Simplify:**
```
/pages/governance/
├── architecture-decision-record.md
├── architecture-principles.md
├── decision-framework.md
├── discovery-and-delivery.md
├── light-on-the-hill.md
├── production-readiness.md
├── rfc-process.md
├── solution-design/ (2 files)
├── technical-system-ownership.md
├── using-open-source-code.md
└── README.md
```

**Replacement:** 1-2 files
```
/pages/ai-integration/
├── ai-governance-light.md - Lightweight governance for AI usage
└── experimenting-with-ai.md - Running AI experiments safely
```

**Content:**
- When to use AI (vs when not to)
- Getting approval for new AI tools
- Running AI experiments
- Measuring AI impact
- References to full governance framework in Codex

---

### Section 7: Operations (SIMPLIFY/REFOCUS)

**Current:** 8 files on general operations

**Files to Simplify:**
```
/pages/operations/
├── cost-management.md
├── incident-management.md
├── logging.md
├── monitoring.md
├── run-books.md
├── system-health.md
├── system-lifecycle.md
├── YBIYRI.md (You Build It You Run It)
└── README.md
```

**Replacement:** 2-3 files
```
/pages/ai-integration/
├── observing-ai-systems.md - Monitoring AI tool usage
└── ai-operations.md - Operating systems with AI assistance
```

**Content:**
- Monitoring AI API usage/costs
- Logging AI decisions for audit
- Incident response with AI assistance
- References to general operations standards

---

## Recommended Structure After Refactor

```
AI Playbook/
├── README.md (updated focus)
│
├── Getting Started/
│   ├── README.md
│   ├── workflow.md
│   ├── the-four-pillars.md
│   ├── ai-working-mindset.md
│   ├── ai-first-mindset.md
│   ├── project-setup.md (AI tools)
│   ├── mcp-servers-setup.md
│   ├── ai-training-programs.md
│   ├── stakeholder-engagement.md
│   └── self-service-capabilities.md
│
├── Responsible Practices/
│   ├── README.md
│   ├── ethics.md (AI-specific)
│   ├── security.md (AI-specific: prompt injection, data leakage)
│   ├── sustainability.md (AI environmental impact)
│   └── data-privacy-security.md (AI data handling)
│
├── Generating Requirements with AI/
│   ├── README.md
│   ├── product-requirements.md (using AI)
│   └── technical-requirements.md (using AI)
│
├── Feature Development with AI/
│   ├── README.md
│   ├── context-engineering-spec-driven-development.md ✅
│   ├── ai-powered-features.md ✅
│   ├── ai-development-frameworks.md ✅
│   ├── ai-agent-orchestration.md ✅
│   ├── development.md (AI-assisted coding)
│   ├── test-driven-development.md (AI-assisted)
│   ├── testing.md (AI test generation)
│   ├── refactoring.md (AI-assisted)
│   ├── documentation.md (AI-generated)
│   ├── continuous-improvement.md (with AI)
│   ├── ai-for-apis.md (NEW - AI for API work)
│   ├── ai-assisted-code-review.md (NEW)
│   ├── ai-testing-acceleration.md (NEW)
│   └── delivery-with-ai.md (NEW - overview)
│
├── AI Integration & Governance/ (NEW SECTION)
│   ├── README.md
│   ├── working-with-standards.md (referencing Codex)
│   ├── ai-security-specific.md (AI security only)
│   ├── ai-governance-light.md (lightweight governance)
│   ├── experimenting-with-ai.md
│   ├── observing-ai-systems.md (monitoring AI)
│   └── ai-operations.md (operating with AI)
│
└── Appendix/
    ├── README.md
    ├── prompt-library/ (19 files) ✅ KEEP
    ├── rules-for-ai/ (4 files) ✅ KEEP
    ├── MYOB-approved-tools.md ✅ KEEP
    ├── ai-glossary.md (AI terms only)
    ├── case-studies.md
    ├── CONTRIBUTING.md
    └── codex-references.md (NEW - links to Architecture Codex)
```

---

## Files to Remove (Summary)

### High Priority Removal (Out of Scope)
1. **APIs Section** - 26 files → Replace with 1 AI-focused page
2. **Standards Section** - 4 files → Replace with 2 AI-specific pages
3. **Data Section** - 5 files → Remove entirely
4. **Cloud Section** - 4 files → Remove entirely

### Medium Priority (Simplify/Refocus)
5. **Delivery Section** - 20 files → Simplify to 4-5 AI-enhanced pages
6. **Governance Section** - 12 files → Simplify to 2 pages
7. **Operations Section** - 8 files → Simplify to 2-3 AI-focused pages

### Total Reduction
- **Current:** ~82 substantive content files
- **After Refactor:** ~45-50 files (40% reduction)
- **Focus Shift:** From "general SDLC + AI" to "AI-enabled delivery"

---

## Migration Strategy

### Phase 1: Analysis & Planning (CURRENT)
- [x] Review all sections
- [x] Identify out-of-scope content
- [x] Create refactoring plan
- [ ] Get stakeholder approval

### Phase 2: Create Replacement Content
- [ ] Write new AI-focused pages
- [ ] Create "References to Codex" navigation
- [ ] Update Getting Started for new structure
- [ ] Create AI Integration & Governance section

### Phase 3: Remove Out-of-Scope Content
- [ ] Remove APIs section (archive or move to Codex)
- [ ] Remove Standards section (link to Codex)
- [ ] Remove Data Products section
- [ ] Remove Cloud section
- [ ] Simplify Delivery to AI-enhanced only
- [ ] Simplify Governance to AI governance
- [ ] Refocus Operations on AI observability

### Phase 4: Update Navigation
- [ ] Update main README
- [ ] Fix all cross-references
- [ ] Update navigation footers
- [ ] Create Codex reference page

### Phase 5: Update Metadata
- [ ] Update repository description
- [ ] Update .cursorrules (remove deep technical standards)
- [ ] Update comparison documents
- [ ] Create migration notes

---

## Content Preservation Options

### Option 1: Archive Removed Content
Create `/archive/` directory for removed content:
```
/archive/
├── apis/
├── standards/
├── data/
├── cloud/
└── ARCHIVE_README.md (explains what's archived and why)
```

### Option 2: Contribute to Architecture Codex
Offer removed content to Architecture Codex team:
- API standards
- Technical standards
- Data product guidance
- Cloud operations

### Option 3: Delete Entirely
Remove content completely if:
- Already exists in Codex
- Out of date
- Not valuable for preservation

---

## Key Decisions Needed

### Decision 1: Archive or Delete?
**Question:** Should we archive removed content or delete it?

**Recommendation:** Archive initially, then delete after 6 months if not needed

### Decision 2: Gradual or Big Bang?
**Question:** Remove gradually or all at once?

**Recommendation:** Big bang with clear migration guide
- Less confusing for users
- Clear before/after state
- Easier to communicate change

### Decision 3: New Structure Naming?
**Question:** What to call new consolidated section?

**Options:**
- "AI Integration & Governance"
- "Working with AI at MYOB"
- "AI Standards & Operations"

**Recommendation:** "AI Integration & Governance" (clear, professional)

### Decision 4: .cursorrules Handling?
**Question:** Remove deep technical standards from .cursorrules?

**Options:**
1. Keep as-is (reference for AI agents)
2. Simplify to AI-specific only
3. Move to separate file

**Recommendation:** Simplify to reference Codex + AI-specific concerns only

---

## Success Metrics

### Clarity Metrics
- [ ] Repository purpose is clear from README
- [ ] All content is AI delivery-focused
- [ ] No confusion with Architecture Codex

### Usability Metrics
- [ ] Delivery teams can find AI guidance quickly
- [ ] Onboarding time reduced (survey users)
- [ ] Practical examples for common tasks

### Scope Metrics
- [ ] 0 files on general API design
- [ ] 0 files on cloud platform standards
- [ ] 0 files on data product architecture
- [ ] All files related to AI usage or delivery

---

## Communication Plan

### Stakeholders to Notify
1. **Delivery Teams** - Primary users
2. **Architecture Team** - May want removed content
3. **AI CoE** - Governance alignment
4. **Repository Contributors** - Active contributors

### Communication Messages

**To Delivery Teams:**
> We're refocusing the AI Playbook on practical AI delivery guidance. Technical standards are moving to the Architecture Codex where they belong. This makes the Playbook lighter, clearer, and more focused on helping you deliver with AI.

**To Architecture Team:**
> We're removing general technical standards from the AI Playbook (APIs, infrastructure, etc.) to avoid duplication with the Architecture Codex. We'd like to contribute this content to the Codex if valuable.

**To AI CoE:**
> We're creating a lightweight AI governance section focused on practical decision-making for delivery teams. This complements (not replaces) formal AI governance frameworks.

---

## Timeline Estimate

### Fast Track (1-2 weeks)
- Week 1: Remove out-of-scope sections, create minimal replacements
- Week 2: Update navigation, test, deploy

### Comprehensive (3-4 weeks)
- Week 1: Create new AI-focused content
- Week 2: Remove/refactor sections with testing
- Week 3: Update all navigation and references
- Week 4: Review, polish, deploy

### Gradual (6-8 weeks)
- Weeks 1-2: Create replacement content
- Weeks 3-5: Remove sections one at a time
- Weeks 6-7: Update navigation and cross-references
- Week 8: Final review and deployment

**Recommendation:** Comprehensive approach (3-4 weeks)

---

## Next Steps

1. **Review this plan** with stakeholders
2. **Get approval** for scope changes
3. **Decide on** removal vs archive strategy
4. **Assign owner** for refactoring work
5. **Set timeline** for completion
6. **Execute** refactoring plan
7. **Communicate** changes to users

---

## Questions for Stakeholders

1. Do you agree with the proposed scope definition?
2. Should we archive or delete removed content?
3. What timeline works best for your team?
4. Who should own the refactoring execution?
5. Any content we're removing that you want to keep?
6. Any AI-specific topics we should add?

---

**Status:** AWAITING APPROVAL  
**Next Action:** Review with stakeholders and get go/no-go decision

---

*Created: October 28, 2025*  
*Author: AI Analysis based on repository review*  
*Purpose: Refocus AI Playbook on delivery guidance, not technical standards*


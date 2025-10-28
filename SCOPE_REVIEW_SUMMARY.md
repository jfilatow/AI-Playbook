# AI Playbook Scope Review - Executive Summary

## The Problem

The repository currently contains a **mix of content**:
- ✅ AI delivery guidance (what we want)
- ❌ General technical standards (belongs in Architecture Codex)
- ❌ Infrastructure/platform standards (out of scope)
- ❌ General SDLC practices (not AI-specific)

This creates confusion about whether this is:
- An AI delivery playbook for teams?
- A technical standards repository?
- A duplicate of the Architecture Codex?

---

## The Solution

**Refocus on**: AI SDLC Playbook for delivery teams

**What this means**:
- Guide teams on **using AI tools** to accelerate delivery
- Show **how AI changes** the SDLC, not define the SDLC itself
- **Reference** (not duplicate) the Architecture Codex for technical standards
- Keep content **practical and actionable** for delivery teams

---

## Content Analysis

### Current State: 82 Content Files

| Section | Files | Scope Status | Action |
|---------|-------|--------------|--------|
| **APIs** | 26 | ❌ Out of scope | Remove (replace with 1 AI-focused page) |
| **Standards** | 4 | ❌ Out of scope | Remove (replace with 2 AI-specific pages) |
| **Data Products** | 5 | ❌ Out of scope | Remove entirely |
| **Cloud** | 4 | ❌ Out of scope | Remove entirely |
| **Delivery** | 20 | ⚠️ Too general | Simplify to 4-5 AI-enhanced pages |
| **Governance** | 12 | ⚠️ Too heavy | Simplify to 2 lightweight pages |
| **Operations** | 8 | ⚠️ Too general | Refocus to 2-3 AI-specific pages |
| **Getting Started** | 10 | ✅ Good | Keep & enhance |
| **Feature Dev** | 11 | ✅ Good | Keep & enhance |
| **Requirements** | 3 | ✅ Good | Keep |
| **Responsible** | 5 | ✅ Good | Keep (AI-focused) |
| **Appendix** | 24 | ✅ Good | Keep |

### Target State: ~45-50 Files (40% reduction)

**Removed**: APIs, Standards, Data, Cloud (39 files)  
**Simplified**: Delivery, Governance, Operations (reduced from 40 to ~10 files)  
**Kept/Enhanced**: Getting Started, Feature Dev, Requirements, Responsible Practices (~35 files)

---

## What Gets Removed

### 🗑️ Complete Section Removals

#### 1. APIs Section (26 files)
**Why:** API design standards belong in Architecture Codex, not delivery playbook

**Removed:**
- API design principles
- API security standards
- API observability
- API discoverability
- API testing strategies

**Replaced with:** Single page "Using AI for API Work" (AI-assisted API design, documentation, testing)

#### 2. Standards Section (4 files)
**Why:** Engineering standards belong in Architecture Codex

**Removed:**
- Engineering standards codes
- Deep security requirements
- Technical glossary (299 lines)

**Replaced with:** 
- "Working with MYOB Standards" (how to reference Codex)
- "AI-Specific Security" (prompt injection, data leakage only)

#### 3. Data Products Section (5 files)
**Why:** Data product architecture, not AI delivery

**Removed:**
- Data product design
- Data product identification
- Data product certification

**Replaced with:** Nothing (or optional "Using AI for Data Analysis" if needed)

#### 4. Cloud Section (4 files)
**Why:** Cloud platform standards, not AI-specific

**Removed:**
- Cloud operating model
- Account responsibilities
- Running systems in cloud

**Replaced with:** Nothing

---

## What Gets Simplified

### ⚠️ Sections to Refocus on AI

#### 5. Delivery Section (20 files → 4-5 files)
**Current:** General SDLC practices (CI/CD, code review, testing, deployment...)

**Change to:**
- How AI **accelerates** code review
- How AI **generates** tests
- How AI **enhances** CI/CD
- Links to Codex for baseline practices

**New Focus:** "AI-Enhanced Delivery" not "How to do delivery"

#### 6. Governance Section (12 files → 2 files)
**Current:** Architecture governance, ADR process, RFC process...

**Change to:**
- Lightweight AI governance (when to use AI, getting approval)
- Running AI experiments safely
- Links to Codex for full governance

**New Focus:** "AI Governance for Teams" not "Architecture Governance"

#### 7. Operations Section (8 files → 2-3 files)
**Current:** General operations (logging, monitoring, incident management...)

**Change to:**
- Monitoring AI tool usage
- Logging AI decisions
- AI-specific operational concerns
- Links to Codex for operations standards

**New Focus:** "Observing AI Systems" not "How to do operations"

---

## What Stays

### ✅ Sections That Are Already Good

- **Getting Started** (10 files) - AI tool setup, training, mindset ✅
- **Feature Development** (11 files) - Context engineering, AI frameworks, AI-powered features ✅
- **Requirements Generation** (3 files) - Using AI for requirements ✅
- **Responsible Practices** (5 files) - AI ethics, security, sustainability ✅
- **Appendix** (24 files) - Prompt library, rules for AI, approved tools ✅

---

## New Proposed Structure

```
AI Playbook/
│
├── 1. Getting Started (10 files) ✅ KEEP
│   └── AI tools, training, mindset, setup
│
├── 2. Responsible Practices (5 files) ✅ KEEP
│   └── AI ethics, security, sustainability, privacy
│
├── 3. Generating Requirements with AI (3 files) ✅ KEEP
│   └── Product & technical requirements using AI
│
├── 4. Feature Development with AI (15 files) ✅ ENHANCE
│   ├── Existing: Context engineering, AI frameworks, orchestration
│   └── New: AI-assisted code review, testing, delivery
│
├── 5. AI Integration & Governance (6-7 files) 🆕 NEW SECTION
│   ├── Working with MYOB standards (references to Codex)
│   ├── AI-specific security
│   ├── Lightweight AI governance
│   ├── Experimenting with AI
│   └── Observing AI systems
│
└── 6. Appendix (24 files) ✅ KEEP
    ├── Prompt library (19 files)
    ├── Rules for AI (4 files)
    ├── MYOB-approved tools
    └── Codex references (new page with links)
```

---

## Impact Analysis

### Before Refactor
- **82 content files**
- **Mixed focus** (AI + general SDLC + architecture standards)
- **Duplicates** Architecture Codex content
- **Confusing** purpose and audience
- **Heavy** for delivery teams to navigate

### After Refactor
- **45-50 content files** (40% reduction)
- **Clear focus** on AI delivery acceleration
- **References** Architecture Codex (no duplication)
- **Clear** purpose: Help teams deliver with AI
- **Lightweight** and accessible

---

## Key Benefits

### For Delivery Teams
✅ **Clearer purpose** - Know this is for AI delivery, not technical standards  
✅ **Faster onboarding** - Less content to wade through  
✅ **More practical** - Focused on using AI tools, not architecture theory  
✅ **Better organized** - AI-specific content grouped logically  

### For Architecture Team
✅ **Less duplication** - Standards live in one place (Codex)  
✅ **Clear ownership** - Codex owns standards, Playbook owns AI delivery  
✅ **Easier maintenance** - One source of truth for standards  

### For Repository
✅ **Focused scope** - "AI SDLC Playbook" not "Everything SDLC"  
✅ **Maintainable** - Less content to keep current  
✅ **Discoverable** - Easier to find relevant AI guidance  

---

## Risks & Mitigations

### Risk 1: Loss of Valuable Content
**Mitigation:** Archive removed content, offer to Architecture Codex team

### Risk 2: Breaking Existing Links
**Mitigation:** Create redirect pages with links to Codex

### Risk 3: User Confusion During Transition
**Mitigation:** Clear communication, migration guide, before/after structure docs

### Risk 4: Incomplete Codex References
**Mitigation:** Create comprehensive "References to Codex" page with all relevant links

---

## Implementation Options

### Option A: Fast Track (1-2 weeks)
- Remove sections quickly
- Minimal replacement content
- Focus on clarity over completeness

**Pros:** Quick win, immediate clarity  
**Cons:** Gaps in content initially

### Option B: Comprehensive (3-4 weeks) ⭐ RECOMMENDED
- Create quality replacement content
- Remove sections systematically
- Update all navigation
- Test thoroughly

**Pros:** Complete, high quality  
**Cons:** Takes longer

### Option C: Gradual (6-8 weeks)
- Remove one section at a time
- Gather feedback between phases
- Iterative approach

**Pros:** Less disruptive, feedback-driven  
**Cons:** Longer period of mixed state

---

## Recommendations

### Primary Recommendations

1. **Approve Scope Change** ✅  
   Refocus on "AI SDLC Playbook for delivery teams"

2. **Remove Out-of-Scope Sections** ✅  
   APIs, Standards, Data, Cloud (39 files)

3. **Simplify General Sections** ✅  
   Delivery, Governance, Operations (reduce from 40 to ~10 files)

4. **Create New AI Integration Section** ✅  
   Lightweight governance, Codex references, AI observability

5. **Use Comprehensive Approach** ✅  
   3-4 week timeline with quality replacement content

### Secondary Recommendations

6. **Archive Removed Content**  
   Keep for 6 months, then delete if not needed

7. **Contribute to Architecture Codex**  
   Offer removed API/standards content to Codex team

8. **Update .cursorrules**  
   Simplify to AI-specific guidance + Codex references

9. **Create Migration Guide**  
   Help users find content in new structure

10. **Communicate Clearly**  
    Explain changes to all stakeholders

---

## Next Steps

### Immediate (This Week)
1. **Review this plan** with key stakeholders
2. **Get approval** for scope changes
3. **Decide on timeline** (1-2 weeks vs 3-4 weeks vs 6-8 weeks)

### Short Term (Next 1-2 Weeks)
4. **Create replacement content** for removed sections
5. **Set up archive** strategy
6. **Draft communication** to users

### Medium Term (Next 3-4 Weeks)
7. **Execute refactoring** (remove, simplify, update)
8. **Test all navigation** and links
9. **Deploy changes** and communicate

### Ongoing
10. **Gather feedback** from delivery teams
11. **Iterate and improve** based on usage
12. **Keep focused** on AI delivery scope

---

## Questions for Discussion

1. **Scope Agreement**: Do you agree with the proposed scope (AI delivery, not technical standards)?

2. **Content Removal**: Comfortable removing APIs, Standards, Data, Cloud sections?

3. **Simplification**: Agree with simplifying Delivery, Governance, Operations to AI-focused only?

4. **Timeline**: Which approach? Fast (1-2 weeks), Comprehensive (3-4 weeks), or Gradual (6-8 weeks)?

5. **Archive Strategy**: Archive removed content or delete immediately?

6. **Codex Relationship**: Should we contribute removed content to Architecture Codex?

7. **Missing Topics**: Any AI delivery topics we should add?

8. **User Communication**: How should we announce and explain the changes?

---

## Conclusion

This refactoring will transform the AI Playbook from a **mixed-purpose repository** into a **focused, practical guide** for delivery teams learning to work with AI.

**Current State:**  
"MYOB Technology Standards + Some AI Stuff"

**Target State:**  
"AI SDLC Playbook: How to Deliver Software with AI Tools"

The change will make the repository **clearer, lighter, and more valuable** for its primary audience: delivery teams adopting AI.

---

**Document:** SCOPE_REVIEW_SUMMARY.md  
**Status:** PLANNING - Awaiting Stakeholder Approval  
**Full Plan:** See [SCOPE_REVIEW_PLAN.md](SCOPE_REVIEW_PLAN.md) for detailed analysis

---

*Created: October 28, 2025*  
*Purpose: Executive summary of AI Playbook refactoring plan*


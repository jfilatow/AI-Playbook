
![](assets/images/myob-banner.png)

# AI Software Development Lifecycle Playbook

**Personal fork by Jerzy Filatow** - Based on MYOB AI Playbook  
**Repository:** https://github.com/jfilatow/AI-Playbook

This playbook is a practical guide for implementing AI-assisted software development workflows. It combines proven SDLC practices with AI-specific guidance, responsible practices, security requirements, and technical best practices to enable safe, efficient, and high-quality AI-powered development.

## About This Fork

This is a personal working copy forked from the [MYOB AI Playbook](https://github.com/MYOB-Technology/MYOB-AI-Playbook), which is the official MYOB AI Delivery Playbook. This fork allows for personal experimentation, customization, and contributions while maintaining connection to the upstream sources.

### Upstream Repositories
- **Origin (This Fork)**: https://github.com/jfilatow/AI-Playbook
- **MYOB Upstream**: https://github.com/MYOB-Technology/MYOB-AI-Playbook
- **DEFRA Reference**: https://github.com/DEFRA/defra-ai-sdlc

### Comparison with DEFRA
A detailed comparison between the MYOB AI Codex and DEFRA AI SDLC is available in:
- **[Full Comparison](MYOB_vs_DEFRA_Comparison.md)** - Comprehensive analysis
- **[Quick Summary](COMPARISON_SUMMARY.md)** - At-a-glance comparison

## Overview

The MYOB AI SDLC Playbook provides comprehensive guidance for the use of artificial intelligence tooling in your software development lifecycle while maintaining MYOB's high standards for security, quality, and governance. Whether you're new to AI development or looking to standardise your team's practices, this playbook offers practical, actionable guidance for every stage of the development process.

## Table of Contents

### 1. [Welcome](README.md)
**Your starting point** - Introduction to AI-assisted development at MYOB and how to navigate this playbook effectively.

### 2. [Responsible Practices](pages/responsible-practices/README.md)
**Foundation for ethical AI use** - Essential principles and practices for using AI tools responsibly, securely, and sustainably.

- **[Ethics for AI Tooling](pages/responsible-practices/ethics.md)** - Core ethical principles for AI tool usage, accountability frameworks, and bias prevention strategies
- **[Sustainability](pages/responsible-practices/sustainability.md)** - Environmental considerations and best practices for sustainable AI development
- **[Security](pages/responsible-practices/security.md)** - Security guidelines for AI tools, vulnerability assessment, and secure coding practices
- **[Data Privacy & Security](pages/responsible-practices/data-privacy-security.md)** - Comprehensive data protection guidelines, privacy controls, and compliance requirements

### 3. [Getting Started](pages/getting-started/README.md)
**Your AI development journey begins here** - Core concepts, tools, and mindset needed for effective AI-assisted development.

- **[Workflow](pages/getting-started/workflow.md)** - Step-by-step AI development workflow from requirements to deployment
- **[The Four Pillars](pages/getting-started/the-four-pillars.md)** - Essential elements for consistent, high-quality AI code generation
- **[Choosing the Right Model](pages/getting-started/choosing-the-right-model.md)** - Quick reference for model selection and Cursor modes
- **[Mindset](pages/getting-started/ai-working-mindset.md)** - Mental frameworks and approaches for effective human-AI collaboration
- **[Project Setup](pages/getting-started/project-setup.md)** - Technical setup, tool configuration, and project initialization
- **[IDE Setup Guides](pages/getting-started/ide-setup/)** - Cursor and GitHub Copilot configuration with MYOB settings
- **[MCP Servers Setup](pages/getting-started/mcp-servers-setup.md)** - Model Context Protocol servers for enterprise integration
- **[AI Training Programs](pages/getting-started/ai-training-programs.md)** - Training resources and skill development pathways
- **[Stakeholder Engagement](pages/getting-started/stakeholder-engagement.md)** - Involving stakeholders in AI development initiatives
- **[AI-first Mindset](pages/getting-started/ai-first-mindset.md)** - Developing an AI-native approach to problem-solving
- **[Self-Service Capabilities](pages/getting-started/self-service-capabilities.md)** - Building autonomous AI-powered development capabilities

### 4. [Discovery](pages/discovery/README.md)
**Product discovery with AI** - Using AI tools to accelerate discovery phases for Product Managers, aligned to MYOB's Double Diamond process.

- **[AI for Problem Discovery](pages/discovery/ai-for-problem-discovery.md)** - Market research, user research synthesis, and problem space exploration with AI
- **[AI for Problem Definition](pages/discovery/ai-for-problem-definition.md)** - Refining problems, opportunity assessment, and prioritization frameworks
- **[AI for Solution Discovery](pages/discovery/ai-for-solution-discovery.md)** - Solution ideation, prototyping, and technical feasibility with AI
- **[AI for Solution Validation](pages/discovery/ai-for-solution-validation.md)** - Validation experiments, feedback analysis, and decision making

### 5. [Generating Requirements](pages/generating-requirements/README.md)
**From ideas to detailed specifications** - Techniques for creating comprehensive requirements using AI assistance.

- **[Product Requirements](pages/generating-requirements/product-requirements.md)** - User stories, acceptance criteria, and functional specifications with AI assistance
- **[Technical Requirements](pages/generating-requirements/technical-requirements.md)** - Architecture diagrams, data models, and technical specifications using AI tools

### 6. [Feature Development](pages/feature-development/README.md)
**Building features with AI assistance** - End-to-end feature development processes using AI tools for coding, testing, and documentation.

- **[Context Engineering and Spec Driven Development](pages/feature-development/context-engineering-spec-driven-development.md)** - Systematic information curation and specification-driven approach
- **[AI-powered Features](pages/feature-development/ai-powered-features.md)** - Developing features that incorporate AI capabilities and services
- **[AI Frameworks Practical](pages/feature-development/ai-frameworks-practical.md)** - GitHub SpecKit and other frameworks for AI-enhanced development
- **[MCP Usage](pages/feature-development/mcp-usage.md)** - Model Context Protocol setup and usage for better AI context
- **[Model Selection](pages/feature-development/model-selection.md)** - Choosing AI models, Cursor Max Mode, and context window management
- **[AI Agents](pages/feature-development/ai-agents.md)** - Background agents, automated PR reviews, and agent automation
- **[Development](pages/feature-development/development.md)** - AI-assisted coding practices, code generation techniques, and quality assurance
- **[Test Driven Development](pages/feature-development/test-driven-development.md)** - TDD methodologies enhanced with AI test generation
- **[Testing](pages/feature-development/testing.md)** - Comprehensive testing strategies using AI
- **[Refactoring](pages/feature-development/refactoring.md)** - AI-assisted code refactoring techniques
- **[Documentation](pages/feature-development/documentation.md)** - Automated documentation generation with AI tools
- **[Continuous Improvement](pages/feature-development/continuous-improvement.md)** - Iterative enhancement processes

### 7. [Appendix](pages/appendix/README.md)
**Supporting resources and references** - Tools, templates, examples, and additional resources to support your AI development journey.

- **[Prompt Library](pages/appendix/prompt-library/README.md)** - Curated collection of effective prompts for various development tasks
- **[Rules for AI](pages/appendix/rules-for-ai/README.md)** - Configuration files and rules for AI development tools
- **[MYOB‑approved AI tools](pages/appendix/MYOB-approved-tools.md)** - Official list of approved AI tools, configurations, and usage guidelines
- **[Architecture Codex References](pages/appendix/architecture-codex-references.md)** - Links to MYOB Architecture Codex for technical standards
- **[Case Studies](pages/appendix/case-studies.md)** - Real-world examples and success stories from AI development projects
- **[Contributing](pages/appendix/CONTRIBUTING.md)** - Guidelines for contributing to and improving this playbook

---

## Playbook Focus and Scope

This playbook is focused exclusively on **using AI tools to accelerate software delivery**. It covers:

✅ **AI tools and techniques** (Cursor, Copilot, MCPs, prompting)  
✅ **AI-assisted workflows** (discovery, requirements, development, testing)  
✅ **AI-specific security** (prompt injection, data leakage prevention)  
✅ **Responsible AI usage** (ethics, privacy, sustainability)

For general technical standards and architecture patterns, see:  
📚 **[MYOB Architecture Codex](pages/appendix/architecture-codex-references.md)** - API design, security standards, CI/CD, operations, data architecture

**What's been archived:** Technical standards content has been moved to [`/archive/`](archive/) and belongs in the Architecture Codex. See [archive/README.md](archive/README.md) for details.

---

## Getting Started

**New to AI development?** Start with:
1. **[Responsible Practices](pages/responsible-practices/README.md)** - Understand AI security and ethics first
2. **[Getting Started](pages/getting-started/README.md)** - Set up your AI tools (Cursor/Copilot, MCPs)
3. **[Choosing the Right Model](pages/getting-started/choosing-the-right-model.md)** - Learn model selection basics

**Product Managers:** Start with [Discovery](pages/discovery/README.md) to use AI in product discovery

**Developers:** Jump to [Feature Development](pages/feature-development/README.md) for AI-assisted coding

---

**Next:** [Responsible Practices →](pages/responsible-practices/README.md)

---

---
title: Architecture Codex References
---

![MYOB Banner](../../assets/images/myob-banner.png)

# Architecture Codex References

## Overview

This AI Playbook focuses specifically on **using AI tools to accelerate software delivery**. For general technical standards, architecture patterns, and platform guidance, refer to the **MYOB Architecture Codex**.

This page provides quick links to relevant Codex sections you'll need while using AI tools.

## Scope Separation

### AI Playbook (This Repository)

**Focus:** How to use AI tools for software delivery

**Contains:**
- AI tool setup and configuration
- Prompting techniques and prompt library
- AI-assisted development workflows
- Discovery with AI for Product Managers
- Model selection and context management
- IDE setup (Cursor, GitHub Copilot)
- AI-specific security (prompt injection, data leakage)
- Responsible AI practices

### MYOB Architecture Codex

**Focus:** Technical standards and architecture patterns

**Contains:**
- API design standards and patterns
- Security requirements (Low Bar, authentication, authorization)
- Data architecture and data products
- Cloud platform standards
- CI/CD and delivery practices
- Operations and observability standards
- Engineering standards and governance

## Quick Reference Guide

### When to Use AI Playbook

Use this playbook when you need:
- ✅ Help setting up Cursor or GitHub Copilot
- ✅ Prompts for common development tasks
- ✅ Guidance on choosing AI models
- ✅ AI tools for discovery and requirements
- ✅ MCP setup and configuration
- ✅ Security guidance for using AI tools
- ✅ How to prevent data leakage to AI

### When to Reference Architecture Codex

Reference the Codex when you need:
- 📚 API design standards (REST, GraphQL, events)
- 📚 Security requirements (authentication, authorization)
- 📚 CI/CD pipelines and deployment standards
- 📚 Database design and schema management
- 📚 Observability standards (logging, monitoring)
- 📚 Cloud platform guidance
- 📚 Data product architecture

## Architecture Codex Links

**Note:** Update these links with actual MYOB Architecture Codex URLs

### API Standards

- **API Design Patterns** - [Link to Codex]
  - REST API design principles
  - GraphQL patterns
  - Event-driven architecture
  - API versioning strategies

- **API Security** - [Link to Codex]
  - Authentication (OAuth, JWT)
  - Authorization patterns
  - Rate limiting and throttling
  - API key management

- **API Observability** - [Link to Codex]
  - Logging standards
  - Metrics and monitoring
  - Distributed tracing
  - Performance benchmarks

### Security Standards

- **Low Bar Security Requirements** - [Link to Codex]
  - Mandatory security baseline
  - Vulnerability scanning
  - Secret management
  - Security testing requirements

- **Information Classification** - [Link to Codex]
  - Data classification levels
  - Handling requirements by classification
  - Access control requirements

- **Security Testing** - [Link to Codex]
  - SAST and DAST requirements
  - Penetration testing
  - Security code review

### Delivery and Operations

- **CI/CD Standards** - [Link to Codex]
  - Pipeline requirements
  - Automated testing standards
  - Deployment strategies
  - Release management

- **Observability** - [Link to Codex]
  - Logging standards (JSON structured logging)
  - Metrics (RED method, SLIs/SLOs)
  - Alerting and on-call
  - Incident management

- **Infrastructure as Code** - [Link to Codex]
  - Terraform standards
  - Configuration management
  - Environment setup

### Data and Cloud

- **Data Architecture** - [Link to Codex]
  - Data modeling standards
  - Database design patterns
  - Data retention policies
  - Data quality requirements

- **Data Products** - [Link to Codex]
  - Data product definition
  - Data product certification
  - Building data products

- **Cloud Standards** - [Link to Codex]
  - Cloud operating model
  - Account responsibilities
  - Cost management

## How AI Tools Help with Codex Standards

### Using AI to Understand Standards

```
Using Glean MCP, search for MYOB API security standards, then:
1. Summarize the key requirements
2. Show me how to implement JWT authentication following those standards
3. Generate code examples that comply
```

### Using AI to Apply Standards

```
Review this code against MYOB's Low Bar Security Requirements.
Specifically check for:
- Secret management (no hardcoded credentials)
- Input validation
- Error handling (no sensitive data in errors)
- Logging (security events logged)
```

### Using AI to Generate Compliant Code

Include standards in prompts:

```
Generate Express.js API endpoint following MYOB API design standards:
- RESTful URL structure
- Standard HTTP status codes (200, 201, 400, 401, 404, 500)
- JSON request/response
- Error response format: { error: string, code: string, details: object }
- Input validation with Joi
- Rate limiting
- Authentication required (JWT)
```

## Integration Patterns

### AI-Assisted Standards Compliance

**Step 1: Find Standard**
```
Search Glean for MYOB database naming conventions
```

**Step 2: Understand Standard**
```
Summarize the MYOB database naming conventions in bullet points
```

**Step 3: Apply Standard**
```
Review this database schema against MYOB naming conventions and suggest corrections
```

**Step 4: Generate Compliant Code**
```
Generate migration script following MYOB conventions
```

### Using MCPs to Access Codex

With Glean MCP configured:
```
@glean Search for MYOB CI/CD pipeline requirements

Then: Create GitHub Actions workflow following those requirements
```

## Common Codex References While Using AI

### For API Development

**Before generating API code:**
1. Search Codex for API design standards
2. Review API security requirements
3. Check API documentation standards

**AI Prompt:**
```
Following MYOB API standards (RESTful design, JSON, standard status codes),
generate an Express endpoint for creating invoices.
```

### For Database Work

**Before schema changes:**
1. Check Codex for data modeling standards
2. Review naming conventions
3. Understand migration requirements

**AI Prompt:**
```
Following MYOB database standards (naming, indexes, audit columns),
generate a Postgres schema for storing expense categories.
```

### For Security Features

**Before implementing auth/security:**
1. Review Low Bar Security Requirements
2. Check authentication patterns
3. Understand audit logging requirements

**AI Prompt:**
```
Following MYOB security standards, implement JWT-based authentication
middleware with proper error handling and audit logging.
```

## Frequently Needed Standards

### Quick Links Table

| I'm working on... | I need Codex guidance on... | AI can help by... |
|-------------------|----------------------------|-------------------|
| New API endpoint | API design, security, observability | Generating compliant code |
| Database schema | Data modeling, naming, migrations | Creating schema following standards |
| Authentication | Security standards, auth patterns | Implementing standard auth |
| CI/CD pipeline | Pipeline requirements, testing | Generating workflow files |
| Logging | Logging standards, JSON format | Adding standard logging |
| New microservice | All of the above | Scaffolding compliant service |

## Getting Help

### Finding Standards in Codex

**Use Glean (via MCP):**
```
Search Glean for [topic] standards
```

**Ask in Slack:**
- #architecture - Architecture and design questions
- #svc-security - Security standards questions
- #platform - Infrastructure and deployment questions

### AI-Assisted Codex Search

```
Using Glean MCP, find MYOB standards related to [topic], then:
1. Summarize key requirements
2. Show examples of compliant implementations
3. Generate code that follows these standards
```

## Next Steps

1. **Set Up Glean MCP**: [MCP Usage Guide](../feature-development/mcp-usage.md)
2. **Learn to Search**: Use Glean to explore Codex content
3. **Apply Standards**: Use AI to implement Codex standards in your code

---

**Previous:** [← MYOB-Approved Tools](MYOB-approved-tools.md) | **Next:** [Case Studies →](case-studies.md)

---


---
title: Model Context Protocol (MCP) Usage Guide
---

![MYOB Banner](../../assets/images/myob-banner.png)

# Model Context Protocol (MCP) Usage Guide

## Overview

Model Context Protocol (MCP) is a standardized protocol that allows AI tools to access external data sources and tools to provide better, more contextualized responses. MCPs dramatically improve AI effectiveness by giving models access to your codebase, documentation, company knowledge, and development tools.

This guide shows you how to set up and use MCPs effectively at MYOB to maximize developer productivity and AI accuracy.

## Table of Contents

- [What are MCPs?](#what-are-mcps)
- [Why MCPs Matter](#why-mcps-matter)
- [MYOB-Approved MCPs](#myob-approved-mcps)
- [Setting Up MCPs](#setting-up-mcps)
- [Using MCPs Effectively](#using-mcps-effectively)
- [Custom Local MCPs](#custom-local-mcps)
- [Troubleshooting](#troubleshooting)

## What are MCPs?

### Definition

**Model Context Protocol (MCP)** is an open standard that enables AI applications to connect to external data sources and tools through a unified interface.

Think of MCPs as plugins that extend your AI tool's knowledge and capabilities:
- **Without MCPs**: AI only knows what's in its training data (outdated, generic)
- **With MCPs**: AI can access your codebase, documentation, company wikis, issue trackers, and more

### How MCPs Work

```
You: "How do we handle authentication in our backend services?"

Without MCP:
AI → Gives generic authentication advice from training data

With GitHub MCP + Glean MCP:
AI → Searches your codebase (GitHub MCP)
   → Searches internal docs (Glean MCP)
   → Returns MYOB-specific authentication patterns
   → References actual code examples from your repositories
```

### Benefits

**Better Accuracy:**
- Responses based on your actual codebase, not generic examples
- Up-to-date information from current documentation
- MYOB-specific patterns and conventions

**Faster Development:**
- No context switching to search documentation manually
- AI finds relevant code examples automatically
- Reduced hallucination with grounded responses

**Improved Context:**
- AI understands your project structure and dependencies
- Access to internal knowledge bases (Confluence, Notion)
- Integration with development tools (Jira, GitHub, GitLab)

## Why MCPs Matter for Developer Productivity

### Context Management Challenges

**Without MCPs**, developers must manually:
- Copy/paste code snippets into AI prompts
- Search documentation and include in context
- Describe system architecture verbally
- Provide background on internal patterns and standards

**With MCPs**, AI automatically:
- Searches your codebase for relevant examples
- Retrieves documentation from Confluence/Glean
- Accesses issue tracker context (Jira tickets)
- Understands your project structure and dependencies

### Productivity Impact

**Time Savings:**
- 50-70% reduction in context gathering time
- Faster onboarding to new codebases
- Quick access to internal knowledge

**Quality Improvement:**
- More accurate AI responses grounded in your actual code
- Fewer hallucinations and incorrect suggestions
- Better alignment with MYOB coding standards

**Knowledge Democratization:**
- Junior developers access senior developer knowledge
- Easy discovery of existing solutions and patterns
- Reduced dependency on tribal knowledge

## MYOB-Approved MCPs

The following MCPs are approved for use at MYOB. For the complete and current list with security review status, always check the **[MYOB MCP Registry on Confluence](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/10925965594)**.

### MCP Approval Status Table

| Server | Vendor/Owner | Hosting | Status | Last Review | Notes |
|--------|--------------|---------|--------|-------------|-------|
| **Atlassian MCP** | Atlassian (official) | Remote | ✅ Approved | 17-Sep-2025 | Jira/Confluence |
| **Glean MCP** | Glean (official) | Remote | ✅ Approved | 17-Sep-2025 | MYOB knowledge base |
| **GitHub MCP** | GitHub (official) | Remote | ❌ Not Approved* | 27-Oct-2025 | *VS Code only |
| **Playwright** | Microsoft (official) | Local | ✅ Approved | 16-Oct-2025 | Browser automation |
| **Context7** | Community | Local | ✅ Approved | 17-Oct-2025 | Code context |
| **Chrome-devtools** | Community | Local | ✅ Approved | 21-Oct-2025 | Browser debugging |
| **Wiz MCP** | Wiz (official) | Remote | ✅ Approved | 28-Oct-2025 | Security scanning |

**Important:** GitHub MCP is only approved for VS Code. Do not use with Cursor or other IDEs.

### Core MCPs for Development

#### 1. **Filesystem MCP**
**What it does:** Provides AI access to your local codebase

**When to use:**
- Understanding project structure
- Finding code examples in your repository
- Analyzing dependencies and imports
- Refactoring across multiple files

**Setup:** Built into Cursor, enabled by default

**Permissions:** Read access to workspace files (respects .cursorignore)

#### 2. **GitHub MCP** ❌ Not Approved (except VS Code)
**What it does:** Searches GitHub repositories, issues, PRs, and discussions

**Approval Status:** 
- ✅ **Approved for VS Code only** (as of 27-Oct-2025)
- ❌ **Not approved for Cursor or other IDEs**

**When to use (VS Code only):**
- Finding code patterns across MYOB repositories
- Researching how features are implemented
- Checking issue history and discussions
- Reviewing PR comments and decisions

**Setup:** Requires GitHub Personal Access Token (PAT)

**Permissions:** Access to repositories your GitHub account can access

**VS Code Configuration:**
```json
{
  "mcpServers": {
    "github": {
      "command": "mcp-server-github",
      "args": [],
      "env": {
        "GITHUB_TOKEN": "your_pat_token_here"
      }
    }
  }
}
```

**For Cursor Users:**
- Use Cursor's built-in GitHub integration instead
- Or use Glean MCP to search MYOB documentation
- Do not use GitHub MCP with Cursor

#### 3. **Glean MCP** ⭐ MYOB-Specific
**What it does:** Searches MYOB's internal Glean knowledge base

**When to use:**
- Finding MYOB-specific documentation and standards
- Accessing Architecture Codex content
- Searching Confluence pages and internal wikis
- Discovering MYOB patterns and conventions

**Setup:** Requires MYOB Glean account and API token

**Permissions:** Access to documents your Glean account can see

**Why it's critical:** Glean contains MYOB's institutional knowledge - architecture decisions, standards, past learnings, and internal documentation.

#### 4. **Atlassian MCP** (Jira/Confluence)
**What it does:** Accesses Jira issues and Confluence pages

**When to use:**
- Understanding requirements from Jira tickets
- Accessing technical documentation on Confluence
- Finding related issues and historical context
- Linking code to requirements

**Setup:** Requires Atlassian API token

**Permissions:** Access to Jira projects and Confluence spaces your account can see

### Specialized MCPs

#### 5. **Brave Search MCP**
**What it does:** Web search for current information

**When to use:**
- Researching new libraries or frameworks
- Finding solutions to error messages
- Checking latest documentation for tools
- Understanding industry trends

**Note:** Use for public information only, not MYOB-specific queries

#### 6. **Postgres/Database MCPs**
**What it does:** Query database schemas (not data!)

**When to use:**
- Understanding database structure
- Generating queries based on schema
- Planning migrations

**⚠️ Security:** Only use with development databases, NEVER production data

## Setting Up MCPs

### Cursor MCP Setup

Cursor has the best MCP integration currently. Here's how to set it up:

#### Step 1: Enable MCP Feature

1. Open Cursor Settings (Cmd+, or Ctrl+,)
2. Go to "Features" → "Model Context Protocol"
3. Enable MCP support (toggle on)

#### Step 2: Configure MCP Servers

MCP configuration is stored in `.cursor/mcp.json` (or similar path depending on OS):

**Mac:** `~/Library/Application Support/Cursor/mcp.json`
**Windows:** `%APPDATA%\Cursor\mcp.json`
**Linux:** `~/.config/Cursor/mcp.json`

**Example Configuration:**
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/Users/yourname/projects"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_your_token_here"
      }
    },
    "glean": {
      "command": "npx",
      "args": ["-y", "@gleam/mcp-server"],
      "env": {
        "GLEAN_API_TOKEN": "your_glean_token_here",
        "GLEAN_INSTANCE": "myob"
      }
    }
  }
}
```

#### Step 3: Get Required Tokens

**GitHub PAT:**
1. Go to GitHub Settings → Developer settings → Personal access tokens
2. Generate new token (classic) with scopes: `repo`, `read:org`, `read:user`
3. Copy token and add to MCP configuration

**Glean API Token:**
1. Log into MYOB Glean instance
2. Go to Settings → API Tokens
3. Generate new token with required scopes
4. Copy token and add to MCP configuration

**Atlassian API Token:**
1. Go to Atlassian Account Settings
2. Create API token
3. Configure with your Atlassian email and token

#### Step 4: Restart Cursor

After configuration:
1. Save `mcp.json` file
2. Restart Cursor completely (Cmd+Q, then reopen)
3. Verify MCPs are loaded: Cursor Settings → MCP Status

### GitHub Copilot MCP Support

GitHub Copilot has limited MCP support currently. For full MCP capabilities, use Cursor or other MCP-compatible editors.

**Alternative for Copilot:**
- Use GitHub Copilot for code completion
- Use Cursor with MCPs for complex queries requiring context
- Combine both tools in your workflow

### Verification

Test that MCPs are working:

```
In Cursor Chat, ask:
"Search our codebase for authentication middleware examples"

If GitHub MCP is working:
→ AI will search repositories and return actual code examples

If not working:
→ AI will give generic authentication advice
```

## Using MCPs Effectively

### Combining Multiple MCPs

MCPs work best when used together to provide rich context:

**Example Workflow: Understanding a Feature**
1. **Glean MCP**: Find internal documentation and architecture decisions
2. **GitHub MCP**: Find related code and implementation examples
3. **Atlassian MCP**: Check Jira tickets for requirements and historical context
4. **Filesystem MCP**: Analyze current local code structure

**Prompt Example:**
```
Using available MCPs:
1. Search Glean for MYOB authentication standards
2. Search GitHub for authentication middleware in our backend services
3. Search Jira for recent authentication-related tickets
4. Analyze my local auth.ts file

Then explain: How should I implement authentication for this new API endpoint?
```

### MCP-Specific Prompts

Be explicit when you want AI to use MCPs:

```
Search our Confluence documentation for expense categorization algorithms,
then find the implementation in our codebase.
```

```
Using Glean MCP, find MYOB's data classification policy, then check if
this code handles customer data appropriately.
```

### Performance Considerations

MCPs add latency to AI responses:
- **Filesystem MCP**: Fast (local access)
- **GitHub MCP**: Medium (API calls to GitHub)
- **Glean/Atlassian MCP**: Medium-slow (searching indexes)

**When to Disable MCPs:**
- Simple code completion (doesn't need context)
- When working offline
- When AI responses are too slow
- For quick, generic questions

**How to Disable Temporarily:**
- In Cursor: Use "@" to select specific context instead of relying on MCPs
- Or toggle MCP off in settings for a session

### Best Practices

**Do:**
- Enable MCPs relevant to your current work
- Use specific MCP queries when you need that source
- Regularly update MCP tokens when they expire
- Review what context MCPs provide (via Cursor's context panel)
- Combine MCPs for comprehensive understanding

**Don't:**
- Enable every MCP if you won't use them (adds latency)
- Include sensitive data in MCP-accessible repositories
- Forget to use .cursorignore for sensitive files
- Share MCP tokens (personal tokens only)
- Over-rely on MCPs for simple questions

## Custom Local MCPs

### When to Consider Custom MCPs

You can build custom MCPs for local development to provide specialized context:

**Good Use Cases:**
- Project-specific context (your app's architecture, patterns)
- Internal API documentation not in Confluence
- Custom code generation templates
- Local database schema exploration
- Team-specific conventions and patterns

**Example Scenarios:**
- MCP that reads your OpenAPI specs and generates client code
- MCP that accesses your local Docker containers for debugging
- MCP that provides context from your monorepo structure
- MCP that reads your team's decision log or ADR records

### Building Custom MCPs

**Note:** This playbook doesn't provide a tutorial on building MCPs. See official MCP documentation at [modelcontextprotocol.io](https://modelcontextprotocol.io) for development guides.

**What you need to know:**
- MCPs are Node.js/Python programs that implement the MCP protocol
- They can access any local resource or API
- They integrate with Cursor via configuration
- They run locally on your machine

**Example Custom MCP Idea:**
```
// Conceptual: MCP that provides MYOB coding standards
// Reads from local .myob-standards.json file
// Provides context about naming conventions, patterns, anti-patterns
// AI uses this to generate code following MYOB standards
```

### When NOT to Build Custom MCPs

**Avoid custom MCPs for:**
- Information already in Glean or Confluence (use existing MCPs)
- Public information (use web search)
- One-off needs (manual context is faster)
- Complex logic that's hard to maintain

**Cost/Benefit:**
Building a custom MCP takes 2-8 hours. Only worth it if:
- Used daily by multiple team members
- Saves significant time (>30 min/week per person)
- Provides unique context not available elsewhere

### Sharing Custom MCPs

If you build a useful custom MCP:
1. Document it clearly (README with setup instructions)
2. Share with your team via internal repository
3. Consider contributing to MYOB MCP registry
4. Maintain it (update when dependencies change)

## Troubleshooting

### MCPs Not Loading

**Check:**
1. MCP feature enabled in Cursor settings
2. `mcp.json` syntax is valid JSON (no trailing commas)
3. Required npm packages installed (`npx` installs automatically)
4. Restart Cursor after configuration changes

**Common Issues:**
- Syntax errors in mcp.json
- Invalid or expired API tokens
- Network/firewall blocking MCP server connections
- Incorrect file paths or permissions

### Authentication Failures

**GitHub MCP:**
- Token has expired (regenerate on GitHub)
- Token missing required scopes (`repo`, `read:org`)
- Token revoked or invalidated

**Glean MCP:**
- API token not configured correctly
- Instance name wrong (should be "myob" for MYOB Glean)
- User doesn't have access to Glean
- OAuth server not enabled (admin configuration required)

**Atlassian MCP:**
- API token expired
- Email/token combination incorrect
- User doesn't have access to Confluence/Jira spaces

### MCPs Slow or Timing Out

**If AI responses are slow:**
1. Check which MCPs are being queried (look at Cursor context panel)
2. Disable unused MCPs temporarily
3. Use more specific prompts to target specific MCPs
4. Check network connectivity
5. Consider caching strategies for frequently accessed data

**Performance Tips:**
- Use `@` symbol in Cursor to manually select context (bypasses auto-MCP)
- Disable MCPs when working offline
- Close unnecessary context sources

### Debugging MCP Issues

**View MCP Logs:**
- Cursor: Help → Show Logs → Filter by "MCP"
- Look for connection errors, authentication failures, timeout messages

**Test MCP Directly:**
In Cursor Chat, explicitly test each MCP:
```
Search GitHub for [specific query]
```
```
Search Glean for MYOB authentication standards
```
If specific MCP queries fail, check that MCP's configuration.

## Security Considerations

### Data Access

MCPs can access potentially sensitive data:
- **Filesystem MCP**: Your entire codebase (use .cursorignore)
- **GitHub MCP**: All repos your token can access (limit token scope)
- **Glean MCP**: All documents you have permission to see
- **Atlassian MCP**: All Jira/Confluence content you can access

**Security Best Practices:**
- Use `.cursorignore` to exclude sensitive files and directories
- Create tokens with minimum necessary permissions
- Use separate tokens for different projects if needed
- Regularly rotate API tokens (every 90 days)
- Never share tokens or include in version control

### Privacy Implications

When MCPs are enabled:
- AI tools may send search queries to MCP servers
- File names and paths may be sent (but not contents unless explicitly requested)
- Search results are returned and may be logged by AI provider

**For highly sensitive work:**
- Use local AI models if possible
- Disable cloud MCPs and use filesystem only
- Review AI tool privacy policies about MCP data

See [Data Privacy & Security](../responsible-practices/data-privacy-security.md) for detailed guidance.

## MYOB Context

### Internal Knowledge Access

MCPs give you superpowers at MYOB:

**Glean MCP** provides access to:
- Architecture Codex documentation
- Engineering standards and best practices
- Historical architecture decision records (ADRs)
- Team wikis and internal documentation
- Past project learnings and retrospectives

**Example Queries:**
```
Search Glean for MYOB API design standards
```
```
Find documentation on MYOB's observability practices
```
```
Search for examples of how other teams implemented similar features
```

### Development Workflow Integration

**Typical MYOB Developer Workflow with MCPs:**

1. **Morning**: Check Jira for assigned tasks (Atlassian MCP)
2. **Research**: Search Glean for relevant documentation
3. **Implementation**: Use Filesystem + GitHub MCP for code examples
4. **Review**: Reference standards via Glean before submitting PR
5. **Documentation**: Find similar docs to use as templates

All without leaving your IDE.

## Resources and Documentation

### Official MCP Documentation

- **MCP Specification**: [modelcontextprotocol.io](https://modelcontextprotocol.io)
- **GitHub MCP**: [github.com/modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers)
- **Glean MCP**: [docs.glean.com/mcp](https://docs.glean.com) (Glean documentation)

### MYOB-Specific Resources

- **MYOB MCP Registry**: Confluence page with approved MCPs (link to be added)
- **Setup Guide**: [MCP Servers Setup](../getting-started/mcp-servers-setup.md)
- **Approved Tools**: [MYOB-Approved Tools](../appendix/MYOB-approved-tools.md)

### Getting Help

- **MCP Issues**: #ai-tools Slack channel (MYOB internal)
- **Glean MCP**: Contact Glean support or #glean-help
- **General AI Tools**: #ask-ai-enablement Slack channel

## Quick Reference

### Essential MCP Commands

**In Cursor Chat:**
```
Search GitHub for [query]
Search Glean for [query]
Search Confluence for [query]
Find files matching [pattern]
```

### Common MCP Workflows

**Understanding a feature:**
```
1. Search Glean for feature documentation
2. Search GitHub for implementation examples
3. Search Jira for related tickets and requirements
4. Analyze local code with filesystem MCP
```

**Implementing a new feature:**
```
1. Search Glean for relevant MYOB standards
2. Search GitHub for similar implementations
3. Use filesystem MCP to understand current code
4. Generate code following discovered patterns
```

**Troubleshooting:**
```
1. Search Glean for error message or issue
2. Search GitHub issues for related problems
3. Search Confluence for runbooks or documentation
4. Analyze local logs with filesystem MCP
```

## Next Steps

With MCPs configured, you're ready for advanced AI-assisted development:

1. **Learn IDE Setup**: [IDE-Specific Setup Guides](../getting-started/ide-setup/)
2. **Model Selection**: [Choosing the Right Model](../getting-started/choosing-the-right-model.md)
3. **Start Building**: [Feature Development](../feature-development/README.md)

---

**Previous:** [← AI Frameworks Practical](ai-frameworks-practical.md) | **Next:** [Model Selection →](model-selection.md)

---


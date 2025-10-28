---
title: MCP Servers Setup Guide
---

![MYOB Banner](../../assets/images/myob-banner.png)

# MCP Servers Setup Guide

## Overview

Model Context Protocol (MCP) servers provide standardized interfaces for AI models to interact with enterprise knowledge platforms and development tools. This guide covers the installation and configuration of MYOB-approved MCP servers.

MCP servers enable your AI coding assistants to access:
- Company knowledge and documentation through Glean
- Repository information and code context through GitHub
- Jira and Confluence through Atlassian
- Other enterprise systems and databases
- Custom integrations specific to MYOB workflows

**Important:** Only use MCP servers approved by MYOB. See the [MYOB MCP Registry](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/10925965594) on Confluence for the current approved list and security review status.

## MYOB-Approved MCP Servers

The following MCP servers have been reviewed and approved for use at MYOB. For the complete and current list with approval status, always refer to the **[MYOB MCP Registry on Confluence](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/10925965594)**.

### Approved MCP Servers

| Server | Hosting Model | Allowed Data | Status | Use With |
|--------|---------------|--------------|--------|----------|
| **Atlassian MCP** | Vendor hosted (remote) | Internal only | ✅ Approved | Cursor, compatible IDEs |
| **Glean MCP** | Vendor hosted (remote) | Internal only | ✅ Approved | Cursor, compatible IDEs |
| **GitHub MCP** | Vendor hosted (remote) | Internal only | ⚠️ Approved for VS Code only | VS Code only |
| **Playwright MCP** | Local | Internal only | ✅ Approved | All IDEs |
| **Context7 MCP** | Local | Internal only | ✅ Approved | All IDEs |

**Note:** Approval status may change. Always check the Confluence registry before using an MCP server.

### 1. Atlassian MCP (Jira/Confluence)

**What it does:**
- Access Jira issues and tickets
- Search Confluence pages and documentation
- Create and update Jira issues
- Read Confluence content for context

**Hosting:** Vendor hosted (remote) - Atlassian official server  
**Status:** ✅ Approved  
**Allowed Data:** Internal only (no customer data, no production secrets)

**Prerequisites:**
- Atlassian account with access to MYOB Jira/Confluence
- Atlassian API token

**Configuration:**
```json
{
  "mcpServers": {
    "atlassian": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-atlassian"],
      "env": {
        "JIRA_URL": "https://myob.atlassian.net",
        "CONFLUENCE_URL": "https://myobconfluence.atlassian.net",
        "ATLASSIAN_API_TOKEN": "your_api_token",
        "ATLASSIAN_EMAIL": "your.email@myob.com"
      }
    }
  }
}
```

### 2. Glean MCP

**What it does:**
- Search MYOB's Glean knowledge base
- Access internal documentation and standards
- Find people and expertise within MYOB
- Retrieve documents for context

**Hosting:** Vendor hosted (remote) - Glean official server  
**Status:** ✅ Approved  
**Allowed Data:** Internal only

**Prerequisites:**
- MYOB Glean account
- Glean API token

**Configuration:**
```json
{
  "mcpServers": {
    "glean": {
      "command": "npx",
      "args": ["-y", "@gleanwork/local-mcp-server"],
      "env": {
        "GLEAN_INSTANCE": "https://myob-be.glean.com/rest/api/v1/insights",
        "GLEAN_API_TOKEN": "your_glean_api_token",
        "GLEAN_ACT_AS": "your.email@myob.com"
      }
    }
  }
}
```

### 3. GitHub MCP

**What it does:**
- Search GitHub repositories
- Access code, issues, PRs
- Browse repository structure
- Get code context

**Hosting:** Vendor hosted (remote) - GitHub official server  
**Status:** ⚠️ **Approved for VS Code ONLY** (not approved for Cursor at this time)  
**Allowed Data:** Internal only

**Prerequisites:**
- GitHub account with access to MYOB repositories
- GitHub Personal Access Token (PAT)

**Configuration (VS Code only):**
```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_pat"
      }
    }
  }
}
```

**Note:** For Cursor users, use alternative methods to access GitHub code context.

### 4. Playwright MCP

**What it does:**
- Browser automation and testing
- Web scraping and data extraction
- UI testing automation

**Hosting:** Local (runs on your machine)  
**Status:** ✅ Approved  
**Allowed Data:** Internal only

**Configuration:**
```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-playwright"]
    }
  }
}
```

### 5. Context7 MCP

**What it does:**
- Advanced context management for AI
- Local context aggregation

**Hosting:** Local (runs on your machine)  
**Status:** ✅ Approved  
**Allowed Data:** Internal only

**Configuration:**
```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "context7-mcp-server"]
    }
  }
}
```

## Standard Security Checklist for MCP Servers

**IMPORTANT:** Follow these security best practices with ALL MCP servers:

### 1. Isolation
- ✅ **Run servers in isolation** using Docker/Podman (non-root)
- ❌ Never run MCP servers with root privileges
- ✅ Use containerization for local MCP servers

### 2. Version Pinning
- ✅ **Use pinned versions** of MCP servers (avoid `@latest`)
- ❌ Don't use unpinned versions that auto-update
- ✅ Test version updates before deploying

Example:
```json
// ✅ Good - pinned version
"args": ["-y", "@gleanwork/local-mcp-server@1.2.3"]

// ❌ Bad - latest version (unpredictable)
"args": ["-y", "@gleanwork/local-mcp-server@latest"]
```

### 3. Secrets Management
- ✅ **Keep secrets in environment variables** or secret manager
- ❌ **NEVER put clear text secrets in config files**
- ✅ Use `.env` files (excluded from git)
- ✅ Rotate tokens regularly (every 90 days)

Example:
```bash
# .env file (not committed to git)
GLEAN_API_TOKEN=your_token_here
ATLASSIAN_API_TOKEN=your_token_here
```

### 4. Authorization (Least Privilege)
- ✅ **Ensure secrets/keys have least privileges**
- ❌ Don't use admin tokens unless absolutely necessary
- ✅ Scope tokens to minimum required access
- ✅ Review token permissions quarterly

### 5. Data Usage
- ✅ **Never use production data** with MCP servers
- ❌ Absolutely no customer PII, financial records, or production secrets
- ✅ Use synthetic or sanitized data only
- ✅ **If you need production data, seek guidance from Security team first**

### 6. Network Security
- ✅ **Control network egress** to required addresses only
- ❌ **Never bind a container/server to 0.0.0.0** (all interfaces)
- ✅ Use localhost (127.0.0.1) for local servers
- ✅ Configure firewall rules appropriately

### 7. Agency and Auto-Approval
- ✅ **Never run agents in auto-approve mode**
- ❌ Don't let AI agents execute commands without human approval
- ✅ **Always check and approve agent requests**
- ✅ Review AI actions before execution

### 8. LLM Policy
- ✅ **Only use approved LLMs** (check MYOB-approved tools list)
- ❌ Don't use unapproved AI models or providers
- ✅ Verify LLM provider security and data handling policies

### 9. Tool Policy
- ✅ **Review all tools** before using with MCPs
- ✅ **If unsure, seek guidance from Security team**
- ❌ Don't install untrusted MCP server tools
- ✅ Check tool provenance and maintainer reputation

## Installation and Configuration

### Prerequisites

Before setting up MCP servers:
- Node.js (version 18 or higher)
- npm or yarn package manager
- Docker (for containerized MCP servers)
- Access to MYOB enterprise systems (Glean, Atlassian, GitHub)
- Appropriate API tokens and credentials

### Getting API Tokens

**Atlassian API Token:**
1. Go to [https://id.atlassian.com/manage-profile/security/api-tokens](https://id.atlassian.com/manage-profile/security/api-tokens)
2. Create new API token
3. Copy token and store securely
4. Use with your MYOB email address

**Glean API Token:**
1. Log into MYOB Glean instance
2. Go to Settings → API Tokens
3. Generate new token
4. Copy and store securely

**GitHub Personal Access Token:**
1. GitHub Settings → Developer settings → Personal access tokens
2. Generate new token (classic)
3. Select scopes: `repo`, `read:org`, `read:user`
4. Copy and store securely

**Important:** Never commit tokens to version control. Use environment variables or secret managers.

### Cursor IDE Configuration

MCP servers are configured in Cursor via the `mcp.json` file:

**Location:**
- **Mac:** `~/Library/Application Support/Cursor/mcp.json`
- **Windows:** `%APPDATA%\Cursor\mcp.json`
- **Linux:** `~/.config/Cursor/mcp.json`

**Example Configuration (approved servers only):**
```json
{
  "mcpServers": {
    "glean": {
      "command": "npx",
      "args": ["-y", "@gleanwork/local-mcp-server"],
      "env": {
        "GLEAN_INSTANCE": "https://myob-be.glean.com/rest/api/v1/insights",
        "GLEAN_API_TOKEN": "${GLEAN_API_TOKEN}",
        "GLEAN_ACT_AS": "your.email@myob.com"
      }
    },
    "atlassian": {
      "command": "docker",
      "args": [
        "run", "-i", "--rm",
        "-e", "JIRA_URL",
        "-e", "CONFLUENCE_URL",
        "-e", "ATLASSIAN_API_TOKEN",
        "-e", "ATLASSIAN_EMAIL",
        "ghcr.io/sooperset/mcp-atlassian:1.0.0"
      ],
      "env": {
        "JIRA_URL": "https://myob.atlassian.net",
        "CONFLUENCE_URL": "https://myobconfluence.atlassian.net",
        "ATLASSIAN_API_TOKEN": "${ATLASSIAN_API_TOKEN}",
        "ATLASSIAN_EMAIL": "your.email@myob.com"
      }
    }
  }
}
```

**Security Note:** Use environment variable references (`${VAR_NAME}`) instead of hardcoding tokens.

### Environment Variables Setup

Create `.env` file in your home directory (never commit to git):

```bash
# MYOB MCP Server Tokens
export GLEAN_API_TOKEN="your_glean_token_here"
export ATLASSIAN_API_TOKEN="your_atlassian_token_here"
export GITHUB_PERSONAL_ACCESS_TOKEN="your_github_pat_here"
```

Load environment variables:
```bash
source ~/.env
```

Or use a secret manager like 1Password CLI, AWS Secrets Manager, or Azure Key Vault.

## Using MCP Servers

### In Cursor

After configuration:
1. Restart Cursor completely
2. Verify MCPs loaded: Settings → Features → MCP
3. Use in prompts: "Search Glean for..." or "Find in Confluence..."

**Example Prompts:**
```
Search Glean for MYOB authentication standards
```
```
Search Confluence for API design guidelines
```
```
Find Jira tickets related to payment processing
```

### In VS Code (GitHub MCP only)

For GitHub Copilot users in VS Code:
- GitHub MCP is approved for VS Code only
- Configure similar to Cursor but check VS Code MCP documentation
- Other MCPs (Glean, Atlassian) not yet approved for VS Code

## Security and Compliance

### Token Management

**Security Requirements:**
- ✅ Store API tokens in environment variables or secure vaults
- ✅ Never commit tokens to version control
- ✅ Rotate tokens every 90 days according to MYOB security policies
- ✅ Use least-privilege access (scope tokens to minimum required permissions)
- ❌ Never hardcode tokens in configuration files
- ❌ Never share tokens with others

### Approved Usage

**Data Classification:**
- ✅ Internal data only (documentation, code, non-sensitive information)
- ❌ **Never use production data** without Security team approval
- ❌ No customer PII, financial records, or production secrets
- ✅ Use synthetic or anonymized data for testing

**LLM Usage:**
- ✅ Only use MYOB-approved LLMs (see [MYOB-Approved Tools](../../appendix/MYOB-approved-tools.md))
- ❌ Don't configure MCPs with unapproved AI providers

**Agent Mode:**
- ✅ **Always review and approve agent requests**
- ❌ **Never enable auto-approve mode**
- ✅ Human oversight required for all MCP agent actions

### Network Security

**For Local MCP Servers:**
- ✅ Run in Docker/Podman containers (non-root)
- ✅ Bind to localhost (127.0.0.1) only
- ❌ **Never bind to 0.0.0.0** (all network interfaces)
- ✅ Control network egress to required addresses only

**For Remote MCP Servers:**
- ✅ Use encrypted connections (HTTPS/TLS) for all API communications
- ✅ Follow MYOB network security policies
- ✅ Verify SSL certificates

## Troubleshooting

### Common Issues

**Connection Errors:**
- Verify API tokens are valid and not expired
- Check network connectivity
- Ensure MCP server version is pinned (not @latest)
- Verify environment variables are loaded

**Permission Denied:**
- Check token has required permissions
- Verify user has access to resources (Glean, Confluence, Jira)
- Ensure token scopes include necessary permissions

**MCP Server Not Loading:**
- Check Cursor logs: Help → Show Logs → Filter "MCP"
- Verify JSON syntax in mcp.json (no trailing commas)
- Ensure Docker is running (for containerized servers)
- Restart Cursor after configuration changes

**Rate Limiting:**
- Implement appropriate retry logic
- Respect API rate limits
- Consider caching frequently accessed data
- Contact vendor for rate limit increases if needed

### Getting Help

**Technical Support:**
- **Architecture Team:** #sig-tech-codex on Slack
- **Security Questions:** #svc-security on Slack
- **DX (Developer Experience Team):** For MCP approvals and guidance

**Vendor Support:**
- **Glean Support:** Internal Glean support channels
- **Atlassian Support:** Atlassian support portal
- **GitHub Support:** GitHub Enterprise support

**MCP Registry:**
- [MYOB MCP Registry on Confluence](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/10925965594)
- Check approval status, security reviews, and ownership

## Best Practices

### Performance

- Cache frequently accessed data when appropriate
- Implement connection pooling for high-volume usage
- Monitor server performance and resource usage
- Use pagination for large data sets
- Disable unused MCPs to reduce latency

### Development Workflow

- Test MCP server configurations in development environments first
- Document custom configurations for team sharing
- Keep MCP server versions pinned for consistency
- Monitor logs for errors and performance issues
- Review MCP registry quarterly for status updates

### Team Collaboration

- Share approved MCP configurations across teams
- Document custom integrations and use cases
- Provide training on MCP server capabilities
- Establish guidelines for enterprise data access
- Follow the security checklist for all MCP servers

### Security Best Practices Summary

✅ **DO:**
- Run servers in Docker/Podman isolation
- Pin MCP server versions
- Store secrets in environment variables or secret managers
- Use least-privilege API tokens
- Never use production data
- Bind local servers to localhost only
- Always approve agent actions manually
- Use only approved LLMs
- Review all tools before use

❌ **DON'T:**
- Run servers as root
- Use @latest versions
- Hardcode secrets in config files
- Use overly permissive tokens
- Access production data without approval
- Bind to 0.0.0.0 (all interfaces)
- Enable auto-approve mode
- Use unapproved AI models
- Use untrusted tools without security review

## Requesting New MCP Servers

If you need an MCP server not on the approved list:

1. **Check the Registry:** Verify it's not already approved
2. **Security Review:** Contact Security team (#svc-security) for review
3. **Provide Details:**
   - Server name and vendor
   - Hosting model (local vs remote)
   - Data it will access
   - Business justification
   - Security documentation from vendor

4. **Wait for Approval:** Don't use unapproved servers while review is pending

5. **Document:** Once approved, it will be added to the Confluence registry

## Additional Resources

- **[MYOB MCP Registry (Confluence)](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/10925965594)** - Official approved list
- **[MCP Usage Guide](../../feature-development/mcp-usage.md)** - Detailed MCP usage and best practices
- **[MYOB-Approved Tools](../../appendix/MYOB-approved-tools.md)** - All approved AI tools
- **[Model Context Protocol Specification](https://modelcontextprotocol.io/)** - Official MCP docs

For questions or support:
- **Security:** #svc-security on Slack
- **DX Team:** For MCP setup and configuration help
- **Architecture:** #sig-tech-codex on Slack

---

**Previous:** [← Project Setup](project-setup.md) | **Next:** [AI Training Programs →](ai-training-programs.md)

---

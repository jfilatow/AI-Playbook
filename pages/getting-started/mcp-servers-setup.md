![MYOB Banner](../../assets/images/myob-banner.png)

# MCP Servers Setup Guide

Model Context Protocol (MCP) servers provide standardized interfaces for AI models to interact with enterprise knowledge platforms and development tools. This guide covers the installation and configuration of MYOB-approved MCP servers.

## Overview

MCP servers enable your AI coding assistants to access:
- Company knowledge and documentation through Glean
- Repository information and code context through GitHub
- Other enterprise systems and databases
- Custom integrations specific to MYOB workflows

## Prerequisites

Before setting up MCP servers, ensure you have:
- Node.js (version 18 or higher)
- npm or yarn package manager
- Access to MYOB's enterprise systems (Glean, GitHub, etc.)
- Appropriate API tokens and credentials

## MYOB-Approved MCP Servers

### 1. Glean MCP Server

Glean's MCP server provides access to MYOB's enterprise knowledge platform, enabling AI tools to search company content, access people directories, and interact with Glean's AI assistant.

#### Installation

```bash
npm install @gleanwork/local-mcp-server
```

#### Configuration

Set up your Glean API credentials:

```bash
export GLEAN_INSTANCE=https://myob-be.glean.com/rest/api/v1/insights
export GLEAN_API_TOKEN=your_api_token
```

For global tokens that support impersonation:
```bash
export GLEAN_ACT_AS=your.email@myob.com
```

#### Features

- **Company Search**: Access Glean's powerful content search capabilities
- **People Profile Search**: Retrieve information from Glean's people directory
- **Chat Interface**: Engage with Glean's AI assistant for conversational interactions
- **Document Retrieval**: Fetch documents from Glean by ID or URL for detailed analysis

### 2. GitHub MCP Server

The GitHub MCP server provides access to repository information, code context, and GitHub-specific functionality.

#### Installation

```bash
docker pull ghcr.io/github/github-mcp-server
```

#### Configuration

Set up your GitHub Personal Access Token:

```bash
export GITHUB_PERSONAL_ACCESS_TOKEN=your_github_token
```

#### Features

- Repository access and code browsing
- Issue and pull request management
- Code search and analysis
- Workflow and action integration

### 3. Cursor Admin MCP (MYOB Internal)

For Cursor IDE users, MYOB provides an internal MCP server for enhanced development capabilities.

Contact the Architecture team for access and setup instructions.

## Configuration in AI Tools

### Cursor IDE Configuration

Add MCP servers to your Cursor configuration file (`~/.cursor/mcp.json`):

```json
{
  "mcpServers": {
    "glean": {
      "command": "npx",
      "args": ["-y", "@gleanwork/local-mcp-server"],
      "env": {
        "GLEAN_INSTANCE": "https://myob-be.glean.com/rest/api/v1/insights",
        "GLEAN_API_TOKEN": "your_api_token"
      }
    },
    "GitHub": {
      "command": "docker",
      "args": [
        "run", "-i", "--rm",
        "-e", "GITHUB_PERSONAL_ACCESS_TOKEN",
        "ghcr.io/github/github-mcp-server"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token"
      }
    }
  }
}
```

### Other AI Tools

Refer to your AI tool's documentation for MCP server integration. Common patterns include:
- Environment variable configuration
- Plugin or extension installation
- API endpoint configuration

## Security and Compliance

### Token Management

- Store API tokens securely using environment variables or secure vaults
- Never commit tokens to version control
- Rotate tokens regularly according to MYOB security policies
- Use least-privilege access principles

### Approved Usage

- Only use MCP servers approved by MYOB's Architecture team
- Follow data classification guidelines when accessing enterprise content
- Ensure compliance with privacy settings and data retention policies
- Report any security concerns to the Security team

### Network Security

- MCP servers should run in secure network environments
- Use encrypted connections (HTTPS/TLS) for all API communications
- Follow MYOB's network security policies and firewall rules

## Troubleshooting

### Common Issues

1. **Connection Errors**: Verify API tokens and network connectivity
2. **Permission Denied**: Check token permissions and user access rights
3. **Rate Limiting**: Implement appropriate retry logic and respect API limits
4. **Configuration Issues**: Validate JSON syntax and environment variables

### Getting Help

- **Technical Support**: Contact the Architecture team via #sig-tech-codex on Slack
- **Security Questions**: Reach out to #svc-security on Slack
- **Glean Support**: Use internal Glean support channels
- **GitHub Issues**: Check the official MCP server repositories for known issues

## Best Practices

### Performance

- Cache frequently accessed data when appropriate
- Implement connection pooling for high-volume usage
- Monitor server performance and resource usage
- Use pagination for large data sets

### Development Workflow

- Test MCP server configurations in development environments first
- Document custom configurations for team sharing
- Keep MCP server versions updated for security and features
- Monitor logs for errors and performance issues

### Team Collaboration

- Share approved MCP configurations across teams
- Document custom integrations and use cases
- Provide training on MCP server capabilities
- Establish guidelines for enterprise data access

## Additional Resources

- [MYOB Confluence: MCP Server Guidelines](https://myob.atlassian.net/wiki) (Internal access required)
- [Glean MCP Server Documentation](https://github.com/gleanwork/mcp-server)
- [GitHub MCP Server Repository](https://github.com/github/github-mcp-server)
- [Model Context Protocol Specification](https://modelcontextprotocol.io/)

For questions or support, contact the Architecture team or post in the #sig-tech-codex Slack channel.

---

**Previous:** [← Project Setup](project-setup.md) | **Next:** [AI Training Programs →](ai-training-programs.md)

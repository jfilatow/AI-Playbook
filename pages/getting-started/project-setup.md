![MYOB Banner](../../assets/images/myob-banner.png)

# Project Setup

Set up your development environment to use AI tools safely and effectively.

## Set up your coding assistant

### 1. Install an AI coding assistant

Install a coding assistant from the [Allowed Tools for MYOB Pilot](../appendix/MYOB-approved-tools.md) list.

### 2. Turn on privacy settings

**Important:** You must enable privacy settings to protect MYOB customer data and IP. Privacy settings stop your code and data being stored on AI providers' servers. They also prevent your data being used to train AI models.

For information on approved AI tools and their privacy settings, see the [MYOB-approved AI tools](../appendix/MYOB-approved-tools.md)

### 3. Add AI rules files

Add [Rules for AI](../appendix/rules-for-ai/README.md) to your repository and commit them to version control.

### 4. Set up MCP Servers (Recommended)

Model Context Protocol (MCP) servers enable seamless integration between AI tools and MYOB's enterprise knowledge platforms. For enhanced AI capabilities with access to company knowledge:

- **Glean MCP Integration**: Connect to MYOB's enterprise knowledge platform for company search, people directory, and AI assistant capabilities
- **GitHub MCP**: Access repository information and code context
- **MYOB-approved MCP Servers**: Use only approved MCP servers that meet security and compliance requirements

See the detailed [MCP Servers Setup Guide](mcp-servers-setup.md) for installation instructions and approved server configurations.

## Set up repository documentation

You need access to artifacts like user stories, technical designs, diagrams and interface designs from within your coding assistant.

### Use GitHub (optional)

Use GitHub to manage all your project artifacts centrally. You can add your project documents into your code repo or create a separate repo and link to it using [GitHub submodules](https://github.blog/open-source/git/working-with-submodules/)

If you don't want to use GitHub access, you can use another approach that suits your team.

---

**Previous:** [← AI Working Mindset](ai-working-mindset.md) | **Next:** [MCP Servers Setup →](mcp-servers-setup.md)

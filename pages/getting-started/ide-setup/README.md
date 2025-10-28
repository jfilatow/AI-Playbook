---
title: AI IDE Setup
---

![MYOB Banner](../../../assets/images/myob-banner.png)

# AI IDE Setup

## Overview

This section covers setup and configuration for MYOB-approved AI coding assistants. Both Cursor and GitHub Copilot are approved for use at MYOB, each with different strengths for AI-assisted development.

**Important:** These guides cover **configuration and setup only**. For software installation and licensing, follow MYOB's standard software request process via:
- **Sailpoint Identity Now** for software requests
- **Kandji** (macOS) or **Windows Company Portal** (Windows) for installation

## Choose Your AI IDE

### Cursor

**Best for:**
- Complex multi-file refactoring
- Large context requirements (100k+ tokens)
- Model selection (o1, Claude, GPT-4)
- MCP integration (Glean, Atlassian, GitHub)
- Architecture and design decisions

**Key Features:**
- Composer mode for multi-file editing
- Full MCP support for enterprise context
- Choice of AI models for different tasks
- Built on VS Code (familiar interface)
- Max mode for deep reasoning tasks

[→ Cursor Setup Guide](cursor-setup.md)

### GitHub Copilot

**Best for:**
- Fast inline code completions
- Familiar IDE integration (VS Code, JetBrains, Visual Studio)
- Quick coding tasks and boilerplate
- Teams standardized on existing IDEs
- Simple refactoring and test generation

**Key Features:**
- Excellent completion speed
- Works across multiple IDEs
- Copilot Chat for questions and explanations
- Enterprise features and compliance
- Low learning curve

[→ GitHub Copilot Setup Guide](github-copilot-setup.md)

## Comparison

Need help choosing? See our detailed comparison:

[→ Cursor vs GitHub Copilot Comparison](copilot-vs-cursor.md)

**Quick Decision Guide:**

| Your Need | Recommended Tool |
|-----------|------------------|
| Multi-file refactoring | Cursor |
| Fast completions only | Either (slight edge to Copilot) |
| Access MYOB docs via MCP | Cursor (only option) |
| Use JetBrains IDEs | GitHub Copilot (only option) |
| Complex reasoning tasks | Cursor (o1 model access) |
| Existing VS Code setup | Either (Cursor imports settings) |

## Using Both Together

Many MYOB developers use both tools for different purposes:

- **Daily coding:** VS Code + Copilot for fast completions
- **Complex problems:** Cursor for refactoring and architecture
- **Context-heavy tasks:** Cursor with MCPs for institutional knowledge

This is a valid approach if your workflow benefits from each tool's strengths.

## Configuration Essentials

Once you've requested and installed your chosen IDE via Sailpoint:

### Essential Configuration Steps

1. **Privacy Settings** - Disable code training and telemetry
2. **Model Selection** - Choose appropriate models for different tasks
3. **MYOB Rules** - Configure `.cursorrules` or Copilot instructions
4. **MCP Setup** (Cursor only) - Connect to Glean, Atlassian, GitHub
5. **Keyboard Shortcuts** - Learn essential AI commands

See the detailed setup guides for step-by-step instructions.

## Training and Resources

### Getting Started Training

- [AI Training Programs](../ai-training-programs.md) - Structured learning paths
- [Model Selection Guide](../choosing-the-right-model.md) - When to use which model
- [MCP Usage Guide](../../feature-development/mcp-usage.md) - Leveraging enterprise context
- [Prompt Library](../../appendix/prompt-library/README.md) - Proven prompts for common tasks

### Best Practices

- Start with simpler tasks to build familiarity
- Review all AI-generated code before committing
- Use appropriate models for different task complexity
- Configure privacy settings to protect sensitive data
- Follow [Responsible AI Practices](../../responsible-practices/README.md)

## MYOB Tool Approval

Both Cursor and GitHub Copilot are approved for use at MYOB:

✅ **GitHub Copilot** - Approved for all developers  
✅ **Cursor** - Approved for all developers

For full details on:
- Security approval status
- Data handling policies
- Usage guidelines
- License procurement

See: [MYOB-Approved Tools](../../appendix/MYOB-approved-tools.md)

## Requesting Software

To request Cursor or GitHub Copilot:

1. Log in to **Sailpoint Identity Now**
2. Search for "Cursor" or "GitHub Copilot"
3. Submit access request
4. Once approved, install via:
   - **Kandji** (macOS users)
   - **Windows Company Portal** (Windows users)

For help with the request process, contact IT Service Desk.

## Next Steps

1. Choose your IDE based on your needs
2. Request access via Sailpoint Identity Now
3. Follow the setup guide for your chosen tool:
   - [Cursor Setup Guide](cursor-setup.md)
   - [GitHub Copilot Setup Guide](github-copilot-setup.md)
4. Configure MCPs (Cursor users): [MCP Setup](../../feature-development/mcp-usage.md)
5. Start with [AI Training Programs](../ai-training-programs.md)

---

**Previous:** [← Project Setup](../project-setup.md) | **Next:** [Cursor Setup →](cursor-setup.md)

---


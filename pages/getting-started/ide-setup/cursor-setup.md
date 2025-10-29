---
title: Cursor IDE Setup Guide
---

![MYOB Banner](../../../assets/images/myob-banner.png)

# Cursor IDE Setup Guide

## Overview

Cursor is an AI-first code editor built on VS Code, optimized for AI-assisted development. This guide covers configuration and setup for MYOB development with best practices, Cursor Rules, and MCP integration.

**Before You Begin:**  
Request and install Cursor via MYOB's standard software process:
1. Request access via **Sailpoint Identity Now**
2. Install via **Kandji** (macOS) or **Windows Company Portal** (Windows)
3. Once installed, return to this guide for configuration

For licensing and approval details, see [MYOB-Approved Tools](../../appendix/MYOB-approved-tools.md).

## Table of Contents

- [First Launch Setup](#first-launch-setup)
- [Initial Configuration](#initial-configuration)
- [Cursor Rules Setup](#cursor-rules-setup)
- [MCP Integration](#mcp-integration)
- [Keyboard Shortcuts](#keyboard-shortcuts)
- [MYOB-Specific Configuration](#myob-specific-configuration)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

## First Launch Setup

When launching Cursor for the first time:

1. **Sign In**:
   - Use your GitHub account (recommended) or email
   - This syncs settings across devices

2. **Import VS Code Settings** (if migrating):
   - Cursor offers to import settings and extensions
   - Review and select what to import
   - Most VS Code extensions work in Cursor

3. **Privacy Settings**:
   - Review privacy policy
   - Configure data sharing preferences (see [Initial Configuration](#initial-configuration))

## Initial Configuration

### Essential Settings

Open Settings (Cmd+, on Mac, Ctrl+, on Windows):

**General Settings:**
```json
{
  "cursor.general.enableAI": true,
  "cursor.general.enableComposer": true,
  "cursor.general.enableMCP": true,
  "cursor.aiGeneratedCode.acceptAllByDefault": false // Review AI code!
}
```

**Model Selection:**
```json
{
  "cursor.chat.model": "gpt-4o", // Fast model for chat
  "cursor.inlineEdit.model": "gpt-4o", // Fast model for Cmd+K
  "cursor.composer.model": "claude-3.5-sonnet" // Better for multi-file
}
```

**Privacy Settings:**
```json
{
  "cursor.privacy.enableTelemetry": false, // Disable if desired
  "cursor.privacy.storageLocation": "local", // Keep chats local
  "cursor.privacy.enableTraining": false // Don't use your code for training
}
```

## Cursor Rules Setup

### Understanding Cursor Rules

Cursor Rules let you configure how AI generates code for your project:

- **`.cursorrules`**: Project-level rules (in project root)
- **`.cursor/rules/`**: Multiple rule files for complex projects
- **User rules**: Global rules for all your projects

### Using MYOB Cursor Rules

This repository includes comprehensive Cursor rules:

1. **Copy from this repo**:
   ```bash
   # In your project root
   cp /path/to/AI-Playbook/.cursorrules .
   cp -r /path/to/AI-Playbook/.cursor/rules .cursor/
   ```

2. **Or create symbolic link** (stays updated):
   ```bash
   ln -s /path/to/AI-Playbook/.cursorrules .cursorrules
   ```

3. **Customize for your project**:
   - Edit `.cursorrules` with project-specific standards
   - Add tech stack information (React, Node.js, etc.)
   - Specify testing framework preferences
   - Include MYOB-specific coding conventions

### Example Project .cursorrules

```
# MYOB Project Cursor Rules

## Tech Stack
- TypeScript 5.x
- React 18.x  
- Node.js 20.x
- Jest for testing

## Coding Standards
- Follow MYOB TypeScript standards
- Use functional components in React
- Async/await for promises (no .then())
- ESLint and Prettier configurations must be followed

## Security Requirements
- Never hardcode credentials
- Use environment variables for config
- Validate all inputs
- Use Decimal for financial calculations

## Testing Requirements
- Write unit tests for all functions
- >80% code coverage required
- Use Jest with TypeScript
- Mock external dependencies

## AI-Specific Guidelines
- Generate TypeScript, not JavaScript
- Include JSDoc comments on public APIs
- Follow existing code patterns in codebase
- Use MYOB naming conventions (see docs/coding-standards.md)
```

## MCP Integration

Cursor has the best MCP support. See detailed guide: [MCP Usage Guide](../../feature-development/mcp-usage.md)

### Quick MCP Setup

1. **Create MCP config**: `~/.cursor/mcp.json` (Mac) or `%APPDATA%\Cursor\mcp.json` (Windows)

2. **Add MYOB MCPs**:
```json
{
  "mcpServers": {
    "glean": {
      "command": "npx",
      "args": ["-y", "@gleam/mcp-server"],
      "env": {
        "GLEAN_API_TOKEN": "your_token",
        "GLEAN_INSTANCE": "myob"
      }
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_pat"
      }
    }
  }
}
```

3. **Restart Cursor**

4. **Verify**: Settings → MCP → Check status

## Keyboard Shortcuts

### Essential Cursor Shortcuts

**AI Features:**
- `Cmd+K` (Mac) / `Ctrl+K` (Win): Inline edit (modify selected code)
- `Cmd+L` / `Ctrl+L`: Open/focus chat
- `Cmd+Shift+K` / `Ctrl+Shift+K`: Open Composer (multi-file edit)
- `Cmd+I` / `Ctrl+I`: Quick AI question
- `Tab`: Accept AI suggestion
- `Esc`: Reject AI suggestion

**Code Navigation:**
- `Cmd+P` / `Ctrl+P`: Quick file open
- `Cmd+Shift+F` / `Ctrl+Shift+F`: Search across files
- `Cmd+Click`: Go to definition
- `Cmd+Shift+O` / `Ctrl+Shift+O`: Go to symbol

**Cursor-Specific:**
- `Cmd+/` / `Ctrl+/`: Toggle AI in sidebar
- `Cmd+Shift+L` / `Ctrl+Shift+L`: Clear chat history
- `Cmd+Shift+P` / `Ctrl+Shift+P`: Command palette

### Creating Custom Keyboard Shortcuts

Settings → Keyboard Shortcuts → Search for command → Add keybinding

**Recommended Custom Shortcuts:**
- Toggle Normal/Max Mode: `Cmd+Shift+M`
- Accept all AI suggestions in file: `Cmd+Shift+A`
- Reject all AI suggestions: `Cmd+Shift+R`

## MYOB-Specific Configuration

### Code Style Settings

Match MYOB coding standards:

```json
{
  "editor.tabSize": 2,
  "editor.insertSpaces": true,
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "typescript.preferences.quoteStyle": "single",
  "typescript.preferences.importModuleSpecifier": "relative"
}
```

### Extensions for MYOB Development

**Essential:**
- ESLint
- Prettier
- TypeScript + JavaScript Language Features

**Recommended:**
- GitLens (Git history)
- Jest Test Explorer
- Thunder Client (API testing)

### Git Integration

```json
{
  "git.enableCommitSigning": true,
  "git.autofetch": true,
  "cursor.gitAutoCommitMessage": true // AI generates commit messages
}
```

### File Exclusions for MYOB

Create `.cursorignore` in project root:

```
# Sensitive files
.env
.env.*
*.key
*.pem
secrets/
credentials/

# MYOB-specific
myob-internal-config/
customer-data/
financial-records/

# Dependencies
node_modules/
vendor/
.venv/

# Build artifacts
dist/
build/
*.generated.*
```

## Best Practices

### Do:
- Use Cmd+K for focused edits to specific code sections
- Use Chat for questions and explanations
- Use Composer for multi-file changes
- Review AI-generated code before accepting
- Keep Cursor updated (auto-updates enabled)
- Use .cursorrules for consistent code generation
- Enable MCPs for MYOB context (Glean, GitHub)

### Don't:
- Accept all AI suggestions blindly
- Use Max Mode for simple tasks (costs more)
- Include sensitive data in prompts
- Disable security features Cursor recommends
- Skip code review because "AI generated it"

### When to Use Cursor vs Other Tools

**Use Cursor for:**
- Complex refactoring across multiple files
- Large context needs (understanding big codebases)
- MCP integration (Glean, Atlassian access)
- Composer for multi-file generation
- When you need better AI than Copilot

**Use VS Code + Copilot for:**
- Familiar environment (if VS Code expert)
- Simpler AI needs
- Extensions that aren't in Cursor yet

**Use Both:**
Many developers use Cursor for AI-heavy work and VS Code for certain tasks. Both can coexist.

## Learning Resources

### Official Cursor Learning Hub

**🎓 [Cursor Learn](https://cursor.com/learn)** - Comprehensive interactive learning resources:

**Core Features Tutorials:**
- **Tab for Autocomplete** - Master intelligent code completion
- **Cmd+K for Inline Edit** - Quick code edits and transformations  
- **Composer for Multi-file Edits** - Refactor across multiple files
- **AI Agent** - Let Cursor handle complex tasks autonomously

**Key Learning Topics:**
- Effective prompting techniques for better code generation
- Context management strategies (what to include, what to exclude)
- When to use Tab vs Cmd+K vs Composer vs Agent
- Model selection for different development tasks
- Real-world coding examples and workflows

### MYOB-Specific Learning Path

**For New Cursor Users:**

1. **Week 1** - Basic Features:
   - Complete [Tab tutorial](https://cursor.com/learn) for autocomplete
   - Learn Cmd+K for inline edits
   - Practice with simple functions

2. **Week 2** - Intermediate Features:
   - Master Chat for asking questions
   - Use Cursor to explain existing MYOB code
   - Practice generating tests

3. **Week 3** - Advanced Features:
   - Learn Composer for multi-file edits
   - Refactor a feature module
   - Use AI Agent for complex tasks

4. **Week 4** - MYOB Integration:
   - Configure MCPs ([Glean, Atlassian](../../feature-development/mcp-usage.md))
   - Set up MYOB Cursor Rules ([Rules for AI](../../appendix/rules-for-ai/README.md))
   - Apply to real MYOB development work

**Practice Exercises:**
- Generate a new TypeScript function with proper types
- Refactor code to use Decimal for financial calculations
- Create comprehensive tests for an existing feature
- Document a complex module with JSDoc comments
- Refactor authentication across multiple files with Composer

### Additional Resources

**MYOB Internal:**
- [AI Training Programs](../ai-training-programs.md) - Structured learning paths
- [Choosing the Right Model](../choosing-the-right-model.md) - Model selection guide
- [MCP Usage Guide](../../feature-development/mcp-usage.md) - Enterprise context
- [Prompt Library](../../appendix/prompt-library/README.md) - Reusable prompts

**Cursor Official:**
- [Cursor Documentation](https://docs.cursor.com) - Complete reference
- [Cursor Forum](https://forum.cursor.com) - Community support
- [Cursor Changelog](https://changelog.cursor.com) - Latest features

**Best Practices:**
- Start simple: Master Tab before moving to Composer
- Review all AI code: Never blindly accept suggestions
- Use appropriate models: Fast models for simple tasks, reasoning models for complex
- Leverage MCPs: Glean + Atlassian gives MYOB-specific context
- Follow MYOB standards: Use Cursor Rules to enforce patterns

## Troubleshooting

### AI Not Responding

**Check:**
- Internet connection
- Cursor subscription status (Settings → Account)
- Model availability (some models may be rate-limited)
- Error messages in Output panel (View → Output → Cursor)

**Try:**
- Restart Cursor
- Clear chat history (Cmd+Shift+L)
- Switch to different model
- Check Cursor status page

### MCPs Not Working

See [MCP Troubleshooting](../../feature-development/mcp-usage.md#troubleshooting)

**Quick fixes:**
- Verify mcp.json syntax (no trailing commas)
- Check API tokens are valid
- Restart Cursor after MCP config changes
- View logs: Help → Show Logs → Filter "MCP"

### Slow Performance

**If Cursor is slow:**
- Disable unused MCPs
- Reduce workspace size (close unnecessary folders)
- Exclude large directories (.cursorignore)
- Switch to faster model (GPT-4o instead of Claude)
- Disable extensions temporarily
- Check CPU/memory usage

### Code Suggestions Not Appearing

**Check:**
- AI enabled: Settings → Cursor → General → Enable AI
- Model selected: Settings → Cursor → Models
- File type supported (works best with .ts, .js, .py, etc.)
- Not in restricted file (check .cursorignore)

## Resources

- **🎓 Cursor Learn**: [cursor.com/learn](https://cursor.com/learn) - Interactive tutorials
- **Cursor Documentation**: [docs.cursor.com](https://docs.cursor.com) - Complete reference
- **Cursor Forum**: [forum.cursor.com](https://forum.cursor.com) - Community support
- **MYOB AI Tools**: [MYOB-Approved Tools](../../appendix/MYOB-approved-tools.md)
- **MCP Setup**: [MCP Usage Guide](../../feature-development/mcp-usage.md)

## Next Steps

1. **Configure MCPs**: [MCP Usage Guide](../../feature-development/mcp-usage.md)
2. **Learn Model Selection**: [Choosing the Right Model](../choosing-the-right-model.md)
3. **Start Coding**: [Feature Development](../../feature-development/README.md)

---

**Previous:** [← IDE Setup Overview](README.md) | **Next:** [GitHub Copilot Setup →](github-copilot-setup.md)

---


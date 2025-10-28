---
title: Cursor IDE Setup Guide
---

![MYOB Banner](../../../assets/images/myob-banner.png)

# Cursor IDE Setup Guide

## Overview

Cursor is an AI-first code editor built on VS Code, optimized for AI-assisted development. This guide walks you through setting up Cursor for MYOB development with best practices, configurations, and MCP integration.

## Table of Contents

- [Installation](#installation)
- [Initial Configuration](#initial-configuration)
- [Cursor Rules Setup](#cursor-rules-setup)
- [MCP Integration](#mcp-integration)
- [Keyboard Shortcuts](#keyboard-shortcuts)
- [MYOB-Specific Configuration](#myob-specific-configuration)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

## Installation

### System Requirements

- **macOS**: 10.15 (Catalina) or later
- **Windows**: Windows 10 version 1909 or later
- **Linux**: Ubuntu 18.04, Debian 10, or later
- **RAM**: 8GB minimum, 16GB+ recommended
- **Disk**: 1GB for Cursor, additional space for projects

### Download and Install

1. **Download Cursor**:
   - Visit [cursor.com](https://cursor.com)
   - Click "Download for [your OS]"
   - Current version: Check website for latest

2. **Install**:
   - **Mac**: Open .dmg file, drag Cursor to Applications
   - **Windows**: Run installer .exe file
   - **Linux**: Extract .tar.gz and run ./cursor

3. **First Launch**:
   - Accept privacy policy
   - Sign in with GitHub account (recommended) or email
   - Import VS Code settings (if migrating from VS Code)

### License and Pricing

**MYOB Enterprise License:**
- Contact IT/Procurement for enterprise license
- Team billing available
- See [MYOB-Approved Tools](../../appendix/MYOB-approved-tools.md) for license details

**Individual License Options:**
- Free tier: Limited AI requests
- Pro tier: Unlimited requests, advanced features
- Business tier: Team features, admin controls

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

- **Cursor Documentation**: [cursor.com/docs](https://cursor.com/docs)
- **Cursor Community**: [cursor.com/community](https://cursor.com/community)
- **MYOB AI Tools**: [MYOB-Approved Tools](../../appendix/MYOB-approved-tools.md)
- **MCP Setup**: [MCP Usage Guide](../../feature-development/mcp-usage.md)

## Next Steps

1. **Configure MCPs**: [MCP Usage Guide](../../feature-development/mcp-usage.md)
2. **Learn Model Selection**: [Choosing the Right Model](../choosing-the-right-model.md)
3. **Start Coding**: [Feature Development](../../feature-development/README.md)

---

**Previous:** [← IDE Setup Overview](README.md) | **Next:** [GitHub Copilot Setup →](github-copilot-setup.md)

---


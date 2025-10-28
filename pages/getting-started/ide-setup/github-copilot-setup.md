---
title: GitHub Copilot Setup Guide
---

![MYOB Banner](../../../assets/images/myob-banner.png)

# GitHub Copilot Setup Guide

## Overview

GitHub Copilot is an AI pair programmer that provides code completions and chat assistance directly in your IDE. This guide covers configuration for multiple IDEs with MYOB-specific settings and best practices.

**Before You Begin:**  
Request and install GitHub Copilot via MYOB's standard software process:
1. Request access via **Sailpoint Identity Now**
2. Install via **Kandji** (macOS) or **Windows Company Portal** (Windows)
3. Once installed, install the IDE extension and return to this guide for configuration

For licensing and approval details, see [MYOB-Approved Tools](../../appendix/MYOB-approved-tools.md).

## Table of Contents

- [Extension Setup by IDE](#extension-setup-by-ide)
- [Configuration](#configuration)
- [Copilot Chat](#copilot-chat)
- [MYOB-Specific Settings](#myob-specific-settings)
- [Best Practices](#best-practices)
- [Limitations](#limitations)

## Extension Setup by IDE

After receiving Copilot access, install the extension in your IDE:

### VS Code (Recommended)

1. **Install Extensions**:
   - Open VS Code Extensions (Cmd+Shift+X / Ctrl+Shift+X)
   - Search for "GitHub Copilot"
   - Install both extensions:
     - **GitHub Copilot** (code completions)
     - **GitHub Copilot Chat** (chat interface)

2. **Sign In**:
   - Click "Sign in to GitHub" when prompted
   - Authorize in browser with your MYOB GitHub account
   - Verify Copilot icon appears in status bar

3. **Verify**:
   - Type a comment: `// function to calculate GST`
   - Copilot should show suggestions in grey text

### JetBrains IDEs (IntelliJ, WebStorm, PyCharm)

1. **Install Plugin**:
   - File → Settings → Plugins (or Preferences on Mac)
   - Search "GitHub Copilot"
   - Click Install, then restart IDE

2. **Authenticate**:
   - Tools → GitHub Copilot → Login
   - Authorize in browser
   - Enable suggestions in Settings → Tools → GitHub Copilot

### Visual Studio (Windows)

1. **Install Extension**:
   - Extensions → Manage Extensions
   - Search "GitHub Copilot"
   - Download, install, and restart

2. **Sign In**:
   - Tools → Options → GitHub Copilot
   - Sign in and authorize with your MYOB GitHub account

### Neovim/Vim

1. **Install Plugin** (using vim-plug):
   ```vim
   Plug 'github/copilot.vim'
   ```

2. **Setup and Authenticate**:
   ```vim
   :Copilot setup
   ```
   Follow authentication prompts in your browser

## Configuration

### VS Code Settings

```json
{
  // Enable Copilot
  "github.copilot.enable": {
    "*": true,
    "yaml": false, // Disable for certain file types
    "markdown": false
  },
  
  // Suggestion settings
  "github.copilot.editor.enableAutoCompletions": true,
  "github.copilot.editor.enableCodeActions": true,
  
  // Chat settings
  "github.copilot.chat.enable": true,
  "github.copilot.chat.useProjectContext": true,
  
  // Privacy
  "github.copilot.advanced": {
    "debug.overrideEngine": "", // Use default model
    "inlineSuggest.count": 3 // Number of suggestions to show
  }
}
```

### Disable Copilot for Sensitive Files

Create `.copilotignore` in project root:

```
# Sensitive files
.env
.env.*
*.key
*.pem
secrets/
credentials/

# MYOB-specific
customer-data/
financial-records/
myob-internal-config/
```

Or use VS Code settings:

```json
{
  "github.copilot.enable": {
    "*": true,
    ".env": false,
    "*.key": false,
    "credentials/*": false
  }
}
```

## Copilot Chat

### Enabling Chat

**VS Code:**
- Install "GitHub Copilot Chat" extension
- Chat panel appears in sidebar
- Or use inline: Cmd+I (Mac) / Ctrl+I (Win)

**JetBrains:**
- Included in Copilot plugin
- Right-click code → GitHub Copilot → Chat

### Using Copilot Chat Effectively

**For Questions:**
```
Q: How does async/await work in TypeScript?
Q: Explain this calculateTax function
Q: What's the difference between map and forEach?
```

**For Code Generation:**
```
Generate a function that validates Australian Business Numbers (ABN)
```

**For Debugging:**
```
Why is this function returning undefined?

[paste function code]
```

**For Refactoring:**
```
Refactor this to use async/await instead of promises

[paste code]
```

### Chat Slash Commands

**VS Code Copilot Chat:**
- `/explain`: Explain selected code
- `/fix`: Suggest fixes for problems
- `/tests`: Generate unit tests
- `/help`: Show available commands

## MYOB-Specific Settings

### Coding Standards Integration

Add MYOB standards to workspace settings:

```json
{
  // TypeScript
  "typescript.preferences.quoteStyle": "single",
  "typescript.preferences.importModuleSpecifier": "relative",
  
  // Formatting
  "editor.formatOnSave": true,
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  
  // Linting
  "eslint.enable": true,
  "eslint.autoFixOnSave": true,
  
  // MYOB-specific
  "files.exclude": {
    "**/.env": true,
    "**/customer-data": true
  }
}
```

### Integration with MYOB Workflows

**Git Workflow:**
```json
{
  "git.enableSmartCommit": true,
  "git.confirmSync": false,
  "git.autofetch": true
}
```

**Jira Integration:**
- Install Jira extension
- Link commits to Jira tickets
- Copilot can reference Jira ticket numbers in generated code comments

## Best Practices

### Accepting Suggestions

**Do:**
- Read suggestions before accepting (Tab)
- Verify logic, especially for financial calculations
- Check for hardcoded values or secrets
- Test AI-generated code
- Review security implications

**Don't:**
- Blindly tab through all suggestions
- Accept without understanding what code does
- Trust financial calculations without verification
- Skip code review for AI-generated code

### Writing Effective Comments for Suggestions

Copilot uses comments as prompts:

**Good Comments:**
```typescript
// Function to calculate GST (10%) for Australian businesses
// Takes gross amount (GST-inclusive) and returns GST component
// Uses Decimal for precision, rounds to 2 decimal places
```

**Poor Comments:**
```typescript
// calculate gst
```

The more specific your comment, the better the suggestion.

### Copilot Chat Prompting

**Be specific:**
❌ "Write a function"
✅ "Write a TypeScript function that validates email addresses using regex"

**Provide context:**
❌ "Fix this bug"
✅ "This function should return a Decimal but returns undefined when amount is zero. Fix it."

**Include requirements:**
❌ "Generate tests"
✅ "Generate Jest unit tests for this function covering: normal case, zero, negative, very large numbers"

## Limitations

### What Copilot Can't Do

Compared to Cursor:
- ❌ No MCP support (can't access Glean, Atlassian)
- ❌ No multi-file refactoring (single file at a time)
- ❌ Limited context window (smaller than Cursor)
- ❌ No Composer-like multi-file generation
- ❌ Can't choose models (uses GitHub's models only)

### When to Use Cursor Instead

**Use Cursor for:**
- Large refactorings across many files
- Understanding large codebases
- Accessing MYOB internal documentation (via Glean MCP)
- Complex architectural questions
- When you need specific models (o1, Claude, etc.)

**Use Copilot for:**
- Quick inline completions
- Familiar VS Code environment
- Simple code generation
- When you don't need MCPs or advanced features

### Copilot in JetBrains vs VS Code

**VS Code Copilot:**
- Best experience (native integration)
- Copilot Chat fully featured
- Frequent updates

**JetBrains Copilot:**
- Good inline completions
- Chat less featured than VS Code
- Integration improving but not as mature

**Recommendation**: Use VS Code for best Copilot experience, or use Cursor for best overall AI experience.

## MYOB Context

### Using Copilot with MYOB Coding Standards

**Include standards in comments:**
```typescript
// Following MYOB TypeScript standards:
// - Use interfaces for data structures
// - Async functions for API calls
// - Decimal for all financial calculations
// - Comprehensive error handling

interface PaymentRequest {
  // Copilot will follow the pattern you start
}
```

### Financial Domain Code Generation

**Be explicit about precision:**
```typescript
// Calculate tax using Decimal library (never use number for money)
// Round to 2 decimal places using half-up rounding
// Return type should be Decimal not number
```

### Compliance and Security

**Copilot doesn't know MYOB-specific compliance:**
- Always review generated code for compliance requirements
- Add comments specifying regulatory needs
- Validate financial calculations independently
- Include audit trail requirements in comments

## Resources

- **GitHub Copilot Docs**: [github.com/features/copilot](https://github.com/features/copilot)
- **VS Code Copilot**: [code.visualstudio.com/docs/copilot](https://code.visualstudio.com/docs/editor/github-copilot)
- **Copilot Chat**: [docs.github.com/copilot/using-github-copilot/asking-github-copilot-questions](https://docs.github.com/en/copilot/using-github-copilot/asking-github-copilot-questions-in-your-ide)

## Next Steps

1. **Compare Tools**: [Copilot vs Cursor](copilot-vs-cursor.md)
2. **Learn Prompting**: [Prompting Best Practices](../../appendix/prompt-library/prompting-best-practices.md)
3. **Start Coding**: [Feature Development](../../feature-development/README.md)

---

**Previous:** [← Cursor Setup](cursor-setup.md) | **Next:** [Copilot vs Cursor →](copilot-vs-cursor.md)

---


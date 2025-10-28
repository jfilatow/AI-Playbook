---
title: GitHub Copilot Setup Guide
---

![MYOB Banner](../../../assets/images/myob-banner.png)

# GitHub Copilot Setup Guide

## Overview

GitHub Copilot is an AI pair programmer that provides code completions and chat assistance directly in your IDE. This guide covers setup for multiple IDEs with MYOB-specific configurations and best practices.

## Table of Contents

- [Installation by IDE](#installation-by-ide)
- [Configuration](#configuration)
- [Copilot Chat](#copilot-chat)
- [MYOB-Specific Settings](#myob-specific-settings)
- [Best Practices](#best-practices)
- [Limitations](#limitations)

## Installation by IDE

### VS Code (Recommended)

1. **Install Extension**:
   - Open VS Code
   - Go to Extensions (Cmd+Shift+X)
   - Search for "GitHub Copilot"
   - Click Install on both:
     - GitHub Copilot (main extension)
     - GitHub Copilot Chat

2. **Sign In**:
   - Click "Sign in to GitHub" when prompted
   - Authorize VS Code in browser
   - Verify you have Copilot access

3. **Verify Installation**:
   - Status bar should show Copilot icon
   - Try typing a comment: `// function to calculate GST`
   - Copilot should suggest code

### JetBrains IDEs (IntelliJ, WebStorm, PyCharm)

1. **Install Plugin**:
   - File → Settings → Plugins
   - Search "GitHub Copilot"
   - Click Install
   - Restart IDE

2. **Sign In**:
   - Tools → GitHub Copilot → Login
   - Authorize in browser
   - Return to IDE

3. **Configure**:
   - Settings → Tools → GitHub Copilot
   - Enable suggestions
   - Configure keybindings

### Visual Studio (Windows)

1. **Install Extension**:
   - Extensions → Manage Extensions
   - Search "GitHub Copilot"
   - Download and install
   - Restart Visual Studio

2. **Sign In**:
   - Tools → Options → GitHub Copilot
   - Sign in to GitHub account
   - Authorize extension

### Neovim/Vim

1. **Install Plugin**:
   ```vim
   " Using vim-plug
   Plug 'github/copilot.vim'
   ```

2. **Setup**:
   ```vim
   :Copilot setup
   ```

3. **Authenticate**: Follow prompts

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


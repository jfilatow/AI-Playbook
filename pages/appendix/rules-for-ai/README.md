---
title: Rules for AI Coding Assistants
---

![MYOB Banner](../../../assets/images/myob-banner.png)

# Rules for AI Coding Assistants

## Overview

AI Rules (also called Instructions or Context Files) are configuration files that define consistent standards, patterns, and conventions for AI coding assistants. They ensure your AI tools generate code that matches your team's coding style, architecture patterns, and best practices.

**Why Rules Matter:**
- ✅ Consistent code generation across team members
- ✅ Enforce architecture patterns and coding standards
- ✅ Reduce code review overhead
- ✅ Onboard AI to your codebase faster
- ✅ Version-controlled alongside your code

## Table of Contents

- [How Different IDEs Handle Rules](#how-different-ides-handle-rules)
- [Cursor Rules](#cursor-rules)
- [GitHub Copilot Instructions](#github-copilot-instructions)
- [Other IDE Rules](#other-ide-rules)
- [Managing Rules with agents.md](#managing-rules-with-agentsmd)
- [MYOB Language-Specific Rules](#myob-language-specific-rules)
- [Best Practices](#best-practices)

## How Different IDEs Handle Rules

Each AI coding assistant has its own method for defining and managing rules:

| IDE | Rules Format | Location | Scope | Multi-file Support |
|-----|-------------|----------|-------|-------------------|
| **Cursor** | `.mdc` files | `.cursor/rules/` | Project-wide | ✅ Yes (multiple .mdc files) |
| **GitHub Copilot** | `.github/copilot-instructions.md` | `.github/` | Repository-wide | ❌ No (single file) |
| **VS Code (Cline)** | `.clinerules` | Project root | Project-wide | ✅ Yes (via includes) |
| **JetBrains** | AI Assistant settings | IDE settings | User or project | ⚠️ Limited |
| **Windsurf** | `.windsurfrules` | Project root | Project-wide | ✅ Yes |

### Key Differences

**Cursor:**
- Most flexible with multiple `.mdc` files
- Supports glob patterns to apply rules to specific file types
- Rules are automatically loaded and applied
- Best for complex projects with multiple tech stacks

**GitHub Copilot:**
- Single instructions file (`.github/copilot-instructions.md`)
- Simpler but less flexible
- Applied across entire repository
- Best for smaller projects or consistent tech stacks

**Other IDEs:**
- Varying levels of support and maturity
- Some require manual configuration
- Check documentation for your specific IDE

## Cursor Rules

### What Are Cursor Rules?

Cursor Rules are markdown files (`.mdc` extension) stored in `.cursor/rules/` that tell Cursor how to generate code for your project.

### File Structure

```
.cursor/
└── rules/
    ├── general.mdc           # General coding standards
    ├── api-design.mdc        # API patterns
    ├── database.mdc          # Database patterns
    ├── testing.mdc           # Testing standards
    └── security.mdc          # Security requirements
```

### Rule File Format

Each `.mdc` file uses YAML frontmatter to define scope:

```markdown
---
description: API Testing Standards
globs: tests/**/*.js
---

# API Testing Standards

## Test Structure
- Use describe blocks for grouping
- Use beforeEach for setup
- One assertion per test

## Example
\`\`\`javascript
describe('GET /api/users', () => {
  test('should return users list', async () => {
    const response = await request(app).get('/api/users')
    expect(response.status).toBe(200)
  })
})
\`\`\`
```

### Glob Patterns

Target specific files with glob patterns:

```yaml
---
description: React Component Standards
globs: src/components/**/*.tsx
---
```

Common patterns:
- `*.js` - All JavaScript files
- `src/**/*.tsx` - All TypeScript React files in src/
- `tests/**/*.test.js` - All test files

### Creating Cursor Rules

1. **Create `.cursor/rules/` directory** in your project root
2. **Add `.mdc` files** for each domain (API, database, testing, etc.)
3. **Define standards** with clear examples
4. **Commit to version control** so the team shares rules

**Example:**

```markdown
---
description: MongoDB Patterns
globs: src/repositories/**/*.js
---

# MongoDB Patterns

## Always Use ObjectIds
- Store IDs as ObjectId, never as strings
- Convert string IDs to ObjectIds in factory functions

\`\`\`javascript
// Good
parentId: new ObjectId(data.parentId)

// Bad
parentId: data.parentId  // String ID
\`\`\`
```

## GitHub Copilot Instructions

### What Are Copilot Instructions?

GitHub Copilot Instructions are markdown files that provide context and guidelines to Copilot about your codebase standards.

### File Location

Create a single file:
```
.github/
└── copilot-instructions.md
```

### Instructions Format

Unlike Cursor's multiple files, Copilot uses one comprehensive markdown file:

```markdown
# GitHub Copilot Instructions

## Language and Framework
- Language: TypeScript
- Framework: React + Next.js
- Testing: Jest + React Testing Library

## Code Standards
### Naming Conventions
- Use PascalCase for components
- Use camelCase for functions and variables
- Use SCREAMING_SNAKE_CASE for constants

### React Patterns
- Always use functional components
- Use hooks (useState, useEffect) not classes
- Destructure props in function parameters

## Example Component
\`\`\`typescript
interface ButtonProps {
  label: string
  onClick: () => void
}

export const Button: React.FC<ButtonProps> = ({ label, onClick }) => {
  return <button onClick={onClick}>{label}</button>
}
\`\`\`

## Testing Requirements
- Write tests for all components
- Test user interactions, not implementation
- Use data-testid for element selection
```

### Key Differences from Cursor Rules

| Aspect | Cursor | Copilot |
|--------|--------|---------|
| **Files** | Multiple `.mdc` files | Single `.md` file |
| **Scope** | Per-file-type via globs | Repository-wide |
| **Complexity** | Supports complex organization | Simpler, flat structure |
| **Flexibility** | High (separate rules per domain) | Lower (all in one file) |

### When to Use Copilot Instructions

✅ **Good for:**
- Smaller codebases
- Single tech stack projects
- Teams using VS Code, JetBrains, or GitHub Codespaces
- When you want simpler configuration

❌ **Not ideal for:**
- Multi-language projects (Copilot can't apply different rules to different files)
- Complex projects with many patterns
- Projects needing fine-grained control

## Other IDE Rules

### VS Code (Cline Extension)

**File:** `.clinerules` in project root

```markdown
# Cline Rules

## Code Style
- TypeScript strict mode
- Use async/await for asynchronous operations
- Follow Airbnb style guide
```

### JetBrains (AI Assistant)

**Location:** Settings → Tools → AI Assistant

- Configure via IDE settings (not version-controlled by default)
- Can export settings for team sharing
- Less mature than Cursor/Copilot

### Windsurf

**File:** `.windsurfrules` in project root

Similar to Cursor but with different syntax - check Windsurf documentation.

## Managing Rules with agents.md

> **📖 Comprehensive Guide:** For detailed information about agents.md, see our dedicated page: **[agents.md - Universal AI Coding Rules](agents-md-standard.md)**

### The Problem: Cross-IDE Rule Management

If your team uses **different IDEs** (some use Cursor, some use Copilot, some use JetBrains), managing rules becomes challenging:

- ❌ Duplicate rules across different formats
- ❌ Rules get out of sync
- ❌ Hard to maintain consistency
- ❌ Coding agents need guidance for each IDE

### The Solution: agents.md

**[agents.md](https://agents.md/)** is an emerging standard for defining AI coding agent rules in an IDE-agnostic way.

**What is agents.md?**
- Universal format for AI coding rules
- Works across multiple IDEs and AI tools
- Single source of truth for coding standards
- Designed for coding agents to navigate and understand

**File:** `agents.md` in project root

```markdown
# Coding Standards for AI Agents

## Project Information
- **Name:** MYOB Payment Service
- **Stack:** TypeScript, Node.js, MongoDB, Hapi.js
- **Patterns:** RESTful API, Repository pattern

## File Structure
- `/src/api/` - API routes and handlers
- `/src/services/` - Business logic
- `/src/repositories/` - Data access
- `/src/utils/` - Utility functions

## Coding Standards
### TypeScript
- Use strict mode
- Explicit return types on functions
- Avoid `any` type

### API Design
- RESTful conventions
- Versioned APIs (`/api/v1/`)
- Proper HTTP status codes

### Database
- MongoDB with native driver
- ObjectIds for all IDs and foreign keys
- Schema validation at database level

## Testing
- Jest for unit and integration tests
- Minimum 90% coverage
- Test behavior, not implementation
```

### Why Use agents.md for Multi-IDE Teams

✅ **Benefits:**
- **Single source of truth** - One file for all AI tools
- **IDE-agnostic** - Works with Cursor, Copilot, and future tools
- **Agent-optimized** - Designed for AI agents to parse and navigate
- **Version-controlled** - Keep with your code
- **Team alignment** - Everyone follows same standards regardless of IDE

### How to Use agents.md

1. **Create `agents.md`** in your project root
2. **Define comprehensive coding standards** (see template above)
3. **Reference from IDE-specific rules**:

**In `.cursor/rules/general.mdc`:**
```markdown
---
description: General Standards
globs: *.*
---

# General Standards

For comprehensive project standards, see `agents.md` in project root.

This file supplements those standards with Cursor-specific guidance.
```

**In `.github/copilot-instructions.md`:**
```markdown
# GitHub Copilot Instructions

> **Note:** Comprehensive coding standards are in `agents.md`. This file highlights key patterns for Copilot.
```

### MYOB Recommendation for Multi-IDE Teams

**If your team uses different IDEs:**
1. ✅ **Start with `agents.md`** - Create comprehensive standards
2. ✅ **Add IDE-specific supplements** - Cursor rules, Copilot instructions
3. ✅ **Keep agents.md as primary source** - Update it first, then sync IDE files
4. ✅ **Use agents.md for coding agent tools** - Tools can parse and navigate it

**If your team is standardized on one IDE:**
- Use that IDE's native format (Cursor rules or Copilot instructions)
- `agents.md` is optional but still recommended for future compatibility

## MYOB Language-Specific Rules

MYOB provides example rules for common technology stacks used within the company:

### Node.js Rules

#### Frontend (React, Hapi.js, Nunjucks)
- [Node.js Cursor Rules - Frontend](nodejs/nodejs-cursorrules-frontend.md)
- Covers: GOV.UK frontend patterns, Nunjucks templates, API integration, Playwright testing

#### Backend (Hapi.js, MongoDB)
- [Node.js Cursor Rules - Backend](nodejs/nodejs-cursorrules-bakend.md)
- Covers: RESTful API patterns, MongoDB patterns, Hapi.js conventions, testing

### Python Rules

#### Backend (FastAPI, MongoDB)
- [Python Cursor Rules - Backend](python/python-cursorrules-backend.md)
- Covers: FastAPI patterns, MongoDB mocking, async testing, code style

### How to Use These Examples

1. **Copy relevant files** to your project's `.cursor/rules/` directory
2. **Customize** for your specific project needs
3. **Add or remove** rules based on your tech stack
4. **Keep updated** as your standards evolve

## Best Practices

### 1. Start Simple, Grow Organically

**Don't:**
- Create 50 rule files on day one
- Over-specify every detail

**Do:**
- Start with 3-5 key rules (code style, API patterns, testing)
- Add rules as patterns emerge
- Refine based on what AI gets wrong

### 2. Include Examples

AI learns better from examples than from abstract rules:

```markdown
## Bad Example (No Examples)
Use proper error handling.

## Good Example (With Examples)
Use try/catch for async operations:

\`\`\`typescript
async function fetchData() {
  try {
    const result = await api.get('/data')
    return result
  } catch (error) {
    logger.error('Failed to fetch data', error)
    throw new AppError('Data fetch failed')
  }
}
\`\`\`
```

### 3. Be Specific, Not Generic

```markdown
## Bad (Generic)
Write clean code.

## Good (Specific)
- Functions should have single responsibility
- Maximum function length: 50 lines
- Maximum nesting depth: 3 levels
- Use early returns to avoid nesting
```

### 4. Keep Rules DRY (Don't Repeat Yourself)

If using `agents.md` + IDE-specific rules:
- Put common standards in `agents.md`
- Put IDE-specific features in IDE rules
- Reference `agents.md` from IDE rules

### 5. Version Control Everything

```bash
# Commit all rule files
git add .cursor/rules/
git add .github/copilot-instructions.md
git add agents.md
git commit -m "feat: add AI coding rules for team consistency"
```

### 6. Review and Update Regularly

- **Monthly:** Review if rules are being followed
- **Quarterly:** Update for new patterns or tech changes
- **When onboarding:** Have new team members review rules
- **After code reviews:** Add rules for common issues

### 7. Test Your Rules

Generate code with AI and verify it follows your rules:

1. Ask AI to generate a function
2. Check if it matches your standards
3. If not, refine your rule with better examples
4. Iterate until AI consistently follows rules

## Creating Your First Rule File

### For Cursor Users

1. **Create directory:**
   ```bash
   mkdir -p .cursor/rules
   ```

2. **Create your first rule:**
   ```bash
   touch .cursor/rules/api-standards.mdc
   ```

3. **Add content:**
   ```markdown
   ---
   description: API Standards
   globs: src/api/**/*.ts
   ---

   # API Standards

   ## HTTP Methods
   - GET: Retrieve resources
   - POST: Create resources (return 201)
   - PUT: Update resources (return 200)
   - DELETE: Delete resources (return 204)

   ## Error Responses
   \`\`\`typescript
   {
     statusCode: number
     error: string
     message: string
     details?: any
   }
   \`\`\`
   ```

4. **Test it:**
   - Open a file matching the glob pattern
   - Ask Cursor to generate an API endpoint
   - Verify it follows your standards

### For Copilot Users

1. **Create directory:**
   ```bash
   mkdir -p .github
   ```

2. **Create instructions file:**
   ```bash
   touch .github/copilot-instructions.md
   ```

3. **Add content:**
   ```markdown
   # GitHub Copilot Instructions

   ## Project Stack
   - TypeScript
   - React
   - Node.js + Express

   ## Coding Standards
   ### TypeScript
   - Use strict mode
   - Explicit types on function returns
   - Avoid `any`

   ### React
   - Functional components only
   - Use hooks (useState, useEffect)
   - Props interface for all components

   ### API
   - RESTful conventions
   - Proper HTTP status codes
   - JSON responses
   ```

4. **Commit and test:**
   ```bash
   git add .github/copilot-instructions.md
   git commit -m "feat: add Copilot instructions"
   ```

### For Multi-IDE Teams

1. **Create `agents.md`:**
   ```bash
   touch agents.md
   ```

2. **Add comprehensive standards** (see [agents.md template](#managing-rules-with-agentsmd) above)

3. **Create IDE-specific supplements:**
   - `.cursor/rules/` for Cursor users
   - `.github/copilot-instructions.md` for Copilot users

4. **Reference `agents.md` from IDE files:**
   ```markdown
   For complete standards, see `agents.md` in project root.
   ```

## Resources

### Official Documentation
- [Cursor Rules Documentation](https://docs.cursor.com/context/rules)
- [GitHub Copilot Instructions](https://docs.github.com/en/copilot)
- [agents.md Standard](https://agents.md/)

### MYOB Resources
- [MYOB-Approved Tools](../MYOB-approved-tools.md) - AI tools approved for use at MYOB
- [AI Training Programs](../../getting-started/ai-training-programs.md) - Learn to use AI coding assistants
- [Prompt Library](../prompt-library/README.md) - Reusable prompts for common tasks

---

**Previous:** [← Prompt Library](../prompt-library/README.md) | **Next:** [MYOB Approved Tools →](../MYOB-approved-tools.md)

---

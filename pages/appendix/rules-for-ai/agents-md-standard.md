---
title: agents.md - Universal AI Coding Rules
---

![MYOB Banner](../../../assets/images/myob-banner.png)

# agents.md - Universal AI Coding Rules

## Overview

[agents.md](https://agents.md/) is an emerging open standard for defining AI coding assistant rules in an IDE-agnostic, agent-friendly format. It solves the problem of managing rules across different AI tools and IDEs.

## The Problem

**Scenario:** Your team uses different AI coding assistants:
- Some developers use Cursor
- Some use GitHub Copilot
- Some use JetBrains AI Assistant
- Some use VS Code with Cline

**Challenges:**
- Each tool has its own rules format (`.cursor/rules/`, `.github/copilot-instructions.md`, etc.)
- Rules duplicate across formats and drift out of sync
- Maintaining consistency is difficult
- Coding agents struggle to navigate multiple rule formats

## The Solution: agents.md

A single, universal file that works across all AI tools and coding agents.

### What is agents.md?

- **Universal format**: Works with Cursor, Copilot, and other AI tools
- **Agent-optimized**: Designed for AI agents to parse and navigate
- **Single source of truth**: One file for all coding standards
- **Version-controlled**: Lives with your code in the repository
- **Future-proof**: As new AI tools emerge, they can use agents.md

## File Structure

Create `agents.md` in your project root:

```
your-project/
├── agents.md                      # Universal AI rules (✅ Primary)
├── .cursor/rules/                 # Cursor-specific supplements
├── .github/copilot-instructions.md # Copilot-specific supplements
└── src/
```

## agents.md Template

Here's a comprehensive template for MYOB projects:

```markdown
# Coding Standards for AI Agents

## Project Overview

### Project Information
- **Name:** MYOB [Project Name]
- **Description:** [Brief project description]
- **Domain:** [Financial Software / Internal Tool / Platform Service]

### Technology Stack
- **Language:** TypeScript / JavaScript / Python
- **Framework:** [React / Hapi.js / FastAPI]
- **Database:** MongoDB / PostgreSQL / DynamoDB
- **Testing:** Jest / Pytest / Playwright
- **Build:** Webpack / Vite / npm

## Repository Structure

### Directory Layout
\`\`\`
/src
  /api/v1/          # API endpoints (versioned)
  /services/        # Business logic
  /repositories/    # Data access layer
  /utils/           # Utility functions
  /config/          # Configuration management
  /models/          # Data models and types
/tests              # Test files
  /unit/           # Unit tests
  /integration/    # Integration tests
  /e2e/            # End-to-end tests
/docs              # Documentation
\`\`\`

### File Naming Conventions
- Use kebab-case for files: `user-service.ts`
- Use PascalCase for classes: `UserService`
- Use camelCase for functions: `getUserById`
- Test files: `*.test.ts` or `*.spec.ts`

## Coding Standards

### Language-Specific Standards

#### TypeScript
- **Strict Mode**: Always use \`"strict": true\` in tsconfig.json
- **Type Annotations**: Explicit return types on all exported functions
- **No Any**: Avoid \`any\` type; use \`unknown\` if truly unknown
- **Interfaces Over Types**: Use interfaces for object shapes, types for unions/primitives

\`\`\`typescript
// Good
export interface User {
  id: string
  name: string
  email: string
}

export async function getUserById(id: string): Promise<User> {
  // Implementation
}

// Bad
export function getUserById(id) {  // Missing types
  // Implementation
}
\`\`\`

#### Financial Calculations
**Critical for MYOB:** Never use \`number\` for money!

\`\`\`typescript
import { Decimal } from 'decimal.js'

// Good
interface Invoice {
  amount: Decimal  // Precise financial calculations
  gstAmount: Decimal
}

// Bad
interface Invoice {
  amount: number  // Floating point errors!
}
\`\`\`

- Always use \`Decimal\` library for financial amounts
- Round to 2 decimal places for currency: \`.toDecimalPlaces(2)\`
- Use half-up rounding (standard accounting method)

### Architecture Patterns

#### API Design
- **RESTful Conventions**: Use proper HTTP methods and status codes
- **Versioned APIs**: All APIs in \`/api/v1/\` namespace
- **Consistent Responses**: Standard response envelopes

\`\`\`typescript
// Standard API response format
interface ApiResponse<T> {
  data: T
  meta?: {
    page?: number
    limit?: number
    total?: number
  }
  errors?: ApiError[]
}

// Standard error format
interface ApiError {
  statusCode: number
  error: string
  message: string
  details?: unknown
}
\`\`\`

#### HTTP Status Codes
- \`200 OK\` - Successful GET, PUT
- \`201 Created\` - Successful POST
- \`204 No Content\` - Successful DELETE (always, even if resource didn't exist)
- \`400 Bad Request\` - Validation error
- \`401 Unauthorized\` - Missing/invalid auth
- \`403 Forbidden\` - Valid auth, insufficient permissions
- \`404 Not Found\` - Resource not found
- \`409 Conflict\` - Duplicate resource
- \`500 Internal Server Error\` - Server error

#### Repository Pattern
\`\`\`typescript
// Repository handles data access only
class UserRepository {
  constructor(private db: Database) {}
  
  async findById(id: string): Promise<User | null> {
    return this.db.collection('users').findOne({ _id: new ObjectId(id) })
  }
}

// Service handles business logic
class UserService {
  constructor(private repository: UserRepository) {}
  
  async getUser(id: string): Promise<User> {
    const user = await this.repository.findById(id)
    if (!user) {
      throw new NotFoundError('User not found')
    }
    return user
  }
}
\`\`\`

### Database Patterns

#### MongoDB
- **ObjectIds**: Always use \`ObjectId\` for \`_id\` and foreign keys, never strings
- **Schema Validation**: Define validation at database level
- **Indexes**: Index all foreign key fields

\`\`\`typescript
// Good: ObjectIds for IDs
import { ObjectId } from 'mongodb'

interface User {
  _id: ObjectId
  companyId: ObjectId  // Foreign key as ObjectId
  name: string
}

// Convert strings to ObjectIds
const userId = new ObjectId(userIdString)

// Bad: String IDs
interface User {
  _id: string  // ❌ Should be ObjectId
  companyId: string  // ❌ Should be ObjectId
}
\`\`\`

### Error Handling

#### Async Operations
- Always use try/catch for async operations
- Create custom error classes for domain errors
- Never expose sensitive data in error messages
- Log errors with correlation IDs

\`\`\`typescript
// Custom error classes
class AppError extends Error {
  constructor(
    message: string,
    public statusCode: number,
    public code: string
  ) {
    super(message)
  }
}

class NotFoundError extends AppError {
  constructor(message: string) {
    super(message, 404, 'NOT_FOUND')
  }
}

// Proper async error handling
async function processPayment(paymentData: PaymentData): Promise<Payment> {
  try {
    const validated = await validatePayment(paymentData)
    const result = await paymentGateway.charge(validated)
    await auditLogger.logPayment(result)
    return result
  } catch (error) {
    logger.error('Payment processing failed', { 
      error, 
      paymentId: paymentData.id,
      correlationId: getCorrelationId()
    })
    
    if (error instanceof ValidationError) {
      throw new AppError('Invalid payment data', 400, 'VALIDATION_ERROR')
    }
    
    throw new AppError('Payment processing failed', 500, 'PAYMENT_ERROR')
  }
}
\`\`\`

### Testing Standards

#### Test Philosophy
- **Test behavior, not implementation**: Focus on user-visible outcomes
- **Integration over isolation**: Prefer testing multiple units together
- **Mock external dependencies only**: Database, APIs, third-party services
- **Follow Given-When-Then pattern**

#### Test Structure
\`\`\`typescript
describe('UserService', () => {
  describe('getUser', () => {
    test('should return user when found', async () => {
      // Given: A user exists in the database
      const userId = 'user-123'
      const expectedUser = { id: userId, name: 'John Doe' }
      mockRepository.findById.mockResolvedValue(expectedUser)
      
      // When: Getting the user
      const result = await userService.getUser(userId)
      
      // Then: Should return the user
      expect(result).toEqual(expectedUser)
      expect(mockRepository.findById).toHaveBeenCalledWith(userId)
    })
    
    test('should throw NotFoundError when user not found', async () => {
      // Given: User does not exist
      mockRepository.findById.mockResolvedValue(null)
      
      // When/Then: Should throw error
      await expect(userService.getUser('nonexistent'))
        .rejects
        .toThrow(NotFoundError)
    })
  })
})
\`\`\`

#### Test Coverage
- **Minimum coverage**: 90% for production code
- **Test cases**: Happy path, error cases, edge cases
- **Assertions**: Validate status codes first, then response bodies

### Security Standards

#### Input Validation
- Validate ALL user inputs
- Sanitize outputs to prevent injection
- Use schema validation (Joi, Zod, Pydantic)

\`\`\`typescript
import Joi from 'joi'

const createUserSchema = Joi.object({
  name: Joi.string().min(1).max(100).required(),
  email: Joi.string().email().required(),
  age: Joi.number().min(18).max(120).optional()
})

// Validate before processing
const validated = await createUserSchema.validateAsync(requestData)
\`\`\`

#### Authentication & Authorization
- Never store passwords in plain text
- Use bcrypt for password hashing
- Implement JWT with short expiry
- Check authorization at service layer

#### Secrets Management
- Never hardcode secrets in code
- Use environment variables
- Reference secrets via config management

\`\`\`typescript
// Good
const apiKey = process.env.API_KEY

// Bad
const apiKey = 'sk_live_1234567890'  // ❌ Hardcoded secret
\`\`\`

### Logging and Observability

#### Structured Logging
\`\`\`typescript
interface LogEntry {
  timestamp: string
  level: 'debug' | 'info' | 'warn' | 'error'
  message: string
  correlationId: string
  userId?: string
  service: string
  operation: string
  duration?: number
  metadata?: Record<string, unknown>
}

// Good logging
logger.info('User created successfully', {
  correlationId: req.correlationId,
  userId: user.id,
  operation: 'create_user',
  duration: Date.now() - startTime
})

// Bad logging
console.log('User created')  // ❌ Not structured, no context
\`\`\`

#### Audit Logging
For financial operations, maintain comprehensive audit trails:

\`\`\`typescript
interface AuditLog {
  id: string
  timestamp: Date
  userId: string
  action: string
  resource: string
  resourceId: string
  oldValue?: unknown
  newValue?: unknown
  ipAddress: string
  userAgent: string
}
\`\`\`

## MYOB-Specific Guidelines

### Financial Domain
- Use precise terminology: GST, PAYG, BAS, superannuation
- Consider Australian and New Zealand tax rules
- Include audit trail requirements (who, what, when)
- Handle multi-currency if applicable
- Validate calculations against regulatory requirements

### Compliance
- Maintain 7-year data retention for financial records
- Implement data classification (Restricted, Confidential, Internal, Public)
- Follow Australian Privacy Principles (APPs)
- Comply with NZ Privacy Act 2020

### Integration Patterns
- Use MYOB authentication/authorization standards
- Follow MYOB API design patterns
- Integrate with MYOB logging and monitoring infrastructure

## Code Review Checklist

Before submitting code for review, verify:

### Functionality
- [ ] Code solves the stated problem
- [ ] Edge cases are handled
- [ ] Error scenarios are covered

### Code Quality
- [ ] Follows TypeScript/Python coding standards
- [ ] Functions are single-responsibility
- [ ] No code duplication
- [ ] Meaningful variable/function names

### Security
- [ ] Input validation implemented
- [ ] No hardcoded secrets
- [ ] Authentication/authorization checks present
- [ ] Financial calculations use Decimal

### Testing
- [ ] Tests written and passing
- [ ] Coverage meets 90% minimum
- [ ] Tests follow Given-When-Then pattern
- [ ] Both happy path and error cases tested

### Documentation
- [ ] JSDoc/docstring comments on exported functions
- [ ] Complex logic explained with comments
- [ ] README updated if needed
- [ ] API documentation updated

## Common Patterns

### Async Operations
\`\`\`typescript
// Always use async/await
async function fetchData(): Promise<Data> {
  const result = await api.get('/data')
  return result
}

// Not .then() chains
function fetchData(): Promise<Data> {  // ❌ Avoid
  return api.get('/data')
    .then(result => result)
}
\`\`\`

### Configuration Management
\`\`\`typescript
import convict from 'convict'

const config = convict({
  apiKey: {
    doc: 'API key for external service',
    format: String,
    default: '',
    env: 'API_KEY',
    sensitive: true
  }
})

config.validate({ allowed: 'strict' })
\`\`\`

### Factory Functions
\`\`\`typescript
// Use factory functions for object creation
export function createUser(data: UserInput): User {
  return {
    id: new ObjectId(),
    name: data.name,
    email: data.email.toLowerCase(),
    createdAt: new Date(),
    updatedAt: new Date()
  }
}
\`\`\`

## Additional Resources

### MYOB Documentation
- **Architecture Codex**: General technical standards
- **Security Standards**: Low Bar security requirements
- **API Guidelines**: REST API design patterns

### External References
- **TypeScript**: https://www.typescriptlang.org/docs/
- **MongoDB Best Practices**: https://www.mongodb.com/docs/manual/
- **Jest Testing**: https://jestjs.io/docs/getting-started
- **Decimal.js**: https://mikemcl.github.io/decimal.js/

---

## Updating This File

This file should be updated when:
- New patterns emerge in the codebase
- Technology stack changes
- Coding standards evolve
- New team members join (update examples if needed)

**Owner:** Tech Lead / Engineering Manager
**Review Frequency:** Quarterly or when major changes occur

---

*This agents.md file provides comprehensive coding standards for AI agents. For IDE-specific rules, see `.cursor/rules/` or `.github/copilot-instructions.md`.*
```

## How to Use agents.md at MYOB

### Step 1: Create the File

```bash
cd your-myob-project
touch agents.md
```

### Step 2: Customize the Template

Copy the template above and customize for your project:
- Update project name and description
- Adjust technology stack
- Add/remove sections based on your needs
- Include MYOB-specific patterns from your domain

### Step 3: Reference from IDE-Specific Rules

**In `.cursor/rules/general.mdc`:**
```markdown
---
description: General Project Standards
globs: *.*
---

# General Standards

For comprehensive project standards, see **agents.md** in project root.

This file provides Cursor-specific supplementary guidance.
```

**In `.github/copilot-instructions.md`:**
```markdown
# GitHub Copilot Instructions

> **Primary Standards:** See **agents.md** in project root for complete coding standards.

This file highlights key patterns for GitHub Copilot.
```

### Step 4: Keep agents.md Updated

Make `agents.md` your single source of truth:
1. Update `agents.md` first when standards change
2. Sync changes to IDE-specific rule files if needed
3. Review quarterly or when onboarding new team members

## Benefits for MYOB Teams

### ✅ Multi-IDE Support
- Developers can use Cursor, Copilot, or other tools
- All follow same standards via `agents.md`
- No duplication across IDE-specific formats

### ✅ Coding Agent Compatibility
- Emerging AI coding agents can parse `agents.md`
- Future-proof as new tools emerge
- Agent-optimized structure for better navigation

### ✅ Onboarding Efficiency
- New team members read one file
- Comprehensive standards in one place
- Clear examples for common patterns

### ✅ Maintenance Simplicity
- Update one file, not multiple formats
- Version control tracks all changes
- Easier to keep standards current

## Real-World Example: MYOB Payment Service

Here's how a MYOB payment service team might use `agents.md`:

**Repository Structure:**
```
myob-payment-service/
├── agents.md                      # ✅ Primary standards
├── .cursor/rules/                 # Cursor supplements
│   ├── testing.mdc               # Cursor-specific test patterns
│   └── mongodb.mdc               # MongoDB-specific for Cursor
├── .github/
│   └── copilot-instructions.md   # Copilot supplements
└── src/
```

**agents.md** (excerpt):
```markdown
# MYOB Payment Service - Coding Standards

## Project Information
- **Name:** MYOB Payment Service
- **Domain:** Financial Software - Payment Processing
- **Stack:** TypeScript, Hapi.js, MongoDB, Stripe

## Financial Calculations
All payment amounts must use Decimal:

\`\`\`typescript
import { Decimal } from 'decimal.js'

interface Payment {
  amount: Decimal
  gstAmount: Decimal
  totalAmount: Decimal
}

function calculateGST(amount: Decimal): Decimal {
  return amount.times(0.1).toDecimalPlaces(2, Decimal.ROUND_HALF_UP)
}
\`\`\`

## Payment Processing Standards
[Payment-specific patterns...]
```

**Team Workflow:**
1. **Developer A** (uses Cursor) reads `agents.md` + Cursor rules
2. **Developer B** (uses Copilot) reads `agents.md` + Copilot instructions
3. **Both generate consistent code** following `agents.md` standards
4. **Code reviews are easier** - both follow same patterns

## Troubleshooting

### AI Isn't Following agents.md Rules

**Cursor:**
- Ensure you're referencing `agents.md` in `.cursor/rules/`
- Cursor may need explicit references to external files

**Copilot:**
- Copilot doesn't natively support `agents.md` yet
- Include key standards in `.github/copilot-instructions.md`
- Reference `agents.md` for human developers

**Solution:**
- Keep using IDE-specific files that **reference** `agents.md`
- `agents.md` serves as documentation + future-proofing

### Rules Conflict Between agents.md and IDE Files

**Priority:**
1. `agents.md` is the source of truth
2. IDE-specific files should supplement, not contradict
3. When conflicts arise, update IDE files to match `agents.md`

### Too Much Content in agents.md

**Split by concern:**
```
agents.md                    # Core standards
agents-testing.md           # Testing-specific patterns
agents-api.md              # API-specific patterns
agents-database.md         # Database patterns
```

Reference from main `agents.md`:
```markdown
## Additional Documentation
- [Testing Standards](agents-testing.md)
- [API Patterns](agents-api.md)
- [Database Patterns](agents-database.md)
```

## Future of agents.md

The `agents.md` standard is evolving:

- **Growing adoption** by AI coding tools
- **Emerging features** for agent navigation and parsing
- **Community standards** being established
- **Tool support** improving over time

By adopting `agents.md` now, MYOB projects are ready for the next generation of AI coding assistants.

## Resources

- **agents.md Standard**: https://agents.md/
- **MYOB Rules for AI**: [Main Documentation](README.md)
- **Cursor Rules**: [Cursor Setup Guide](../../getting-started/ide-setup/cursor-setup.md)
- **GitHub Copilot**: [Copilot Setup Guide](../../getting-started/ide-setup/github-copilot-setup.md)

---

**Previous:** [← Rules for AI Overview](README.md) | **Next:** [Node.js Rules →](nodejs/nodejs-cursorrules-frontend.md)

---


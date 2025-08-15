# AI-Assisted Code Refactoring

Refactoring is the systematic process of restructuring existing code without altering its external behavior, aimed at improving readability, maintainability, and performance. In AI-assisted development, refactoring becomes even more critical as it helps maintain code quality while leveraging AI's ability to identify patterns and suggest improvements.

## Table of Contents
- [Understanding Code Refactoring](#understanding-code-refactoring)
- [Recognizing Code Smells](#recognizing-code-smells)
- [AI-Assisted Refactoring Techniques](#ai-assisted-refactoring-techniques)
- [Refactoring Strategies](#refactoring-strategies)
- [Planning and Testing](#planning-and-testing)
- [AI Tools for Refactoring](#ai-tools-for-refactoring)
- [Best Practices](#best-practices)
- [MYOB-Specific Guidelines](#myob-specific-guidelines)
- [Refactoring Rules and Instructions](#refactoring-rules-and-instructions)
- [Implementation Checklist](#implementation-checklist)

## Understanding Code Refactoring

Refactoring is essential for maintaining code quality throughout the software development lifecycle. It involves:

- **Improving Code Structure**: Making code more organized and logical
- **Enhancing Readability**: Making code easier to understand and maintain
- **Reducing Technical Debt**: Addressing accumulated shortcuts and compromises
- **Optimizing Performance**: Improving code efficiency without changing functionality
- **Preparing for Future Changes**: Making code more flexible and extensible

### Why Refactoring Matters in AI Development

AI-generated code often requires refactoring because:
- AI may produce working but non-optimal solutions
- Generated code might not follow established patterns
- Multiple AI interactions can lead to inconsistent styles
- AI suggestions may need integration with existing codebases

## Recognizing Code Smells

Code smells are indicators of potential issues in code design that suggest refactoring is needed:

### Common Code Smells

#### 1. **Duplicated Code**
```typescript
// Bad: Duplicated validation logic
function validateUser(user: User): boolean {
  if (!user.email || user.email.length === 0) return false;
  if (!user.name || user.name.length === 0) return false;
  if (!user.phone || user.phone.length === 0) return false;
  return true;
}

function validateCustomer(customer: Customer): boolean {
  if (!customer.email || customer.email.length === 0) return false;
  if (!customer.name || customer.name.length === 0) return false;
  if (!customer.businessName || customer.businessName.length === 0) return false;
  return true;
}

// Good: Extract common validation logic
function validateRequiredField(value: string): boolean {
  return value && value.length > 0;
}

function validateUser(user: User): boolean {
  return validateRequiredField(user.email) && 
         validateRequiredField(user.name) && 
         validateRequiredField(user.phone);
}

function validateCustomer(customer: Customer): boolean {
  return validateRequiredField(customer.email) && 
         validateRequiredField(customer.name) && 
         validateRequiredField(customer.businessName);
}
```

#### 2. **Long Methods**
```typescript
// Bad: Method doing too many things
function processOrder(order: Order): OrderResult {
  // Validate order (20 lines)
  if (!order.customerId) throw new Error("Customer ID required");
  if (!order.items || order.items.length === 0) throw new Error("Items required");
  // ... more validation
  
  // Calculate totals (15 lines)
  let subtotal = 0;
  for (const item of order.items) {
    subtotal += item.price * item.quantity;
  }
  // ... tax calculations
  
  // Apply discounts (10 lines)
  // ... discount logic
  
  // Save to database (10 lines)
  // ... database operations
  
  return result;
}

// Good: Break into focused methods
function processOrder(order: Order): OrderResult {
  validateOrder(order);
  const totals = calculateOrderTotals(order);
  const finalTotals = applyDiscounts(totals, order.customerId);
  return saveOrder(order, finalTotals);
}

function validateOrder(order: Order): void {
  if (!order.customerId) throw new Error("Customer ID required");
  if (!order.items || order.items.length === 0) throw new Error("Items required");
  // Additional validation logic
}

function calculateOrderTotals(order: Order): OrderTotals {
  // Focused calculation logic
}
```

#### 3. **Large Classes**
```typescript
// Bad: Class with too many responsibilities
class CustomerManager {
  // Customer CRUD operations
  createCustomer(data: CustomerData): Customer { }
  updateCustomer(id: string, data: CustomerData): Customer { }
  deleteCustomer(id: string): void { }
  
  // Email operations
  sendWelcomeEmail(customer: Customer): void { }
  sendReminderEmail(customer: Customer): void { }
  
  // Billing operations
  generateInvoice(customer: Customer): Invoice { }
  processPayment(customer: Customer, amount: number): PaymentResult { }
  
  // Reporting
  generateCustomerReport(customerId: string): Report { }
}

// Good: Separate concerns into focused classes
class CustomerService {
  createCustomer(data: CustomerData): Customer { }
  updateCustomer(id: string, data: CustomerData): Customer { }
  deleteCustomer(id: string): void { }
}

class CustomerEmailService {
  sendWelcomeEmail(customer: Customer): void { }
  sendReminderEmail(customer: Customer): void { }
}

class CustomerBillingService {
  generateInvoice(customer: Customer): Invoice { }
  processPayment(customer: Customer, amount: number): PaymentResult { }
}
```

#### 4. **Complex Conditionals**
```typescript
// Bad: Deeply nested conditionals
function calculateDiscount(customer: Customer, order: Order): number {
  if (customer.type === 'premium') {
    if (customer.yearsActive > 5) {
      if (order.total > 1000) {
        if (customer.lastOrderDays < 30) {
          return 0.15;
        } else {
          return 0.10;
        }
      } else {
        return 0.05;
      }
    } else {
      return 0.03;
    }
  } else if (customer.type === 'standard') {
    if (order.total > 500) {
      return 0.05;
    }
  }
  return 0;
}

// Good: Extract conditions and use strategy pattern
class DiscountCalculator {
  private strategies: Map<string, DiscountStrategy> = new Map([
    ['premium_longtime_large_recent', new PremiumLongtimeLargeRecentStrategy()],
    ['premium_longtime_large', new PremiumLongtimeLargeStrategy()],
    ['premium_longtime', new PremiumLongtimeStrategy()],
    ['premium', new PremiumStrategy()],
    ['standard_large', new StandardLargeStrategy()],
    ['default', new DefaultStrategy()]
  ]);

  calculateDiscount(customer: Customer, order: Order): number {
    const strategyKey = this.determineStrategy(customer, order);
    const strategy = this.strategies.get(strategyKey) || this.strategies.get('default');
    return strategy.calculate(customer, order);
  }

  private determineStrategy(customer: Customer, order: Order): string {
    if (customer.type === 'premium') {
      if (customer.yearsActive > 5) {
        if (order.total > 1000 && customer.lastOrderDays < 30) {
          return 'premium_longtime_large_recent';
        } else if (order.total > 1000) {
          return 'premium_longtime_large';
        }
        return 'premium_longtime';
      }
      return 'premium';
    } else if (customer.type === 'standard' && order.total > 500) {
      return 'standard_large';
    }
    return 'default';
  }
}
```

## AI-Assisted Refactoring Techniques

### 1. **Extract Method**
Use AI to identify long methods and break them into smaller, focused functions.

**AI Prompt Example:**
```
Analyze this method and extract smaller, focused methods. Each method should have a single responsibility:

[paste your long method here]

Follow these guidelines:
- Method names should be descriptive and indicate their purpose
- Each method should do one thing well
- Maintain the original functionality exactly
- Use TypeScript with proper type annotations
```

### 2. **Rename Variables and Methods**
AI can suggest more descriptive and meaningful names.

**AI Prompt Example:**
```
Improve the naming in this code to make it more readable and self-documenting:

[paste your code here]

Guidelines:
- Use descriptive variable names that indicate purpose
- Follow TypeScript naming conventions
- Make the code self-documenting
- Avoid abbreviations unless they're widely understood
```

### 3. **Remove Duplicate Code**
AI excels at identifying patterns and eliminating redundancy.

**AI Prompt Example:**
```
Identify and eliminate code duplication in these functions:

[paste your functions here]

Create reusable functions or utilities to eliminate the duplication while maintaining all existing functionality.
```

### 4. **Simplify Complex Expressions**
AI can help break down complex logical expressions.

**AI Prompt Example:**
```
Simplify these complex conditional expressions while maintaining the same logic:

[paste your complex conditions here]

Make them more readable by:
- Extracting conditions into well-named variables
- Using early returns where appropriate
- Breaking complex expressions into simpler parts
```

## Refactoring Strategies

### 1. **The Red-Green-Refactor Cycle**
```
Red (Failing Test) → Green (Make it Pass) → Refactor (Improve Code) → Repeat
```

This TDD cycle ensures that refactoring doesn't break existing functionality.

### 2. **Boy Scout Rule**
"Always leave the campground cleaner than you found it."
- Fix small issues when you encounter them
- Improve naming when you see unclear variables
- Extract methods when you see long functions

### 3. **Strangler Fig Pattern**
For large refactoring projects:
1. Create new, improved code alongside old code
2. Gradually migrate functionality to the new implementation
3. Remove old code once migration is complete

### 4. **Branch by Abstraction**
For major architectural changes:
1. Create an abstraction layer
2. Implement new functionality behind the abstraction
3. Switch implementations without affecting clients
4. Remove old implementation

## Planning and Testing

### Pre-Refactoring Checklist
- [ ] **Comprehensive Test Coverage**: Ensure existing functionality is well-tested
- [ ] **Version Control**: Commit current working state
- [ ] **Documentation**: Document current behavior that must be preserved
- [ ] **Stakeholder Communication**: Inform team about refactoring plans
- [ ] **Risk Assessment**: Identify potential impacts and mitigation strategies

### During Refactoring
- [ ] **Small Steps**: Make incremental changes
- [ ] **Continuous Testing**: Run tests after each change
- [ ] **Frequent Commits**: Commit working states regularly
- [ ] **Code Reviews**: Get feedback on refactoring decisions

### Post-Refactoring Validation
- [ ] **All Tests Pass**: Ensure no functionality is broken
- [ ] **Performance Testing**: Verify performance hasn't degraded
- [ ] **Code Quality Metrics**: Check that quality has improved
- [ ] **Documentation Updates**: Update relevant documentation

## AI Tools for Refactoring

### GitHub Copilot
```typescript
// Type a comment describing what you want to refactor
// Extract this validation logic into a reusable function
function validateCustomerData(customer: CustomerData): ValidationResult {
  // Copilot will suggest the extracted function
}
```

### Cursor AI
Use Cursor's refactoring commands:
- **Cmd+K**: Ask for specific refactoring
- **Context-aware suggestions**: Cursor understands your codebase structure

### AI-Powered Refactoring Prompts
```
// For complex refactoring
"Refactor this class to follow SOLID principles, specifically Single Responsibility Principle"

// For performance optimization
"Optimize this function for better performance while maintaining the same API"

// For maintainability
"Improve the maintainability of this code by reducing complexity and improving readability"
```

## Best Practices

### 1. **Refactor in Small Steps**
- Make one change at a time
- Test after each change
- Commit working states frequently

### 2. **Maintain Test Coverage**
- Never refactor without tests
- Add tests for uncovered code before refactoring
- Use tests to verify behavior is preserved

### 3. **Use Version Control Effectively**
- Create feature branches for large refactoring
- Make atomic commits with clear messages
- Use git bisect to identify when issues were introduced

### 4. **Conduct Code Reviews**
- Get peer feedback on refactoring decisions
- Ensure team understands the changes
- Validate that improvements are meaningful

### 5. **Monitor Performance**
- Measure performance before and after
- Use profiling tools to identify bottlenecks
- Ensure refactoring doesn't introduce performance regressions

## MYOB-Specific Guidelines

### Financial Domain Considerations
- **Precision**: Maintain decimal precision in financial calculations
- **Audit Trail**: Preserve audit logging during refactoring
- **Compliance**: Ensure regulatory requirements are maintained
- **Data Integrity**: Verify financial data consistency

### MYOB Coding Standards
```typescript
// Follow MYOB naming conventions
class CustomerAccountService {
  private readonly auditLogger: AuditLogger;
  
  async processTransaction(
    customerId: string,
    transaction: TransactionData
  ): Promise<Result<Transaction, TransactionError>> {
    // Implementation
  }
}
```

### Security Considerations
- **Data Classification**: Maintain security levels during refactoring
- **Access Control**: Preserve authorization checks
- **Logging**: Ensure security events are still logged
- **Encryption**: Maintain data encryption requirements

## Refactoring Rules and Instructions

### Cursor Rules for Refactoring
```markdown
---
description: MYOB Refactoring Standards
globs: "**/*.{ts,tsx,js,jsx}"
alwaysApply: true
---

# MYOB Code Refactoring Guidelines

## When to Refactor
- Methods longer than 20 lines
- Classes with more than 5 public methods
- Cyclomatic complexity > 10
- Code duplication > 3 instances
- Test coverage < 80%

## Refactoring Priorities
1. **Security**: Never compromise security during refactoring
2. **Data Integrity**: Preserve financial data accuracy
3. **Performance**: Maintain or improve response times
4. **Maintainability**: Improve code readability and structure

## Required Practices
- All refactoring must preserve existing tests
- Add tests for previously untested code
- Use TypeScript strict mode
- Follow SOLID principles
- Maintain audit logging

## Code Examples

### Extract Method Pattern
```typescript
// Before: Long method
function processCustomerOrder(order: Order): OrderResult {
  // 50 lines of mixed logic
}

// After: Extracted methods
function processCustomerOrder(order: Order): OrderResult {
  validateOrder(order);
  const pricing = calculatePricing(order);
  const result = saveOrder(order, pricing);
  auditOrderCreation(order, result);
  return result;
}
```

### Single Responsibility Pattern
```typescript
// Before: Multiple responsibilities
class CustomerManager {
  createCustomer() { }
  sendEmail() { }
  generateReport() { }
}

// After: Separated concerns
class CustomerService {
  createCustomer() { }
}

class CustomerEmailService {
  sendEmail() { }
}

class CustomerReportService {
  generateReport() { }
}
```
```

### AI Refactoring Instructions
```markdown
When refactoring MYOB code:

1. **Preserve Financial Logic**: Never alter financial calculations during refactoring
2. **Maintain Audit Trails**: Ensure all business events are still logged
3. **Security First**: Preserve all security checks and validations
4. **Test-Driven**: Always run tests before and after refactoring
5. **Performance Aware**: Monitor performance impact of changes

Example refactoring prompt:
"Refactor this payment processing method to improve readability while preserving all financial calculations, security checks, and audit logging exactly as they are."
```

## Implementation Checklist

### Before Starting Refactoring
- [ ] **Code Analysis**: Identify code smells and improvement opportunities
- [ ] **Test Coverage**: Ensure comprehensive test coverage exists
- [ ] **Backup**: Commit current state to version control
- [ ] **Planning**: Create refactoring plan with specific goals
- [ ] **Risk Assessment**: Identify potential risks and mitigation strategies

### During Refactoring
- [ ] **Incremental Changes**: Make small, focused changes
- [ ] **Continuous Testing**: Run tests after each change
- [ ] **Code Review**: Get peer feedback on significant changes
- [ ] **Documentation**: Update comments and documentation as needed
- [ ] **Performance Monitoring**: Check for performance regressions

### After Refactoring
- [ ] **Full Test Suite**: Run complete test suite
- [ ] **Performance Testing**: Verify performance hasn't degraded
- [ ] **Code Quality Metrics**: Confirm improvements in quality metrics
- [ ] **Documentation Updates**: Update relevant documentation
- [ ] **Team Communication**: Share refactoring results with team

### Quality Gates
- [ ] **Functionality**: All existing functionality preserved
- [ ] **Performance**: No performance degradation
- [ ] **Security**: All security measures maintained
- [ ] **Maintainability**: Code is more maintainable than before
- [ ] **Test Coverage**: Test coverage maintained or improved

## Measuring Refactoring Success

### Code Quality Metrics
- **Cyclomatic Complexity**: Reduced complexity scores
- **Code Duplication**: Decreased duplication percentage
- **Test Coverage**: Maintained or improved coverage
- **Technical Debt**: Reduced technical debt indicators

### Team Metrics
- **Development Velocity**: Maintained or improved sprint velocity
- **Bug Rate**: Reduced defect rate in refactored areas
- **Code Review Time**: Faster code review cycles
- **Developer Satisfaction**: Improved developer experience

### Business Metrics
- **System Performance**: Improved response times
- **Maintenance Cost**: Reduced time spent on bug fixes
- **Feature Delivery**: Faster feature implementation
- **System Reliability**: Improved system stability

---

**Previous:** [← Testing](testing.md) | **Next:** [Documentation →](documentation.md)

# Before vs After: Key Improvements to Cursor Rules

## 1. Documentation Standards

### ❌ BEFORE (Vague)
```yaml
- **DE-2022-KBA**: All systems must have documentation
  - Create and maintain `README.md` with setup instructions
```

### ✅ AFTER (Specific & Actionable)
```yaml
- **DE-2022-KBA**: All systems must have documentation
  - Create and maintain `README.md` with:
    - Quick start guide (< 5 minutes)
    - Architecture diagram (C4 model)
    - Configuration examples
    - Troubleshooting guide
    - Performance benchmarks
    - Dependencies table with versions
```

---

## 2. Error Handling

### ❌ BEFORE (Missing)
```yaml
# No error handling standards defined
```

### ✅ AFTER (Comprehensive)
```yaml
### Error Response Format
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email address is invalid",
    "details": {
      "field": "email",
      "value": "notanemail",
      "constraint": "Must be valid email format"
    },
    "suggestion": "Please enter a valid email address",
    "documentation": "https://docs.myob.com/errors/VALIDATION_ERROR"
  }
}
```

---

## 3. Testing Standards

### ❌ BEFORE (Basic)
```yaml
- **Unit Tests**:
  - Coverage > 80% for business logic
  - Test edge cases and error conditions
```

### ✅ AFTER (AI-Friendly)
```yaml
- **Unit Tests**:
  - Coverage > 80% for business logic
  - Test naming: should_{expectedBehavior}_when_{condition}
  - Example:
    ```typescript
    describe('TaxCalculator', () => {
      it('should_return10PercentGST_when_australianProduct', () => {
        // Arrange
        const product = { price: 100, country: 'AU' }
        
        // Act
        const tax = calculateTax(product)
        
        // Assert
        expect(tax).toBe(10)
      })
    })
    ```
```

---

## 4. API Design

### ❌ BEFORE (Generic)
```yaml
- **HTTP Status Codes**:
  - `200 OK` - Successful GET, PUT, PATCH
  - `400 Bad Request` - Invalid request data
```

### ✅ AFTER (Specific with Examples)
```yaml
- **HTTP Status Codes**:
  - `200 OK` - Successful GET, PUT, PATCH
    ```json
    {
      "data": { "id": "123", "name": "John" },
      "meta": { "version": "1.0" }
    }
    ```
  - `400 Bad Request` - Invalid request data
    ```json
    {
      "error": {
        "code": "INVALID_INPUT",
        "message": "The provided input is invalid",
        "details": [
          { "field": "email", "issue": "Invalid format" }
        ]
      }
    }
    ```
```

---

## 5. Security Implementation

### ❌ BEFORE (High-level)
```yaml
- **SM001**: Passwords, keys, secrets stored securely
  - Use environment variables for configuration
  - Never commit secrets to git
```

### ✅ AFTER (Actionable)
```yaml
- **SM001**: Secure secret storage
  - Use environment variables for configuration
  - Never commit secrets to git (add to `.gitignore`)
  - Password hashing:
    ```typescript
    // Use bcrypt with minimum 10 rounds
    const hashedPassword = await bcrypt.hash(password, 10)
    
    // Or Argon2 for better security
    const hashedPassword = await argon2.hash(password, {
      type: argon2.argon2id,
      memoryCost: 2 ** 16,
      timeCost: 3,
      parallelism: 1,
    })
    ```
  - API keys must be:
    - Minimum 32 characters
    - Cryptographically random
    - Stored in vault only
    - Rotated every 90 days
```

---

## 6. Code Comments for AI

### ❌ BEFORE (No standard)
```typescript
// Calculate total
function calc(items) {
  return items.reduce((s, i) => s + i.price, 0)
}
```

### ✅ AFTER (AI-Optimized)
```typescript
/**
 * Calculates the total price of all items in the cart
 * 
 * @param {CartItem[]} items - Array of cart items with price property
 * @returns {number} The sum of all item prices
 * @throws {TypeError} If items is not an array
 * @throws {ValidationError} If any item lacks a price property
 * 
 * @example
 * const items = [
 *   { id: 1, name: 'Book', price: 10.99 },
 *   { id: 2, name: 'Pen', price: 1.99 }
 * ]
 * const total = calculateCartTotal(items) // Returns: 12.98
 */
function calculateCartTotal(items: CartItem[]): number {
  if (!Array.isArray(items)) {
    throw new TypeError('Items must be an array')
  }
  
  return items.reduce((sum, item) => {
    if (typeof item.price !== 'number') {
      throw new ValidationError('price', item.price, 'Must be a number')
    }
    return sum + item.price
  }, 0)
}
```

---

## 7. Performance Standards

### ❌ BEFORE (Vague)
```yaml
- Response time p95 < 500ms
```

### ✅ AFTER (Comprehensive)
```yaml
### Performance Targets
- **Response Times**:
  - API endpoints: p50 < 100ms, p95 < 200ms, p99 < 500ms
  - Database queries: p95 < 50ms
  - Critical path: End-to-end < 1 second
  
- **Query Optimization**:
  ```sql
  -- Bad: N+1 query
  SELECT * FROM orders;
  -- Then for each order:
  SELECT * FROM items WHERE order_id = ?;
  
  -- Good: Single query with join
  SELECT o.*, i.*
  FROM orders o
  LEFT JOIN items i ON i.order_id = o.id
  WHERE o.user_id = ?
  ORDER BY o.created_at DESC
  LIMIT 20;
  ```
```

---

## 8. Specification-Driven Development

### ❌ BEFORE (Not mentioned)
```yaml
# No specification requirements
```

### ✅ AFTER (Required process)
```yaml
## Specification-Driven Development [STANDARD]
1. **Before ANY code**:
   - Create `specs/JIRA-123-user-authentication.md`
   - Example spec:
     ```markdown
     # Feature: User Authentication
     
     ## Acceptance Criteria
     - Users can register with email/password
     - Passwords must be 8+ chars with 1 number
     - Email verification required
     - Session timeout after 30 minutes
     
     ## Examples
     ### Success Case
     POST /api/v1/auth/register
     {
       "email": "user@example.com",
       "password": "SecurePass123"
     }
     Response: 201 Created
     
     ### Error Case
     POST /api/v1/auth/register
     {
       "email": "invalid-email",
       "password": "weak"
     }
     Response: 400 Bad Request
     ```
```

---

## Key Improvements Summary

1. **Specificity**: Vague requirements replaced with exact metrics and examples
2. **AI-Readability**: Clear patterns and structures for AI to follow
3. **Actionable**: Every rule includes HOW to implement, not just WHAT
4. **Examples**: Real code examples for every major concept
5. **Measurable**: Specific thresholds and targets that can be verified
6. **Testable**: All requirements can be automatically validated

These improvements transform the cursor rules from guidelines into an actionable playbook that AI assistants can effectively follow.
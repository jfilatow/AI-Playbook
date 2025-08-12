# Specific Updates for .cursorrules File

## Summary
This document provides line-by-line suggestions for updating the existing `.cursorrules` file to incorporate AI-driven and spec-driven development best practices.

---

## 🔴 CRITICAL ADDITIONS (Add these new sections)

### 1. After line 14 (Levels of Guidance), ADD:

```yaml
## AI Agent Interaction Guidelines [STANDARD]
- **Code Context**: Always provide full context including imports, types, and dependencies
- **Explicit Instructions**: Be specific about requirements, constraints, and expected outputs
- **Verification Required**: All AI-generated code must pass linting, testing, and security scans
- **Documentation First**: Write documentation before implementation
- **Test First**: Write tests before writing code (TDD approach)
```

### 2. After line 31 (before Engineering Standards), ADD:

```yaml
## Specification-Driven Development [STANDARD]
1. **Specification Before Code**:
   - Create `specs/{feature}.md` before any implementation
   - Include acceptance criteria, examples, and edge cases
   - Get stakeholder sign-off on specifications
   - Update specifications when requirements change
2. **Living Documentation**:
   - Keep specifications in sync with implementation
   - Use specifications for test case generation
   - Reference spec files in PR descriptions
```

### 3. Replace lines 157-161 (Code Review section), WITH:

```yaml
### Requirements
- Code review is mandatory for quality assurance
- Can be done via: Pair Programming, Pull Requests, or Mob Programming
- Focus on: quality, maintainability, simplicity, and knowledge sharing
- **AI-Generated Code Review**:
  - Mark all AI-generated code in PRs
  - Verify business logic manually
  - Check for security vulnerabilities
  - Validate against specifications
  - Ensure proper error handling

### Review Guidelines
- Review small changes frequently
- Define team guidelines for quality standards
- Clearly indicate review outcomes: approved, mandatory changes, optional changes
- **Review Checklist**:
  - [ ] Specifications implemented correctly
  - [ ] All edge cases handled
  - [ ] Error messages user-friendly
  - [ ] Performance impact assessed
  - [ ] Security controls in place
  - [ ] Documentation updated
```

---

## 🟡 ENHANCEMENTS TO EXISTING SECTIONS

### 1. Update line 37 (Documentation requirement), REPLACE WITH:

```yaml
- **DE-2022-KBA**: All systems must have documentation
  - Create and maintain `README.md` with:
    - Quick start guide (< 5 minutes)
    - Architecture diagram (C4 model)
    - Configuration examples
    - Troubleshooting guide
  - Create `docs/architecture.md` with:
    - System components and interactions
    - Data flow diagrams
    - Technology decisions (ADRs)
    - Performance considerations
  - Create `docs/operations.md` with:
    - Deployment procedures
    - Monitoring setup
    - Incident response playbook
    - Rollback procedures
  - Include API documentation in `docs/api/`:
    - OpenAPI 3.0+ specification
    - Authentication guide
    - Rate limiting details
    - Example requests/responses
    - Webhook documentation
```

### 2. Update line 90 (Threat Model), ADD AFTER:

```yaml
  - Create `docs/threat-model.md` using STRIDE methodology
  - Document all external interfaces and data flows
  - Identify and document security controls for each threat
  - **AI-Specific Security Considerations**:
    - Document prompt injection risks
    - Identify data leakage vectors
    - Review AI model dependencies
    - Validate output sanitization
  - <!-- TODO: Architecture team to provide threat model template -->
```

### 3. Update line 110 (Security event logging), ENHANCE TO:

```yaml
- **LM001**: Security event logging
  - Log authentication attempts (success/failure)
  - Log authorization failures
  - Log data access to sensitive resources
  - Log configuration changes
  - **AI Interaction Logging**:
    - Log all AI API calls with prompts (sanitized)
    - Track AI-generated code deployments
    - Monitor AI response times and errors
    - Audit AI decision paths
  - Include: timestamp, user ID, action, resource, outcome, IP address, user-agent, correlation ID
```

### 4. Update line 237 (Unit test coverage), ENHANCE TO:

```yaml
- **Unit Tests**:
  - Coverage > 80% for business logic
  - Test edge cases and error conditions
  - Mock external dependencies
  - Run in < 5 minutes
  - **Test Naming Standard**:
    ```typescript
    // Format: should_{expectedBehavior}_when_{condition}
    it('should_return400_when_emailInvalid', () => {})
    it('should_calculateTaxCorrectly_when_gstApplies', () => {})
    ```
  - **Test Structure**:
    ```typescript
    describe('FeatureName', () => {
      describe('methodName', () => {
        it('should handle happy path', () => {
          // Arrange
          const input = {...}
          // Act
          const result = method(input)
          // Assert
          expect(result).toEqual(expected)
        })
      })
    })
    ```
```

### 5. Update line 329 (Log Format), ADD FIELDS:

```yaml
- **Log Format**:
  ```json
  {
    "timestamp": "2023-01-01T12:00:00.000Z",
    "level": "INFO|WARN|ERROR",
    "correlationId": "uuid",
    "service": "service-name",
    "environment": "dev|staging|prod",
    "message": "descriptive message",
    "userId": "authenticated-user-id",
    "sessionId": "session-identifier",
    "requestPath": "/api/v1/resource",
    "responseTime": 145,
    "statusCode": 200,
    "errorStack": "only for errors",
    "context": { 
      "feature": "feature-name",
      "action": "specific-action",
      "metadata": {}
    }
  }
  ```
```

---

## 🟢 NEW ERROR HANDLING SECTION (Add after line 366)

```yaml
## Error Handling Standards [STANDARD]

### Error Response Format
- **Consistent Error Structure**:
  ```json
  {
    "error": {
      "code": "UNIQUE_ERROR_CODE",
      "message": "Human-readable message",
      "details": {
        "field": "specific-field",
        "value": "problematic-value",
        "constraint": "what-went-wrong"
      },
      "timestamp": "2023-01-01T00:00:00Z",
      "path": "/api/v1/resource",
      "requestId": "correlation-id",
      "suggestion": "How to fix this error",
      "documentation": "https://docs.myob.com/errors/UNIQUE_ERROR_CODE"
    }
  }
  ```

### Error Handling Patterns
- **Global Error Handler**: Implement centralized error handling
- **Graceful Degradation**: Provide fallback behavior
- **Circuit Breakers**: Prevent cascading failures
- **Retry Logic**: Exponential backoff with jitter
- **Error Recovery**: Self-healing where possible
```

---

## 🔵 PERFORMANCE SECTION (Add after line 424)

```yaml
## Performance Requirements [DEFAULT]

### Performance Targets
- **Response Times**:
  - API: p50 < 100ms, p95 < 200ms, p99 < 500ms
  - Database queries: p95 < 50ms
  - Background jobs: Complete within SLA
- **Resource Limits**:
  - Memory usage < 512MB per instance
  - CPU usage < 70% sustained
  - Connection pools properly sized
- **Optimization Requirements**:
  - No N+1 queries
  - Batch operations where possible
  - Implement caching strategy
  - Use pagination (default 20, max 100)
```

---

## ⚪ FINAL ADDITIONS

### At the end of the document (after line 568), ADD:

```yaml
## AI-Driven Development Checklist
When using AI assistants for development:
1. [ ] Provide complete context and requirements
2. [ ] Specify technology versions and constraints
3. [ ] Review generated code for business logic accuracy
4. [ ] Verify security best practices are followed
5. [ ] Ensure proper error handling is implemented
6. [ ] Check for performance implications
7. [ ] Validate against coding standards
8. [ ] Run all tests and security scans
9. [ ] Update documentation accordingly
10. [ ] Mark AI-generated code in version control

## Specification Template
All new features must have specifications in `specs/` directory:
```markdown
# Feature: [Name]
## Status: Draft | In Review | Approved | Implemented

## Business Context
[Why this feature is needed]

## User Stories
- As a [user type], I want [capability] so that [benefit]

## Acceptance Criteria
- [ ] Given [context], when [action], then [outcome]

## Technical Design
### API Changes
### Database Changes
### Security Considerations
### Performance Impact

## Examples
### Input
### Output
### Error Cases

## Testing Strategy
### Unit Tests
### Integration Tests
### Performance Tests

## Rollout Plan
### Feature Flags
### Monitoring
### Rollback Strategy
```

Remember: These rules are living documentation. Update them as practices evolve.
```

---

## Implementation Priority

1. **Immediate** (This Sprint):
   - AI Agent Interaction Guidelines
   - Specification-Driven Development
   - Error Handling Standards

2. **Next Sprint**:
   - Enhanced Documentation Requirements
   - Performance Requirements
   - Testing Enhancements

3. **Following Quarter**:
   - Monitoring Enhancements
   - Advanced AI Guidelines
   - Metrics Dashboard

---

*Note: All line numbers reference the current .cursorrules file structure*
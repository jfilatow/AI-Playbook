![MYOB Banner](../../assets/images/myob-banner.png)
---


# Security

---

This guidance helps you use AI tools securely in software development while maintaining robust security practices throughout the development lifecycle.

## Key Security Risks When Using AI

### How to Check AI-Generated Code for Vulnerabilities

AI-generated code can contain security vulnerabilities or accidentally embed secrets like API keys. It's essential to treat AI-generated code with the same scrutiny as any other code contribution.

**Do:**
- Review code for vulnerabilities, especially those found in the [OWASP Top 10](https://owasp.org/Top10/)
- Check code for any embedded secrets like API keys, database credentials, or authentication tokens
- Scan generated code with a Static Application Security Testing (SAST) tool before deployment
- Ensure that security-critical code like encryption, authentication, and authorization is carefully reviewed by security experts
- Validate input handling and output encoding in AI-generated code
- Test for injection vulnerabilities (SQL, NoSQL, OS command, LDAP injection)
- Verify proper error handling that doesn't expose sensitive information
- Use custom instructions or rules to ensure the code is secure and follows security best practices

**Don't:**
- Assume AI-generated code is free of vulnerabilities or follows security best practices
- Trust that AI-generated code implements security-critical functionality correctly without thorough review
- Deploy AI-generated authentication or encryption code without expert validation
- Deploy AI-generated code without understanding the security implications
- Rely on Custom rules and instructions alone to ensure the code is secure and follows security best practices

### Current OWASP Top 10 Security Risks (2021)

Understanding the most critical web application security risks helps focus your code review efforts:

1. **Broken Access Control** - Restrictions on authenticated users not properly enforced
2. **Cryptographic Failures** - Failures related to cryptography that lead to sensitive data exposure
3. **Injection** - Untrusted data sent as part of a command or query
4. **Insecure Design** - Risks related to design and architectural flaws
5. **Security Misconfiguration** - Missing appropriate security hardening
6. **Vulnerable and Outdated Components** - Using components with known vulnerabilities
7. **Identification and Authentication Failures** - Functions related to user identity confirmation
8. **Software and Data Integrity Failures** - Code and infrastructure that don't protect against integrity violations
9. **Security Logging and Monitoring Failures** - Insufficient logging, monitoring, and incident response
10. **Server-Side Request Forgery (SSRF)** - Fetching remote resources without validating user-supplied URLs

### How to Secure Dependencies in AI-Generated Code

AI-generated code can import packages that have known vulnerabilities or are potentially malicious packages planted by attackers (supply chain attacks). Most recenly this was experienced with the S1ngularty attack on the npm registry.

**Do:**
- Scan all dependencies with a Software Composition Analysis (SCA) tool to identify vulnerabilities
- Use constraints such as "Use secure and up-to-date dependencies" in your prompts
- Check unfamiliar packages for trustworthiness using services like Wiz [https://app.wiz.io/](https://app.wiz.io/)
- Verify package authenticity and maintainer reputation before including new dependencies
- Implement dependency pinning to avoid automatic updates to potentially compromised versions
- Regularly update dependencies to patch known vulnerabilities
- Use package managers' security features (npm audit, pip-audit, etc.)

**Don't:**
- Assume dependencies included in AI-generated code are secure or non-malicious
- Accept dependencies without understanding their purpose and security posture
- Use packages with no recent maintenance or suspicious download patterns

### How to Protect Your Development Environment

Using local AI tools like Cursor and GitHub Copilot can expose you to security risks if not properly configured.

**Do:**
- Prevent local user credentials and auth tokens from being exposed to AI tools (use `.cursorignore`, `.gitignore` files)
- Only install AI tool plugins and extensions maintained by trusted organizations
- Only install Model Context Protocols (MCPs) from verified publishers
- Use separate development environments for sensitive projects
- Regularly audit and rotate API keys and access tokens
- Configure AI tools to respect security boundaries and data classification levels
- Review AI tool privacy policies and data handling practices

**Don't:**
- Include sensitive data, credentials, or proprietary information in prompts
- Use untrusted plugins or extensions that could compromise your development environment
- Allow AI tools access to production systems or sensitive repositories without proper controls

## AI-Specific Security Considerations

### Prompt Injection and Data Leakage

**Risks:**
- Malicious prompts that could cause AI tools to generate harmful code
- Accidental inclusion of sensitive data in prompts that may be logged or processed
- AI models potentially memorizing and reproducing sensitive information

**Mitigation:**
- Sanitize inputs and prompts to prevent injection attacks
- Avoid including sensitive data, personal information, or proprietary code in prompts
- Use data classification guidelines when determining what information can be shared with AI tools
- Implement prompt filtering and validation where possible

### Model Security and Integrity

**Best Practices:**
- Use AI tools from reputable providers with strong security practices
- Verify the integrity of AI models and tools before deployment
- Monitor for unusual behavior that might indicate compromised AI services
- Implement proper authentication and authorization for AI tool access

## Integration with MYOB Security Standards

This guidance complements MYOB's comprehensive security framework:

- **Low Bar Security Requirements**: [Engineering Standards - Security](../standards/security.md)
- **Information Classification**: Guidelines for handling different data types securely
- **Logging and Monitoring**: [Operations Logging Standards](../operations/logging.md)
- **API Security**: [API Security Guidelines](../apis/api-security/README.md)

## Security Checklist for AI-Assisted Development

- [ ] AI-generated code reviewed for OWASP Top 10 vulnerabilities
- [ ] Dependencies scanned with SCA tools
- [ ] Secrets and credentials excluded from prompts and code
- [ ] SAST tools integrated into CI/CD pipeline
- [ ] AI tool configurations secured with appropriate access controls
- [ ] Security-critical code reviewed by security experts
- [ ] Incident response plan includes AI-related security scenarios
- [ ] Team trained on secure AI development practices

For security concerns or questions, contact the Security team via [#svc-security](https://myob.slack.com/messages/CANT8SKFY) on Slack.

---
**Previous:** [← Sustainability](sustainability.md) | **Next:** [Data Privacy Security →](data-privacy-security.md)
---

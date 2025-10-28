![MYOB Banner](../../assets/images/myob-banner.png)
---


# Data Privacy & Security for AI

---

Ensuring data privacy and security is paramount in the development and deployment of AI systems. Adhering to best practices and understanding regulatory frameworks can mitigate risks and build trust with customers and stakeholders.

## Key Principles

- **Follow information classification** - Do not include restricted data in prompts or training datasets
- **Use secret management** - Never commit keys; prefer environment-based injection and secure vaults
- **Observe and alert on misuse** - Monitor AI system usage and sanitize logs to prevent data leakage
- **Data minimization** - Collect only the data necessary for specific AI tasks to reduce exposure to potential breaches
- **Privacy by design** - Integrate privacy considerations into the AI system's design from the outset

## Best Practices

### Data Handling
- **Anonymization and Encryption**: Implement robust anonymization techniques and strong encryption methods (AES-256) to protect sensitive information during storage and processing
- **Data Provenance**: Maintain clear records of data sources, transformations, and lineage to ensure traceability and compliance
- **Retention Policies**: Establish clear data retention and deletion policies aligned with regulatory requirements and business needs

### Access Controls
- **Principle of Least Privilege**: Grant access only to data and systems necessary for specific job functions
- **Multi-Factor Authentication (MFA)**: Enforce MFA for all AI system access, especially for administrative functions
- **Role-Based Access Control (RBAC)**: Implement granular permissions based on user roles and responsibilities
- **Regular Access Reviews**: Conduct periodic audits of user access rights and remove unnecessary permissions

### AI-Specific Security Measures
- **Model Security**: Protect AI models from adversarial attacks, model theft, and unauthorized inference
- **Input Validation**: Sanitize and validate all inputs to prevent injection attacks and data poisoning
- **Output Filtering**: Monitor and filter AI outputs to prevent disclosure of sensitive information
- **Bias Detection**: Regularly test for and mitigate algorithmic bias that could lead to discriminatory outcomes

## Preventing Data Leakage to AI Models

When using AI tools for development, preventing sensitive data leakage is critical. AI providers may process, store, or use your data for model training unless proper precautions are taken.

### What Data Should NEVER Go to AI Tools

**Absolutely Prohibited Data:**

**Personal Identifiable Information (PII):**
- Customer names, addresses, phone numbers, email addresses
- Government-issued identification numbers (SSN, passport numbers, driver's licenses)
- Financial account numbers, credit card information
- Biometric data, health information
- Employee personal information

**Credentials and Secrets:**
- API keys, access tokens, authentication credentials
- Database passwords, connection strings
- Private keys, certificates, encryption keys
- OAuth tokens, session identifiers
- Service account credentials

**Proprietary Business Data:**
- Customer financial records and transaction histories
- Pricing strategies, business forecasts, financial models
- Proprietary algorithms and trade secrets
- Unreleased product features or strategies
- Internal audit reports, compliance documentation

**Infrastructure Details:**
- Production database schemas with real table/column names
- Internal network topology and IP addresses
- Production server configurations and hostnames
- Security vulnerabilities and penetration test results
- Backup and disaster recovery procedures

### Prompt Sanitization Techniques

Before using AI tools, sanitize your prompts and context:

**Technique 1: Replace with Placeholders**

❌ **Unsafe:**
```javascript
// Generate code to process payment for customer john.doe@example.com
// using Stripe API key sk_live_1234567890abcdef
const payment = await stripe.charges.create({...});
```

✅ **Safe:**
```javascript
// Generate code to process payment for customer using environment variables
// Stripe API key from process.env.STRIPE_API_KEY
const payment = await stripe.charges.create({...});
```

**Technique 2: Use Synthetic/Example Data**

❌ **Unsafe:**
```sql
-- Analyze customer table with columns: customer_id, name, ssn, credit_card, income
SELECT * FROM customers WHERE income > 100000;
```

✅ **Safe:**
```sql
-- Analyze customer table with representative schema
-- Table: customers (id, name, category, segment)
SELECT * FROM customers WHERE segment = 'high_value';
```

**Technique 3: Abstract Business Logic**

❌ **Unsafe:**
```
Our profit margin calculation is: 
(Revenue - COGS - OpEx) * 0.87 for Australian customers
and * 0.92 for New Zealand customers due to tax differences
```

✅ **Safe:**
```
Generate a function that calculates profit margin based on 
revenue, costs, and a region-specific tax factor from configuration
```

### Using Synthetic and Anonymized Data

When AI assistance requires data examples, use synthetic or properly anonymized data:

**Synthetic Data Generation:**
- Use libraries like Faker, Mockaroo, or Synthesized for realistic test data
- Generate data that matches production patterns without real values
- Create representative datasets for AI training and testing
- Ensure synthetic data doesn't accidentally match real customer data

**Data Anonymization:**
- Hash or tokenize identifiers (use one-way hashing)
- Aggregate data to remove individual-level details
- Add noise or perturbation to numerical values
- Generalize categories to reduce specificity
- Remove direct identifiers and quasi-identifiers

**Example: Safe Synthetic Data**
```javascript
// Generate sample customer data for testing payment flow
const testCustomer = {
  id: "CUST_" + generateUUID(),
  name: "Test Customer",
  email: "test@example.com",
  accountType: "business",
  // Use realistic but fake values
  monthlyRevenue: 5000.00
};
```

### Local vs Cloud AI Tools: Security Considerations

Choose the appropriate tool based on data sensitivity:

**Use Local AI Tools When:**
- Working with customer data or PII
- Developing security-critical features (authentication, encryption)
- Processing proprietary business logic or algorithms
- Dealing with compliance-sensitive code (financial regulations)
- Working on unreleased features with competitive advantage

**Use Cloud AI Tools When:**
- Working with public documentation or open-source code
- Developing non-sensitive features with generic business logic
- Processing anonymized or synthetic data only
- Code doesn't contain proprietary algorithms or trade secrets
- Benefits of advanced models outweigh risks for the specific task

**MYOB-Approved Local Tools:**
- Cursor (with local models option)
- GitHub Copilot (with appropriate data exclusion settings)
- Local LLM instances for highly sensitive work

**Cloud Tool Considerations:**
- Verify data handling policies before use
- Check if data is used for model training (opt-out if available)
- Use enterprise tiers with data protection guarantees
- Configure tools to exclude sensitive repositories

### Detecting and Auditing Data Sent to AI Tools

Implement monitoring to track what data AI tools access:

**Audit Mechanisms:**

**File Access Logging:**
- Monitor which files AI tools access via MCPs or context
- Review `.cursor/logs` for file access patterns
- Identify if sensitive files are being included in context
- Set up alerts for access to sensitive directories

**Prompt History Review:**
- Periodically review AI tool conversation history
- Check for accidental inclusion of sensitive information
- Use AI tool audit features (Cursor settings → Privacy)
- Export and analyze prompts quarterly for compliance

**Network Traffic Monitoring:**
- Monitor network requests from AI tools
- Verify data leaving your development environment
- Use network analysis tools to inspect AI tool communications
- Set up DLP (Data Loss Prevention) rules for AI traffic

**Configuration Audits:**
- Review `.cursorignore` and similar exclusion files
- Verify sensitive directories are properly excluded
- Check AI tool permissions and repository access
- Audit MCP configurations for appropriate scope

**Example: .cursorignore Configuration**
```
# Exclude sensitive files from AI context
.env
.env.*
*.key
*.pem
*.p12
secrets/
config/production/
customer-data/
credentials/
*.credentials
node_modules/
vendor/
```

## Data Classification for AI Usage

Apply MYOB's data classification framework to determine if data can be used with AI tools.

### MYOB Data Classification Levels

**Restricted** (Highest Sensitivity)
- **Definition**: Data that if disclosed could cause severe harm to MYOB or customers
- **Examples**: Customer financial records, PII, payment card data, health information
- **AI Usage**: ❌ NEVER use with cloud AI tools
- **Allowed**: Local AI tools only, with explicit approval and strong controls

**Confidential**
- **Definition**: Internal data that could harm MYOB if disclosed
- **Examples**: Business strategies, financial forecasts, unreleased product features, employee data
- **AI Usage**: ⚠️ Use with caution, local tools preferred
- **Allowed**: Cloud AI tools with enterprise data protection agreements only

**Internal**
- **Definition**: Internal-use data not intended for public disclosure
- **Examples**: Internal documentation, development guidelines, non-sensitive code
- **AI Usage**: ✅ Generally safe with approved cloud AI tools
- **Allowed**: MYOB-approved AI tools with standard configurations

**Public**
- **Definition**: Information approved for public release
- **Examples**: Public documentation, open-source code, marketing materials
- **AI Usage**: ✅ Safe with any AI tool
- **Allowed**: Any MYOB-approved AI tool

### Decision Flowchart: Can I Use This Data with AI?

```
Does the data contain customer information, PII, or financial records?
├─ Yes → ❌ DO NOT USE with AI tools
│         Use synthetic data or sanitize first
│
└─ No → Does it contain proprietary business logic or unreleased features?
    ├─ Yes → Is it classified as Restricted or Confidential?
    │   ├─ Yes → ⚠️ Use local AI tools only (with approval)
    │   └─ No → ✅ OK with approved cloud AI tools
    │
    └─ No → Is it Internal or Public?
        ├─ Internal → ✅ OK with approved cloud AI tools
        └─ Public → ✅ OK with any approved AI tool
```

### Examples: Safe vs Unsafe Data Usage

**✅ Safe for AI Tools:**

- Public API documentation (already published)
- Open-source library code (publicly available)
- Sanitized log files (with PII/secrets removed)
- Synthetic test data (generated, not real customer data)
- Generic code patterns and examples
- Public MYOB engineering guidelines
- Anonymized performance metrics (no customer identifiers)

**❌ Unsafe for AI Tools:**

- Customer account balances or transaction histories
- Employee salary information or performance reviews
- Real customer names, emails, or contact information
- Production database connection strings
- API keys, passwords, or authentication tokens
- Real financial forecasts or unpublished pricing
- Unreleased product features with competitive value
- Actual code from security-critical modules (without sanitization)

**⚠️ Requires Sanitization:**

- Database schemas → Remove real table/column names, use generic names
- Log files → Strip PII, IP addresses, user IDs
- Code examples → Replace real values with placeholders
- Business logic → Abstract to generic requirements
- Configuration files → Remove secrets, use environment variable references

### AI Tool Compatibility by Classification

| Data Classification | Local AI Tools | Cloud AI (Enterprise) | Cloud AI (Free/Standard) |
|---------------------|----------------|----------------------|--------------------------|
| Restricted | ⚠️ With approval only | ❌ Never | ❌ Never |
| Confidential | ✅ Yes | ⚠️ With DPA only | ❌ No |
| Internal | ✅ Yes | ✅ Yes | ⚠️ With caution |
| Public | ✅ Yes | ✅ Yes | ✅ Yes |

**DPA** = Data Protection Agreement with enterprise-level guarantees

## Compliance Requirements for AI Usage

### Australian and New Zealand Privacy Laws

When using AI tools with customer data, comply with Australian and New Zealand privacy regulations:

**Australian Privacy Principles (APPs):**
- AI tool providers must be able to delete personal data on request (APP 11, APP 13)
- Ensure AI tool contracts include data deletion guarantees
- Document AI tool usage in privacy policies (APP 1)
- Maintain records of what data was processed by AI (APP 11)
- Personal information must be held securely (APP 11)

**New Zealand Privacy Act 2020:**
- Similar protections to Australian APPs
- Right to access and correction of personal information
- Security safeguards for personal information
- Transparency about how personal information is used

**Data Processing Agreements:**
- AI tool vendors are data processors under Australian Privacy Act
- Ensure proper Data Processing Agreements (DPAs) are in place
- Verify vendor compliance with Australian privacy requirements
- Check data sovereignty requirements (AU/NZ data residency where applicable)

**Consent and Transparency:**
- Disclose AI usage in privacy policies where applicable (required under APPs)
- Obtain consent before using customer data for AI (APP 3)
- Provide transparency about AI decision-making in customer-facing features (APP 1)
- Document AI tool usage in privacy impact assessments
- Notify Office of the Australian Information Commissioner (OAIC) of eligible data breaches

### Audit Trail Requirements

Maintain comprehensive audit trails for AI interactions:

**What to Log:**
- Which AI tools were used and when
- What files or data were accessed by AI tools
- Prompts submitted (sanitized to remove sensitive data)
- Decisions made based on AI recommendations
- Who used AI tools and for what purpose
- Changes made based on AI-generated code

**What NOT to Log:**
- Actual sensitive data or PII
- Complete prompts if they contain confidential information
- Full AI responses if they include sensitive code
- Credentials or secrets (even in audit logs)

**Retention Policies:**
- Audit logs: Retain for minimum regulatory period (typically 7 years for financial services)
- AI interaction logs: 90 days to 1 year, depending on data classification
- Anonymize or delete logs containing sensitive data after retention period
- Ensure AI tool providers honor deletion requests

### Regulatory Considerations for Financial Domain AI

MYOB operates in the financial services domain with additional compliance requirements:

**Financial Regulations:**
- **Anti-Money Laundering (AML)**: AI-generated code for transaction monitoring must comply with AML requirements
- **Know Your Customer (KYC)**: Customer verification code must meet regulatory standards
- **Payment Card Industry (PCI DSS)**: AI tools must not access or process payment card data
- **Tax Compliance**: AI-generated tax calculation code must be thoroughly validated

**Compliance Best Practices:**
- Never use AI tools directly with customer financial data
- Validate all AI-generated financial calculations manually
- Maintain human oversight for compliance-critical features
- Document AI usage in regulatory audit documentation
- Ensure AI-generated code includes proper audit trails
- Test AI-generated compliance features extensively

**Industry-Specific Considerations:**
- Banking regulations may prohibit certain AI tool usage
- Insurance requirements for data protection
- Accounting standards for automated calculations
- Regional regulatory differences (AU, NZ)
- APRA regulations for financial institutions (Australia)
- FMA regulations for financial service providers (New Zealand)

### Monitoring and Compliance
- **Continuous Monitoring**: Implement real-time monitoring for anomalous behavior and potential security incidents
- **Audit Logging**: Maintain comprehensive logs of all AI system interactions while ensuring sensitive data is not logged
- **Regular Security Assessments**: Conduct periodic penetration testing and vulnerability assessments
- **Incident Response**: Maintain an incident response plan specific to AI-related security breaches

## Regulatory Considerations

### Australian and New Zealand Privacy Standards
- **Australian Privacy Act 1988**: Governs how personal information is collected, used, and disclosed by organizations
- **Australian Privacy Principles (APPs)**: 13 principles covering collection, use, security, and disclosure of personal information
- **New Zealand Privacy Act 2020**: Governs privacy and data protection in New Zealand with 13 privacy principles
- **ISO/IEC 27001**: International standard for information security management systems (MYOB is certified to ISO 27001)
- **Notifiable Data Breaches (NDB) Scheme**: Mandatory notification to OAIC and affected individuals for eligible data breaches

### Industry-Specific Standards
- **Payment Card Industry Data Security Standard (PCI DSS)**: For handling payment card data
- **Australian Accounting Standards**: Data retention and accuracy requirements for financial records
- **ATO Record Keeping Requirements**: Tax and financial data must be kept for 5-7 years
- **FMA Act (NZ)**: Financial Markets Authority requirements for financial service providers

## Challenges and Mitigation

### Common Challenges
- **Data Quality and Bias**: Ensuring training data is representative and free from harmful biases
- **Model Interpretability**: Balancing model performance with the need for explainable AI decisions
- **Cross-Border Data Transfers**: Managing data sovereignty and compliance across multiple jurisdictions
- **Third-Party AI Services**: Ensuring vendors meet privacy and security standards

### Risk Mitigation Strategies
- **Privacy Impact Assessments**: Conduct thorough assessments before deploying AI systems
- **Data Loss Prevention (DLP)**: Implement tools to detect and prevent unauthorized data exfiltration
- **Secure Development Lifecycle**: Integrate security testing throughout the AI development process
- **Vendor Due Diligence**: Thoroughly vet third-party AI providers and establish clear contractual obligations


## Implementation Checklist

- [ ] Data classification scheme implemented
- [ ] Encryption at rest and in transit configured
- [ ] Access controls and MFA enforced
- [ ] Monitoring and alerting systems deployed
- [ ] Privacy impact assessment completed
- [ ] Incident response plan updated for AI scenarios
- [ ] Regular security audits scheduled
- [ ] MYOB Staff training on AI privacy and security completed

For additional guidance or security concerns, contact the Security team via [#svc-security](https://myob.slack.com/messages/CANT8SKFY) on Slack.

---

**Previous:** [← Security](security.md) | **Next:** [Getting Started →](../getting-started/README.md)

---

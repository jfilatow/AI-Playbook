---
title: Secret Management
---
<!-- confluence-page-id: 9293923576 -->
![](../assets/BANNER.png)
# Secret Management
#### Level of guidance: Standard

## What is it?
What is a **Secret**?

A **secret**  is a sensitive data element used for authentication, such as a **password**, **encryption key**, or **API token** and must be stored with appropriate security measures.

What is **Secret Management**?

**Secret Management** involves the systematic and secure handling of secret values, including their creation, storage, and usage. This practice encompasses:

- **Creation**: The procedures for generating secret values.
- **Rotation**: The strategies for periodically updating or rotating secrets.
- **Revocation**: The methods for invalidating or restricting compromised secrets.
- **Expiration**: The policies for setting expiration dates or session-based limits for credentials.

## Why do we do it?
The essence of security is establishing trust. Secrets management supports this by minimising the risk of compromising confidential resources.

Secrets used in applications should never be stored or shared insecurely, such as in plaintext in source control or messaging platforms. Effective secrets management—through auditing and access controls—ensures that MYOB applications are designed with security by default and that system access is managed effectively.

## How do we do it?

Many MYOB platforms offer integrated secret management tools.

**Storage**: Use built-in secret management tools in MYOB platforms or centralised secret stores in cloud providers and third-party tools.
**CI/CD Pipelines**: Store secrets in the pipeline's secret management system, adhering to the principle of least privilege.
**Detection**: Use tools to detect secrets in code changes before committing to source control.
**Human Access**: Minimise human access to secrets. Use secure tools for necessary human access and follow secure distribution processes.

For specific queries or integration support, consult your team or the Security Group (#svc-security) on Slack. 

Refer to the [Process for secure distribution or sharing of sensitive data files or credentials](https://myobconfluence.atlassian.net/wiki/spaces/EN/pages/1020041777/Process+for+secure+distribution+or+sharing+of+sensitive+data+files+or+credentials) for more details on how.


## Principles

1. **Never store access credentials in plaintext**: Ensure sensitive data is not kept in plaintext in source control to enhance security.
2. **Do not commit unencrypted secrets to source control**: If you discover an unencrypted secret in source control, notify the Security Group. (#svc-security) immediately. 
3. **Rotate secrets regularly**: A maximum of one year is recommended for a secret's lifespan. Aim to reduce this duration as much as possible for optimal security.
4. **Automate secret management**: Manage the lifecycle of secrets through automation whenever possible.
5. **Minimise human access**: Limit human access to secrets to exceptional cases only.

## Further Resources:
- [How should I manage (or prevent) secrets in repos? (MYOB)](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/917177223/How+should+I+manage+or+prevent+secrets+in+repos)
- [OWASP Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
- [How to use Private Bin for sending credentials](https://myobconfluence.atlassian.net/wiki/spaces/ESIK/pages/2605026318/How+use+Private+Bin+sending+credentials)
- [How to use 1password for sending credentials](https://myobconfluence.atlassian.net/wiki/spaces/ESIK/pages/2726330561/How+to+use+1password+for+sending+credentials)
## Relevant Standards:
* [Low Bar Security Requirements (MYOB)](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Low+Bar+Security+Requirements)

## Further info or feedback
Please email us at codex@myob.com or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

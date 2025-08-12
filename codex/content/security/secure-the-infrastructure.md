---
title: Secure the Infrastructure
---
<!-- confluence-page-id: 9293923588 -->
![](../assets/BANNER.png)
# Secure the Infrastructure
#### Level of guidance: Standard

## What is it?
**Infrastructure** refers to the essential physical and virtual resources needed to operate online platforms. This includes servers, operating systems, monitoring tools, firewalls, and cloud services that enable MYOB to host and deliver its services.

**Securing the Infrastructure** involves hardening the platforms that host our products. This multidisciplinary practice includes:

- **Network Security**: Implementing firewalls, encryption, and key management.
- **Operating Systems**: Ensuring secure configurations, hardening, and regular patching.
- **Access Control**: Managing user permissions across all environments.
- **Inventory Management**: Keeping track of resources and their owners.
- **Logging, Monitoring, and Alerting**: Capturing events and user behaviours for analysis.
This cross-functional discipline requires collaboration and a comprehensive understanding of our platforms and products.

## Why do we do it?
Securing our infrastructure is a multidisciplinary approach that safeguards the core components of our IT platform. Since these components are often shared, a security incident can have widespread negative effects (e.g., affecting an AWS account or an internet-facing proxy server).

The goals of securing the infrastructure include:

- Protecting our customers and their data.
- Maintaining our strong business reputation.
- Building trust and confidence in our products.
- Meeting legal and regulatory obligations with a demonstrably secure posture.

## How do we do it?
Factors for building a secure infrastructure layer can vary based on the product or technology stack (e.g., platform-as-a-service, infrastructure-as-a-service, or on-premises environments). However, the fundamental principles of securing these environments remain consistent and share key success factors.

**Key Principles for Securing Infrastructure**

- **Least Privilege**: Assign the minimum necessary access for users and accounts to perform their tasks.
- **Separation of Duties**: Limit workloads from performing administrative tasks and restrict administrative accounts to management only.
- **Access Control for Applications**: Use authorised roles instead of secrets for database access. Ensure access aligns with assigned roles, such as enabling MFA for administrative roles.
- **Secret Management**: Store all secrets securely (e.g., encrypted) and avoid plain-text configuration files. Utilise Secret Management for secure storage.
- **Minimise the Attack Surface**: Disable or uninstall unused services, default users, and test applications. Assess network connectivity requirements on a case-by-case basis.
- **Establish Network Boundaries and Data Flows**: Document and secure all data flows based on requirements during the design phase, using firewalls or proxies as needed.
- **Vulnerability Scanning**: Automate scans for known exploits as part of daily tasks and integration processes.
- **Secure Defaults**: Configure platforms with security in mind, following benchmarks (e.g., CIS). Ensure security defaults are enabled in cloud environments and use vetted template images.
- **Secure Patching Policy**: Implement regular and out-of-band patching for infrastructure, addressing both scheduled and critical vendor security updates.
- **Encryption by Default**: Encrypt all data in transit over public networks and ensure internal data is encrypted based on classification and criticality.
- **Logging, Monitoring, and Alerting**: Use tools to securely record, monitor, and alert on infrastructure activities. _See [Logging](./logging.md) for more information._

If you have further questions, contact the security team on slack (#svc-security) or the [Governance Risk and Compliance Team (GRC)](https://helpme.myob.com/hc/en-us/articles/1500002641061-How-to-contact-GRC).

## Further Resources:
- [Microsoft Azure Infrastructure security](https://learn.microsoft.com/en-us/azure/security/fundamentals/infrastructure)
- [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks)

## Relevant Standards:
- [MYOB Low Bar](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Low+Bar+Security+Requirements)

## Further info or feedback
Please email us at codex@myob.com or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

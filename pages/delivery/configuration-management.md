---
title: Configuration Management
---
<!-- confluence-page-id: 9293923409 -->
![](../assets/BANNER.png)
# Configuration Management
#### Level of guidance: Default

## Decisions to make
- How do I configure my application to meet the needs of the business?
- How do I want to store and manage application configuration?

## What is it?
What is **configuration**?

Configuration Management is an engineering practice that is followed to manage the usage and maintenance of any relevant configuration. It ensures proper ownership and governance, including distribution, of any configuration that a product or environment requires to be able to remain connected, performant, and secure.

in the context of software, this can include settings related to
- development vs testing vs production environments
- dependency management
- security related processes
- performance settings e.g. verbose logging, parallelism, anything non-hardware

What is **management**?

Management is about building and maintaining practices and processes used to provide reliable, repeatable, and reportable outcomes.

This can include:
- What changes have been made?
- When have the changes been made?
- What was affected by the change?
- Who made the changes?

Hence, **Configuration Management** is an engineering practice about building and maintaining reliable, repeatable, and reportable systems to manage, track, and audit the configuration of deployed software.

It ensures proper ownership, governance, and distribution of any configuration that a product or environment requires to be able to remain connected, performant, and secure.

## Why do we have it?
Configuration Management seeks to provide a consistent and repeatable pattern of managing configuration and provides benefits such as:

- Increased security and performance
- Simplify deploying applications
- Risk mitigation
- Improved auditing traceability
- improved metrics and reporting

Configuration management in the context of MYOB is not:
- [Infrastructure as Code](./infrastructure-as-code.md), which involves the hardware or network configuration of a given application.

## How do we do it?

In the context of configuration management at MYOB, we:

- Ensure a minimal number of configuration settings
- Principle of least privilege on configurations
- Ensure we have a history of previous configurations
- Perform resource auditing regularly to ensure compliance
- Have automated deployment of new configurations for disaster recovery or rollback purposes.

and we should ensure that all configuration is:
- Managed under source control (excluding secrets)
- Not externalise (expose) settings that don't need to be configured or dynamic.


At MYOB we strive for lightweight configuration management. Where possible, and appropriate, we empower the maintenance of configuration while still enforcing ISO, IRD, ATO, etc compliant control of sensitive data like security and API keys.

## Further info or feedback
Please email us at codex@myob.com or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

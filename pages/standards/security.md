---
title: Security
---

![MYOB Banner](../../assets/images/myob-banner.png)

<!-- confluence-page-id: 9293923525 -->
[![](../assets/BANNER.png)
# Security
[<- Back to Engineering Standards](./README.md)
## SE-2022-SCC
### All systems must implement guidance and principles outlined in the Security Chapter of Codex

Application security is a important part of software development at MYOB to ensure trust in our products by our customers and to manage regulatory risk.

Application security is covered in the [security chapter of the Codex](../security/README.md), which lists many tasks and practices that a product or system should be assessed against, implement, or adhere to.

This does not however mean that the security chapter is a definitive list, and you should engage the Security Team (Slack: [#svc-security](https://myob.slack.com/messages/CANT8SKFY))

## SE-2022-LBR
### All systems must implement the Low Bar Security Requirements

The security team has developed a "low bar" of security that all products and systems should implement at a minimum.

You can view the low bar [below](#low-bar-security-requirements), or view the document with more comprehensive details at the [Low Bar Security Requirements (Confluence)](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Low+Bar+Security+Requirements).


# Low Bar Security Requirements
[<- Back to Engineering Standards](./README.md)

You can view the comprehensive document featuring specific requirements and links to more resources across the organisation at the

[Low Bar Security Requirements (Confluence)](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Low+Bar+Security+Requirements).


### Contents
|REF| Requirement|
|:---|:---|
| [GV001](#GV001)| System ownership is established and system catalogue is updated.|
| [GV002](#GV002)| The solution has system documentation and a defined threat model.|
| [GV003](#GV003)| Application is assigned criticality rating.|
| [GV004](#GV004)| Data is assigned classification rating.|
| [SM001](#SM001)| Passwords, keys, secrets, certificates must be stored securely.|
| [LM001](#LM001)| Bespoke applications define security events (logs) and make logs available for 'observability' platforms.|
| [DS001](#DS001)| All data flowing through untrusted networks (e.g. Internet) must use egress/ingress controls (e.g. WAF, proxy).|
| [DS002](#DS002)| Data is encrypted in transit and at rest.|
| [DS003](#DS003)| Sensitive data is prevented from being logged.|
| [SD001](#SD001)| All source code must undergo continuous SAST analysis.|
| [SD002](#SD002)| All source code must undergo continuous SCA analysis.|
| [SD003](#SD003)| Peer source code review must be performed.|
| [SD004](#SD004)| All platforms must undergo configuration hardening aligned to an established baseline (e.g. CIS).|
| [AC001](#AC001)| Implement authentication, authorisation and MFA access controls on applicable systems.|


## GV001
### System ownership is established and system catalogue is updated.
> **I understand my systems and I know my system owners (governance)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#System-ownership-is-established-and-system-catalogue-is-updated.)_).

Knowing the system owner provides clarity and efficiency throughout the SDLC processes. It enables engineering and support teams to quickly find an answer to a system specific question, such as updates, future enhancements, planning and urgent incident management work.

## GV002
### The solution has system documentation and a defined threat model.
> **I understand my technical and business risks (governance)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#The-solution-has-system-documentation-and-a-defined-threat-model.)_).

To enable teams to have clarity into their platforms and areas of accountability; maintain domain knowledge base, retain knowledge and build strong security posture aligned to MYOB risk appetite, it is critical for our teams to understand the depth and breadth of the solution.

MYOB requires that solution documentation exists; and covers the following topics: high-level architecture diagram, interface tables, data types, and authentication types (e.g. human to system using web-forms, system to system using tokens, etc.).

It is also expected that the solution makes use of this documentation for threat modelling exercise.

## GV003
### Application is assigned criticality rating.
> **I understand the data I manage (governance)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#Application-is-assigned-criticality-rating.)_).

System criticality rating is a critical data point that determines security requirements in-line with the company's risk appetite. For example, it sets the scope for MYOB developers and security teams to determine ‘how much security is enough'. This may include access controls, data storage requirements, etc.

All initiatives must assess and document their system criticality rating.

## GV004
### Data is assigned classification rating.
> **I understand my technical and business risks (governance)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#Data-is-assigned-classification-rating.)_).

Data classification rating is a critical data point that determines security requirements in-line with the company's risk appetite. For example, it sets the scope for MYOB developers and security teams to determine ‘how much security is enough'. This may include access controls, data storage requirements, etc.

All initiatives must assess and document their data classification rating (also see Codex - MYOB-Technology/Codex/Security/Information Classification) and identify where (if any) PI is stored.

## SM001
### Passwords, keys, secrets, certificates must be stored securely.
> **I store my authentication data securely (secrets management)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#Passwords%2C-keys%2C-secrets%2C-certificates-must-be-stored-securely.)_).

Most modern applications are built using distributed components, such as calls to interconnected APIs, database services, message queues, build and deployment agents, etc.

MYOB requires that all authentication material for these platforms is stored encrypted or hashed. For example, service tokens are stored encrypted in a vault and injected at runtime. And not hardcoded, stored in code repositories or as a plain-text data field in configuration files.

## LM001
### Bespoke applications define security events (logs) and make logs available for 'observability' platforms.
> **I am aware of what’s going on inside my environment (logging & monitoring) _[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#Bespoke-applications-define-security-events-(logs)-and-make-logs-available-to-'observability'-platforms.)_.**

To maintain effective security posture and situational awareness, it's expected that all application generates security event logs that capturing enough information to detect, prevent and investigate security events.

MYOB requires that all application logs are made available to observability platforms for ingestion.

N.B. some events may need to be defined as bespoke rules (e.g. detection: attempt to access a resource by an unauthorised user) for effective attack detection.

## DS001
### All data flowing through untrusted networks (e.g. Internet) must use egress/ingress controls (e.g. WAF, proxy).

> **I have a way to control my network traffic (data security)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#All-data-flowing-through-untrusted-networks-(e.g.-Internet)-must-use-network-flow-controls-(e.g.-WAF%2C-firewalls).)_).

Proxy infrastructure (e.g. WAF) provides a layer of security where a data flow can be inspected, transformed or secured independently of the application. For example, when a new vulnerability is disclosed that impacts publicly facing applications, we can mitigate the risk through a rapid ‘workaround’ without being constrained by the underlying application complexity.

MYOB requires that all data flows to and from untrusted networks (e.g. the Internet) are routed via proxy infrastructure (e.g. a WAF or HTTPS proxy).


## DS002
### Data is encrypted in transit and at rest.
> **I store and transmit my data securely (data security)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#Data-is-encrypted-in-transit-and-at-rest.)_).

Most modern applications are built using distributed components, such as calls to interconnected APIs, SaaS and PaaS services, database services, message queues, build and deployment agents. Furthermore, these platforms are often used by the application, but not owned by the application developers e.g. MYOB).

MYOB requires that all data stored by and transmitted between these components is encrypted; and all data flowing between components is encrypted.

## DS003
### Sensitive data is prevented from being logged.
> **I use my data securely (data security)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#Sensitive-data-is-prevented-from-being-logged.)_).

Applications often transmit sensitive data, such as users' personal information (e.i. PI data) and authentication material (e.g. session tokens) for application service.

MYOB requires that these data (i.e. sensitive data) is not logged; and actions taken to prevent this data being written to logs.

## SD001
### All source code must undergo continuous SAST analysis.
> **I manage my source code risks (SSDLC)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#All-source-code-must-undergo-continuous-SAST-analysis.)_).

Modern applications are built using a combination of third-party components (e.g. Open Source software libraries) and bespoke source code. The volume of code and the rapid change nature of these applications (e.g. new features are added or updated) means that applications are required to be continuously examined to for security flaws.

MYOB requires that all bespoke source code is continuously assessed for security vulnerabilities using the available [SAST](https://en.wikipedia.org/wiki/Static_application_security_testing) tools.

## SD002
### All source code must undergo continuous SCA analysis.
> **I manage my supply chain risks (SSDLC)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#All-source-code-must-undergo-continuous-SCA-analysis.)_).

Modern applications are often built using third-party component (e.g. Open Source software libraries) to accelerate the development cycle by reducing the time it takes to develop common and well-established components (e.g. XML parsers, API scaffolding, etc.).

MYOB requires that all third-party application components (i.e. software libraries) are continuously assessed for security vulnerabilities) using the available [SCA](https://www.synopsys.com/glossary/what-is-software-composition-analysis.html) tools.

## SD003
### Peer source code review must be performed.
> **I manage my business risks (SSDLC)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#Peer-source-code-review-must-be-performed.)_).

While there are [SAST](https://en.wikipedia.org/wiki/Static_application_security_testing) and [SCA](https://www.synopsys.com/glossary/what-is-software-composition-analysis.html) tools that are designed to detect common and known (e.g. published on the public Internet as a [CVE](https://www.redhat.com/en/topics/security/what-is-cve) report) software vulnerabilities, these tools are not capable of detecting vulnerabilities in the business logic (e.g. using the application workflow/process in a way that it wasn’t designed to be used).

MYOB requires that all code changes undergo peer review.

## SD004
### All platforms must undergo configuration hardening aligned to an established baseline (e.g. CIS).
> **I manage my infrastructure risk (SSDLC)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#All-platforms-must-undergo-configuration-hardening-aligned-to-an-established-baseline-(e.g.-CIS).)_).

Modern applications are built using a combination of software (e.g. NGINX web server, MS SQL server) and underlying platform services. For example, a dedicated host/operating system, serverless environments (e.g. AWS Lambda) or container infrastructure.

MYOB requires that configuration hardening of all software and platform services is performed in line with the industry best practice consensus, such as [CIS Benchmark guides/checklists](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Low+Bar+Security+Requirements#:~:text=CIS%20Benchmark%20guides/checklists).

## AC001
### Implement authentication, authorisation  and MFA access controls on applicable systems.
> **I manage my access control risks (Access Control)** (_[additional guidance](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment#Implement-authentication%2C-authorisation-and-MFA-access-controls-on-applicable-systems.)_).

Online applications present a complex environment for user and data permission management. It can range in complexity, from simple permission grant, where a user is granted full access to a resource. To a complex hierarchy where multiple users are granted access to resources on behalf of other users; and where resources could be access entirely or in part by one or more users.

MYOB requires that access to application and data is granted based on need-to-know and [principle of least privilege](https://www.cert.govt.nz/it-specialists/critical-controls/principle-of-least-privilege/).

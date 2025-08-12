---
title: Application Security Testing
---
<!-- confluence-page-id: 9293956077 -->
![](../assets/BANNER.png)
# Application Security Testing
#### Level of guidance: Standard

## What is it?
Application security testing is a set of tools, processes, and best practices to manage application-related risks. It can range from simple risk awareness to a well-established pipeline that quickly identifies and remediates vulnerabilities.

For a typical organisation, it consists of a small set of testing tools integrated with the software development cycle. Application security testing comes in different forms and concepts for different types of testing. Some common concepts include:
* Static application security testing (SAST)
   SAST uses application source code or binary code as input and scans this code for known vulnerable code patterns to generate results that identify potential vulnerabilities. SAST tools are commonly used in the early to late stages of software development, especially before shipping the code to production.
* Software composition analysis (SCA)
   SCA analyses an application to determine its third-party components, frequently focused on open-source software (OSS) security issues and license compliance.
   SCA is often used in the early phases of software development.
* Dynamic application security testing (DAST)
   DAST examines a target application’s code to identify its attack surface or application tree and deploys the application in a test environment to run simulated attacks. DAST tools are commonly used during QA before shipping the code, as well as on production applications.
* Penetration testing
   Penetration testing involves automated and manual tests that aim to test the security controls of running applications. Usually, penetration tests only cover applications running in production, but they can also be scoped to cover pre-production environments.

## Why do we do it?
The goal of application security testing is to surface security issues early in the development lifecycle. This approach helps to reduce the risk of application security-related issues. Both helping to avoid the introduction of them into production and the detection and remediation of newly discovered ones.

## How do we do it?
The Application Security team at MYOB has created "How-to" documents for some capabilities listed above.
### Static Application Security Testing (SAST)
   SonarQube is the SAST tool for teams at MYOB to use. It can be integrated into CICD platforms such as Buildkite (preferred), GitHub actions, and TeamCity. It is also available as an IDE plugin for linting. Links in the Resources section below.
### Software Composition Analysis (SCA)
   GitHub Dependabot is the SCA tool of choice for teams at MYOB. It is a tool that will monitor project dependencies for security issues using the [GitHub Advisory](https://github.com/advisories) database. It can automatically create pull requests upon any security detection (vulnerable package, library, or even licensing terms). Links are in the resources section below.
### Dynamic application security testing (DAST)
   We currently do not have this capability for teams to use but the application security team offers limited guidance as and when required.
### Penetration Testing (Pen-Testing)
   Pen-Testing is a simulated, time-boxed cyber attack on your product or system. The outcome of this type of testing identifies potential security flaws a hacker could exploit. The Application security team at MYOB manages Pen-Testing engagement through 3rd party security testing vendors. The process is documented and referenced in the resources section below.
## Principles
Security testing aims to ensure that MYOB systems, applications, and data uphold the following software security principles:
* Confidentiality – limiting access to sensitive systems or data.
* Integrity – ensuring that data is consistent, accurate, and trustworthy throughout its lifecycle and cannot be modified by unauthorised entities.
* Authentication – ensuring sensitive systems or data are protected by a mechanism that verifies the identity of the individual accessing them.
* Authorisation – ensuring sensitive systems or data properly control access for authenticated users according to their roles or permissions.
* Availability – ensuring that critical systems or data are available for their users when they are needed.
* Non-repudiation – ensures that data sent or received cannot be denied, by exchanging authentication information with a provable time stamp.
## Further Resources:
* [SonarQube - SAST](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/1008635265/SonarQube)
* [GitHub Dependabot - SCA](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/2706310105/How+to+Dependabot)
* [Penetration Testing](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/666994991/Security+Testing)
## Relevant Standards:
* [MYOB Low Bar Security Requirements](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Low+Bar+Security+Requirements)

## Further info or feedback
Please email us at codex@myob.com or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

---
title: Testing APIs for Security
---

![MYOB Banner](../../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9581628012 -->
![](../../assets/BANNER.png)

# Testing APIs for Security

---

When testing APIs for security flaws and vulnerabilities the main areas to look at are; Penetration testing, Vulnerability scanning, and Threat Assessment. These areas identify and remediate the majority of security weaknesses in the API. It is also recommended to conduct security testing at different stages of the development lifecycle to catch issues early, and at all stages of the workflow.

## Penetration Testing

Penetration testing is usually conducted by an external team or entity. This type of testing should be conducted at approximately once a year or whenever significant changes are made to the API. For example; new endpoints or security framework changes. In General the security team() can organise a yearly penetration test for your team. The first stage involves filling out a [Questionnaire](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/1082132067/Penetration+Testing+Questionnaire) The main types of tests involved in a Penetration Test suite are;

- **Reconnaissance Tests**: Manually exploring the API using proxy tools by capturing and analysing client-server communication.
  - Conducted from the point of view of both an unauthenticated user and a legitimate application user.
  - User roles and data validation aspects are explored during reconnaissance.

- **Vulnerability Identification**: A variety of security tools are used to assess the API for known vulnerabilities in a comprehensive and efficient manner.
  - Typically, the vulnerabilities tested for are defined in the [OWASP Top 10](https://owasp.org/www-project-top-ten/) for the current year.
  - Security flaws in the application business logic are tested in this manner.
  - The following tests should also be conducted;
    - **Authorisation bypass** - Access sensitive back-end data such as back up or configuration
    - **Business Logic bypass** - Submit API requests through modification of parameter or bypass of application business logic or intended use, e.g. submission of incorrect values, in sequential requests, or parameter enumeration.
    - **User privilege escalation** - Attempts to access back-end API features of higher privileged users.
    - **Backdoors** – Identify malicious entry paths that provide administrative access into the application or system.
    - **Forceful browsing** – Access an API endpoint or directory directly that should only be reached as an authenticated user.
    - **Informational** – View unauthorised data, such as personally identifiable information of another user.
    - **Infrastructure/platform misconfigurations** – Application servers may be inadvertently misconfigured to permit anonymous authoring through FrontPage Server Extensions, file transfers with WebDAV, directory indexing and browsing, etc.

- **Prioritisation**: Based on the services and resources identified, facilitated prioritisation of test objectives to focus testing on areas of identified risk.

- **Exploitation**: Technical vulnerabilities and exploits are analysed to determine the highest risk
   and tactical recommendations are recommended for remediation. Strategic recommendations are also created to address underlying or root-cause issues.

## Vulnerability Scanning

API Vulnerability scanning at MYOB involves assessing the components in an API for known vulnerabilities. Components in this case involves all the "moving parts" of an API. Not only code but infrastructure (e.g. AWS components) is assessed here. At MYOB vulnerability scanning is conducted and monitored mainly by the SonarQube and Nucleus;

- [SonarQube](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/1008635265/SonarQube): SonarQube is a Static Application Security Testing (SAST) tool. That examines an applications codebase to find vulnerabilities. SonarQube also scans for code quality.

- [Nucleus](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8964538673/What+is+Nucleus): Nucleus is MYOB’s new vulnerability management platform and where you can see all the vulnerabilities associated with assets you own.

## Threat Modelling and Assessment

[Threat Modelling](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/834699309/Threat+Modelling+Workshops) involves assessing an applications components for possible threats. This is conducted in conjunction with the security team, who advise and guide a team through the Modelling process. The outcomes from a Threat Modelling workshop are the initial security vulnerabilities for a component of an API. These need to be prioritised and assessed for risk. Remediation is then conducted according to the final assessment.

Generally a Threat Modelling workshop is conducted for any components that have not been assessed or when new components are added to and API.

A [Security Low Bar Assessment](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Security+Low+Bar+Security+Maturity+Assessment) Is an assessment done against a set of high-level security capability requirements that apply to all software development and onboarding initiatives. This assessment is done by the team involved and reviewed by the Security team for integration into the company's Architectural Framework.

## Further Reading

- [What is API Security Testing?](https://www.synopsys.com/glossary/what-is-api-security-testing.html)
- [OWASP Security Tools](https://owasp.org/www-community/api_security_tools)
- [API Penetration Testing](https://www.vaadata.com/blog/api-penetration-testing-objective-methodology-black-box-grey-box-and-white-box-tests/)

## Further info or feedback

Please email us at <codex@myob.com> or contact us on Slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

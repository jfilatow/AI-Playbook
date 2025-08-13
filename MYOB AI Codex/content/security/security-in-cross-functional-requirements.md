---
title: Security in Cross Functional Requirements
---
<!-- confluence-page-id: 9293661936 -->
![](../assets/BANNER.png)

# Security in cross-functional requirements

#### Level of guidance: Standard

## What is it?

Cross-functional requirements encompass functionality that spans the entire system. For example, they might state, "Users should not wait more than 30 seconds for a page to load" or "We should handle 500 requests per second without performance drops."

Including security in cross-functional requirements means integrating security considerations into both the discovery and delivery processes.

## Why do we do it?

Neglecting security until later in the development process is a common pitfall. Instead, we prioritise integrating security from the beginning, allowing the team to:

Discover and identify security opportunities and requirements early.
Embed security into the product rather than adding it as an afterthought.
Foster ongoing conversations about security, making it a shared responsibility within the development team.

## How do we do it?

At MYOB, we have teams practising "Security in cross-functional requirements." Here are some examples:

- Define security as part of Cross Functional Requirements, as suggested by [inception](https://helpme.myob.com/hc/en-us/articles/4409243393945-4-Deliver-Phase)
- Make security a part of a user story, by defining it as an acceptance criteria.

- Create security user stories, or "Abuser Stories," to incorporate "thinking like a bad actor" into defining and refining user requirements. This lightweight practice helps the team identify potential threats and vulnerabilities. Additionally, these stories can track threats identified during Threat Modelling. [Threat Modelling](./threat-modelling.md).

## Further Resources

[OWASP Security requirements](https://owasp.org/www-project-proactive-controls/v3/en/c1-security-requirements)

## Relevant Standards

[Low bar security requirements](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Low+Bar+Security+Requirements)

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

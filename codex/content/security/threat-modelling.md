---
title: Threat Modelling
---
<!-- confluence-page-id: 9293956096 -->
![](../assets/BANNER.png)

# Threat Modelling

#### Level of guidance: Standard

## What is it?

Threat modelling is a risk-based approach to securing IT systems. It’s a systematic technique used during software design to create resilient software and is also effective for identifying threats in existing systems.

## Why do we do it?

The purpose of threat modelling is to identify possible threats to a system, mitigate them when possible, and manage or accept the risks when necessary.

At a high level, threat modelling answers four key questions:

1. What are we working on?
2. What can go wrong?
3. What are we going to do about it?
4. Did we do a good enough job?

This process helps teams identify and prioritise security and privacy risks while developing a risk treatment plan to assess the effectiveness of countermeasures.

Threat modelling offers assurance in explaining and defending an application’s security posture and benefits software development by:

- Detecting design flaws and potential issues at any lifecycle stage.
- Evaluating new attack vectors that might otherwise be overlooked.
- Identifying security requirements.
- Remediating issues through appropriate controls.
- Highlighting assets, threat agents, and controls to identify potential attack targets.
- Modelling threat agents' motivations and capabilities to locate potential attackers relative to the system architecture.

## How do we do it?

Threat modelling should be tailored to the team’s workflow. For teams working iteratively, conducting shorter threat modelling sessions for new features or significant changes is effective.

Before starting, it's essential to understand the software's security objectives, which impact core concepts like integrity, confidentiality, availability, authentication, authorisation, and auditing.

Some high-level security objectives might include:

- Ensuring data integrity and confidentiality
- Maintaining high availability
- Preventing data and intellectual property theft
- Preventing unauthorised access

Once objectives are clear, begin threat modelling by:

**Diagramming the Application**:
Create data flow diagrams detailing system actors, components, services, protocols, ports, and authentication.
Classify data with an access model.
Identify architectural network segmentation and trust boundaries (e.g., cloud, DMZ, internal, public).

**Identifying Threats**:
Assess threats at changing trust boundaries.
Identify threats at entry/exit points of the application or system.
Recognise threats related to changes in user/actor access privileges.
Prioritising Threats and Identifying Controls.

**Documenting the Threat Model and Validating Controls**.

MYOB Security Engineering team helps engineering teams to threat model their products (existing and new) and have documented details [here](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/834699309/Threat+Modelling+Workshops).

## Principles

- **Early and Frequent Analysis**: Use threat modelling to enhance the security and privacy of a system through regular evaluations.
- **Alignment with Development Practices**: Ensure threat modelling aligns with the organization’s development processes and adapts to design changes in manageable iterations.
- **Stakeholder Value**: Make threat modelling outcomes meaningful and valuable to stakeholders.
- **Importance of Dialogue**: Foster open communication to build shared understanding, while documentation captures these insights for measurement and accountability.

## Further Resources

- [Threat Model Template](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/1699547452/Threat+model+-+Template)
- [Security Principles and Best Practices](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/855933667/Security+Principles+and+Best+Practices)
- [Threat Modelling FAQs](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/2272953027/Threat+modelling+FAQs)<!-- vale MYOB.Spelling = NO -->
- [OWASP Threat Modeling Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html)
<!-- vale MYOB.Spelling = YES -->

## Relevant Standards

- [MYOB Low Bar Security Requirements](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Low+Bar+Security+Requirements)

## Further info or feedback

Please email us at codex@myob.com or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

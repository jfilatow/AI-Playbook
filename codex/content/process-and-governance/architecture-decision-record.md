---
title: Architecture Decision Record
---
<!-- confluence-page-id: 9293956008 -->
![](../assets/BANNER.png)

# Architecture Decision Record & Register

## Introduction

Architecture Decision Records (ADRs) are a technique for capturing important decisions made during software architecture design and development. ADRs provide a way to document the reasoning behind a decision, its context, alternatives considered, and any trade-offs made. ADRs are a valuable tool for communicating and sharing architectural decisions with stakeholders, team members, and future developers.
This document provides guidance on how to use ADRs effectively in your software development projects.

## When to use ADRs

ADRs should be used to document significant decisions related to software architecture. A good way to assess if a decision is significant is to check if sets a new architectural direction for a system/ domain/ LoB/ MYOB. Another way to assess this could be a simple, "Does this need more than a couple of cards to do?"

These could include decisions related to:

- Technology choices (e.g. programming language, frameworks, libraries, databases)
- System design (e.g. component architecture, deployment topology, data flow)
- Non-functional requirements (e.g. performance, scalability, security, maintainability)
- ADRs should be created as soon as a significant decision is made. This ensures that the reasoning behind the decision is captured when it is fresh in everyone’s mind.

## ADR format

Use [this template](https://myobconfluence.atlassian.net/wiki/spaces/TEC/pages/9329901632/Template+-+Architecture+Decision+Record) to create ADRs.

## ADR & Decision Management

ADRs should be created and managed in a central location, such as a repository in a version control system or in Confluence. Based on the Type of decision, the ADR should be housed in the appropriate section for that domain or Line of Business or for all Technology.

## Decision Register

A Decision Register is an index of ADRs for a domain/ LoB / MYOB. When a decision is made, the relevant team members should be notified and the ADR should be added to the appropriate decision register.

Refer [Decision Starter Kit](./decision-framework.md) for more.

## References and Further Reading

- Confluence links which talk about ADRs
  - [Advanced Platform](https://myobconfluence.atlassian.net/wiki/spaces/ADVPF/pages/9034401710/Architecture+Decision+Records?NO_SSR=1)
  - [ADR and template](https://myobconfluence.atlassian.net/wiki/spaces/COS/pages/1250069950/Architecture+Decision+Record+Template)
- [ADR examples and templates](https://adr.github.io/)
- [More Reference and examples](https://github.com/joelparkerhenderson/architecture-decision-record)

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

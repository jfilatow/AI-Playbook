---
title: Principles
---

![MYOB Banner](../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9293661764 -->

# Principles

---

These are the principles that guide how we deliver software MYOB.

## Work in small batches

Receive feedback as frequently as possible on small sets of changes, over infrequently releasing large sets of changes.

This makes it easier to:

- respond to customer feedback
- diagnose issues
  - small set of changes narrow the scope
  - in the worst case, rollback only reverts small set of changes

Fast pipelines are a key enabler of working in smaller batches.

## Everyone is responsible

No issue is "someone else's problem." People performing a variety of roles collaborate to deliver solutions that meet customer expectations. This includes everyone being responsible for the quality of the solution.

## Relentlessly pursue continuous improvement

Team members are empowered to continuously improve. Issues identified as pain points are candidates for improvement, whether they are process or tooling related.

Examples include:

- changing the way work is sliced to enable faster delivery of value
- improving pipeline speed
- automating security checks
- removing redundant dependencies
- updating dependencies regularly

## "Done" means in production

Value is realised when it is delivered to customers. This is when feedback can begin. Making the time between ready for release and released as short as possible is key. For comprehensive changes, decoupling deployment and release (via Feature Toggles) enables delivery of work in progress and simplifies the release to customers

## Repeatable Reliable Process

Flaky pipelines inhibit a team's ability to move at speed. Investing in the stability of pipelines as they are being developed, and remaining vigilant in addressing the root cause of failures when they occur is key. Common issues requiring focused remediation would be flaky tests and flaky deployments.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

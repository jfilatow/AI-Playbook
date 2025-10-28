---
title: Engineering
---

![MYOB Banner](../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9293661790 -->
![](../assets/BANNER.png)

# Design and Development

---

[<- Back to Engineering Standards](./README.md)

## DE-2022-KBA

### All systems must be covered by documentation and Knowledge Base articles (KB) that assist development and operations

Documentation makes it easier for teams to understand and develop a product or system, especially if there is a transition in ownership or custodianship.

When working on a system, at a bare minimum you must maintain and update the Confluence documentation overview for that system. If you need to create a new overview, the template for this can be found at Templates/System Documentation Template (fix link)

## DE-2022-DRP

### All systems must be covered by a documented Disaster Recovery plan

Disaster recovery is an important part of a product and an organisation's risk identification and management. A DR plan describes how MYOB will recover operational (and potentially development) assets, the time frame, and the approach.

Please refer to [Disaster Recovery (DR) review](https://myobconfluence.atlassian.net/wiki/spaces/MR/pages/8908931984/Disaster+Recovery+DR+review) for more details on what is required and who to engage when it comes to disaster recovery.

## DE-2022-DND

### All new systems or significant changes to existing systems must be covered by a solution design, created as part of the discovery and delivery process

The MYOB Discovery and Delivery framework is designed to guide teams through every phase of the product management process to help organise and simplify the activities involved in taking a product idea from conception through to launch and beyond. It covers both new products and enhancements of existing products.

For information on how to get started, refer to the [Discovery and Delivery hub](https://helpme.myob.com/hc/en-us/categories/4409087371033-Discovery-and-Delivery-Hub)

# Operations

## OP-2022-OBS

### All systems must have sufficient observability

Observability helps us understand the state of our systems, respond to issues quickly, and keep our systems secure. It can be implemented using techniques such as logging, metrics, tracing, monitoring, and alerting.

Logging helps with identifying and resolving problems, as well as keeping our systems secure. Refer to [Security/Logging](../security/logging.md) for details on what and when you should log.

Tracing helps us to quickly understand end-to-end interactions. This is often the first tool used when analysing an incident.

Monitoring helps us visualise and understand the health of our systems by watching key metrics from them.

Alerting ensures we can respond to incidents quickly. Any event that needs immediate attention should be covered by an alert. Alerts should be actionable, often by following a runbook. Excessive alerts should be avoided as they can cause alert fatigue, leading to important alerts being ignored.

MYOB's [Observability Team](https://myobconfluence.atlassian.net/wiki/spaces/OA/pages/1101044190/Observability) owns and operates our observability tooling.

# Governance

## SG-2022-OWN

### All systems must have an owner

An owner of a system is an individual that is wholly responsible for the decisions made about that system. Systems without owners are likely to atrophy over time and are likely to suffer extensive delays in development and enhancement due to a lack of direction.

## SG-2022-CAT

### All systems must be included in the Systems Catalogue

You should also ensure that your product or system is included in the [MYOB System Catalogue](https://system-catalogue.myob.com/home).

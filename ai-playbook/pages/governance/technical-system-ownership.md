---
title: Technical System Ownership
---
<!-- confluence-page-id: 9547907605 -->

![](../assets/BANNER.png)

# Technical System Owner (TSO)

> This is adapted from [Evan Bottcher's Blog](https://myobconfluence.atlassian.net/wiki/spaces/~944510255/blog/2022/02/03/8681915326/What+does+Technical+System+Ownership+TSO+mean)

## Introduction

We have an organisational imperative to address technology and delivery risks associated with our systems, or we will risk MYOB failing as a business no matter what shiny features we deliver in our product roadmap.

To address this, we've introduced the concept of Technical System Ownership (TSO) to describe a key role in the Technical ecosystem, and what responsibilities that role comes with.

Being a Technical System Owner is an enormously important role, with significant responsibility for our systems and the features they provide to our customers. We need effective ownership to apply to all our systems - even the ones which are ‘heritage’ and less fun to work on. When we don’t have effective ownership, we impart pain on our customers through unreliable and unavailable product, and this poses an unacceptable risk to our organisation.

This is not intended to be an exhaustive or explicit list of responsibilities and my evolve depending on the context of the system and the owner.

## Keep it running in production

* Maintain knowledge of the system and its role in our world. If it breaks people will look to the TSO to understand what impact this has on our customers and us. Everything should start from here.
* Set and track Service Level Objectives (SLOs) and ensure the team responds when those SLOs are at risk - these include customer facing reliability and performance.
* Ensure observability and alerting is configured for the system - so that our teams find out about outages before our customers do
* Adopt effective incident and problem management processes and tools to ensure any outages are responded to. Ensure critical actions from post-incident reviews are actioned promptly

## Keep it deployable

* Always ensure the system can be confidently and productively built, tested, and deployed to production.
* Capture information about the system, including contact details and relevant documentation in the System Catalogue, so we can quickly find out about it.

## Keep it secure and compliant

* Scheduled security testing when required and make sure vulnerabilities are actioned quickly
* Quickly patch any critical vulnerabilities in libraries and dependent services
* Have well tested processes in place to recover the system in the event of failure/data loss
* Ensure relevant compliance requirements are met e.g. ISO, PCI
* As a TSO you are also the owner for Data in your system, you must ensure all data assets in your system are documented and classified correctly

## Have a plan

* Keep a Light on the Hill up to date which shows the evolution (or exit) path for the system
* Regularly identify, review, and prioritise technical debt
* Maintain an appropriate business continuity plan

## Who are the accountable Technical System Owners at MYOB?

Every system should be owned by one domain at MYOB. The Technical System Owner will be at that domain level - generally the Engineering Manager for the domain.

No system should be without an owner, and no system should have ownership split across multiple domains.

A team within a domain might take primary responsibility for a system, doing all the work to ensure the system is healthy and reliable. However the Technical System Owner must ensure all the systems in the domain are in good health and on track.

## But.. we didn’t build this system

Sometimes we need to move ownership of systems around as the organisation evolves to meet new and interesting challenges. This means that a domain will have to take ownership of a system that it didn’t build and has limited knowledge of. A careful staged plan for transferring ownership is sometimes impossible, especially if knowledge hasn’t been well maintained previously for ‘heritage’ systems.

This means even more priority needs to be placed on de-risking these systems, doing archaeology, capturing knowledge, automating manual processes and migrating outdated tooling. We need to keep working on ways to make the inherent risks visible for all our systems.

## But.. this system is planned for decommissioning

Until the day a system is turned off, we must keep it reliable, secure, and deliverable. We cannot ignore the responsibilities of system ownership while a system is still serving our customers or our own business. Our customers don’t care what stage a system is in its lifecycle. They are rightly expecting it to keep doing whatever function it is performing for them. We have to make sure that happens.

Ownership matters.

## How do we prioritise the right things?

If you’re accountable for maintaining a healthy and reliable system, you also need to have the ability to respond and prioritise the fixes to be made by your team - to do this we need to have a better picture of the risks we carry and the likely impact on customers.

This year we plan to make some key improvements to how we track technical metrics and SLIs, set SLOs that reflect customer experience of our products, and capture and report a broader set of System Health Ratings. We want this to bring transparency and visibility into our system performance and overall health and empower our Technical System Owners appropriately.

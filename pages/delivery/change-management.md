---
title: Change Management
---
<!-- confluence-page-id: 9293923396 -->
![](../assets/BANNER.png)

# Change Management

#### Level of guidance: Suggestion

## What is it?

Change management is the practice of managing changes made to production or production-like environments. The aim is to prevent risky and uncontrolled changes from being made while also being efficient at enabling low-risk changes.

It's essential to maintain visibility into exactly which changes were made to which environments, when, and by whom, and to be able to trace them back to a change set in version control.

## Why do we have it?

The key outcome of Change Management is to maintain reliable service to our users while enabling many changes in a controlled environment.

Effective Change Management can be measured by an increased MTBF (mean time between failures) and a reduced MTTR (mean time to repair). Our approach should ensure that when something goes wrong, it is relatively straightforward to determine the cause of the failure and roll back to a well-known baseline if necessary.

## How do we do it?

At MYOB, we aim to make Change Management as lightweight as possible. As we support multiple products and services which have different constraints and release cadences, different practices are in place to manage the risk of changes. For example, some of our on-premise products. Due to the low-frequency releases (quarterly or half-yearly) and the size of changes, Change Management will be different compared to MYOB's usual focus, which is primarily on cloud-based SaaS products.

Where possible, [Continuous Integration](./continuous-integration.md) and frequent deployment of changes through to production is an excellent way to reduce the risk of each change.

The key factors for Change Management practices are as follows:

- **what is the change?** understand the environment, the change size, and the change complexity.
- **What is the impact?** to our customers, independent systems, and to other operational teams.
- **What is the risk?** and the related mitigation of the change risks.
- **When is the change?** understand and agree on the date, across all impacted teams
- **How to rollback?** if the change fails, what's the plan to revert to a previous working state

For high-impact and high-risk changes, the Change Advisory Board(CAB) is useful to decide whether a change should be made. If the risks outweigh the benefits, the change should not be made, or a less risky change should be made. The outcome of using the CAB can also include requests for more info or suggest modifications. This is an [Example of how Digital Experience manages changes with CAB](https://myobconfluence.atlassian.net/wiki/spaces/IS/pages/142574402/IT+Services+Change+Management+Overview).

It is also worth highlighting at MYOB, during a [Heightened Risk period](https://myobconfluence.atlassian.net/wiki/spaces/OA/pages/790167645/Heightened+Risk+Process), there are additional approvals required.

It's important to gather related metrics as part of the Change Management practice, such as the number of changes, times to detect an incident, time to fix an incident, what proportions of changes are successful, etc.

Using these metrics, we can measure the success of our changes, Analyse successful and unsuccessful changes to look for patterns, determine the root causes of unsuccessful changes, and use that to continuously improve our change management practices in the future.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

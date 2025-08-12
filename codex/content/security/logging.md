---
title: Logging
---
<!-- confluence-page-id: 9294021813 -->
![](../assets/BANNER.png)

# Logging

#### Level of guidance: Standard

## What is it?

**Logging** is a process of recording, storing, and tracking events that occur within an IT environment, such as a product, or system. These events could be: how a certain function has run; that a resource is unavailable; a server has errored; a user has failed to log in, or that a user has performed a privileged action.

These are often written as a textual representation in a [well-known format (MYOB)](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/2617967171/Security+Logging+Standards.) to describe what has happened in detail. For example:

```
- 2022-01-21 13:45:01 Host X (IP Z) is unreachable.
- 2022-02-22 13:45:01 Host X (IP Z) is 5% below its memory limit threshold.
- 2022-03-23 15:23:11 Application X on host Y experiencing latency threshold Z.
- 2022-04-24 18:45:22 Successful login from user X to system Y from location IP Z.
- 2022-05-25 19:43:20 Authorisation error from user X accessing resource ID Y from location IP Z.
- 2022-06-26 06:45:90 User X from location IP Z ran payroll on file Y.
```

Events are recorded at all layers of an IT environment, but just recording these events to a file is only one part of logging.

An event must be recorded and shipped to central storage to enable monitoring, alerting, analysis, and correlation. The systemic approach enables us to:

* **Aggregate**: Combine multiple log sources into a central location, grouped logically.
* **Filter**: Remove unneeded events, simplify queries and reduce stored log volume.
* **Correlate**: Match related events across multiple log sources and time periods to find patterns and trends.
* **Monitor and Alert**: Notify team members when an action (i.e. event) or a combination of actions (i.e. events) indicates something important is happening or has happened.

## Why do we do it?

Logging allows MYOB team members to gain awareness of the state of a system, and the behaviour of its users and record proof that an action has occurred. Amongst the many benefits of comprehensive logging data, logs enable developers to diagnose and troubleshoot specific issues that cause errors or unexpected behaviour; and perform capacity planning for current and future systems.

From a security point of view, logs enable our security team to perform the following functions:

* **Audit trails**, e.g. trace access, changes, modification, deletion, and exports of data.
* **Execution of high-risk functions**, e.g. detects payroll runs or changes to bank account information.
* **Detect events early before they are chained into an attack**, e.g. the earlier a security event is detected, the earlier response can begin.
* **Identifying security incidents**, e.g. user from a new location changed the email address for an account.
* **Plan future security architecture work**, e.g. identify many similar events that can be prevented with a new security capability.

## How do we do it?

The observability team manages MYOB's centralised logging platform. The security teams' Low Bar document lists details on how to ship and store logs [central storage (LM001)](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/8903622866/Low+Bar+Security+Requirements)

You should review LM001 thoroughly, and read the resources listed in the [Further Resources](#further-resources):

#### Logging Events

When developing, improving, or modifying a system or product, the following types of security logs should be captured:

* **Authentication events (both, successful and failed)**: most applications at MYOB use OAuth to authenticate users, it is important to capture events relating to validating OAuth tokens, including where they were or were not validated; what scope was the token used for; The locations they attempted to authenticate from (IP address, etc.).
* **Authorisation failures**: any access control violations to a resource (it's important to capture successful and failed access attempts to specific data and resource IDs).
* **Session modifications**: whenever a user session fails to comply, this indicates attempts to modify user data outside the application, which could be an indication of an attempted security breach.
* **Use of higher-risk functionality**: whenever a change is made in a sensitive part of the system, i.e. administrator privileges are used, updating/deleting users, contact details, credentials, bank account or payroll information, etc.
* **Access to sensitive data**: all access to sensitive data, both successful and unsuccessful, must be logged.
* **Input validation failures**: all events relating to data not adhering to our input (or output) validation checks must be logged. This can include protocol violations, unacceptable encodings, and invalid parameter names and values.
* **Bespoke user behaviour**: while typical logging requirements could be considered universal, at MYOB we build bespoke software with expected user behaviour, as such all anomaly or outlier behaviour should be identified and logged (e.g. practice user X accessing files from Practice Y).

#### Logging data

When developing, improving, or modifying a system or product, the following types of data should be captured:

* User Identification.
* User location.
* Type of event.
* Date and time.
* Success or failure indication.
* Origination of event.
* Identity or name of affected data, system component, or resource.

## Principles

1. Do not log [Sensitive Information](./information-classification.md).
1. Do not hide the actions of specific users, groups, or 'trusted' parties from logs.
1. Understand the lifecycle of your logs, and if your product or system requires specific logging records or lifecycle requirements.
1. Follow established company standards.
1. Consult with the security team to include relevant log data.

## Further Resources

* [MYOB Audit Logging and Monitoring Standard](https://myobo365.sharepoint.com/sites/IQMS/Shared%20Documents/Policies%20and%20Documentation/All%20MYOB%20Standards%20-%20Published/MYOB%20Audit%20Logging%20and%20Monitoring%20Standard.pdf)
* [MYOB 'Ask Security' Slack channel](https://myob.slack.com/archives/CANT8SKFY)
* [OWASP Logging Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html)
* [Security Logging Standards (MYOB)](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/2617967171/Security+Logging+Standards.)
* [Log Central (MYOB)](https://github.com/MYOB-Technology/ops-docs/blob/master/logging/log-central.md)

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

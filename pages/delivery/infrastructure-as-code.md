---
title: Infrastructure As Code
---

![MYOB Banner](../../assets/images/myob-banner.png)

<!-- confluence-page-id: 9293923436 -->
![](../assets/BANNER.png)

# Infrastructure as Code

#### Level of guidance: Default

## Decision to make

- How to provision and update infrastructure in a repeatable and reliable way?

## What is it?

Infrastructure as Code is the practice where the infrastructure that your applications run on is defined as code. This can then be source controlled and repeatably deployed across environments via automation.

IaC should manage all aspects of infrastructure. This includes networks, firewalls, security roles and permissions, storage, monitoring and alerting, and much more. If any infrastructure component cannot be managed using version-controlled source code, then we should consider not using it at all.

[Configuration Management](./configuration-management.md) is a related practice concerned with configuring the application itself.

## Why do we have it?

- Capture infrastructure knowledge: everyone in the team has access to the knowledge of what infrastructure has been provisioned, and can change the infrastructure to support new demands.
- Provision environments on demand: When infrastructure is stored as code, it makes it easy to spin up new test or disaster recovery environments by executing the code without human intervention.
- Avoid 'snowflake' servers: Servers that have changes manually applied become difficult to maintain over time, and in the event of failure are difficult to reconfigure correctly.
- Avoid environmental differences: Manually applying changes can lead to configuration differences between environments, resulting in less confidence that changes applied to one environment will work in another.
- Prevention of human error via 'click ops' such as accidentally terminating a server, or creating incorrect resources.

## How do we do it?

- **Describe infrastructure via configuration or code**: use the appropriate tooling for your deployment environment - e.g. Kubernetes manifest files for Jupiter-hosted services, CloudFormation and/or CDK for AWS, ARM templates for Azure. Check the [MYOB Tech Radar](https://tech-radar.myob.com/) for our latest view on IaC tools.
- **Infrastructure Changes applied via pipelines**: applying changes via a pipeline provides an audit trail of when changes were deployed and by whom.
- **Immutable servers**: an immutable server is never modified manually, and is replaced rather than updated when changes are deployed. This involves the creation of a "Golden Image" for an application, where all configuration, code, and dependencies are packaged at creation time, instead of runtime.
- Apply changes using [Deployment](./software-deployment.md) practices

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

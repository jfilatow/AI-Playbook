---
title: YBIYRI
---

![MYOB Banner](../../assets/images/myob-banner.png)

<!-- confluence-page-id: 9447538954 -->
# You Build It You Run It

#### Level of guidance: Default

## What is it?

You Build It, You Run It (YBIYRI) is a philosophy that emphasises the responsibility and ownership of a development team for the entire lifecycle of the software they create, including its deployment and operation. This can involve tasks such as setting up infrastructure, monitoring system performance, monitoring costs, addressing issues, and responding to incidents.

## Why do we have this?

This approach creates a culture of continuous improvement and shared responsibility throughout the software development lifecycle, leading to the following benefits:

- Ownership and accountability
- Faster feedback and deployment
- Stability and continuous improvement
- Customer satisfaction

## How do we do it?

There are several practices that enable great end to end ownership of code including a focus on quality & setting up CI/CD capabilities. Apart from these, a team should drive the following:

1. **Ownership:** Systems should have owners and be listed in the [System Catalogue](https://myobconfluence.atlassian.net/wiki/spaces/OA/pages/2734621209/System+Catalogue).

2. **Lifecycle Management:** Represent the appropriate [lifecycle stage](https://myobconfluence.atlassian.net/wiki/spaces/TEC/pages/9391737046/System+Lifecycle) of a system to enable appropriate roadmap planning.

3. **Environments:** Maintain development to production environments in as similar a way as possible while keeping them distinct from each other with appropriate data protection controls.

4. **Monitor Costs:** Teams should know & monitor the dollar cost of running their system. This cost can be via utilisation, license, and effort. These sources of cost should guide design choices & prioritisation. Where costs can’t be attributed easily, efforts should be made to estimate them & continually validate with the “paying” team.

5. **Monitor Performance:** Details in [Engineering Standards](https://myobconfluence.atlassian.net/wiki/spaces/TEC/pages/9293661790/Engineering).

6. **Provide on-call support:** More details in [here](https://helpme.myob.com/hc/en-us/articles/360033525013-On-Call-Policy) & [here](https://myobconfluence.atlassian.net/wiki/spaces/TEC/pages/9428765152/Incident+Management).

7. **Custodianship:** Manage the backlog of custodianship work as the system moves through its lifecycle, leveraging information from Nucleus, AWS Trusted Advisor and also initiatives like our System Health Censuses to appropriately prioritise action on custodianship tasks.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

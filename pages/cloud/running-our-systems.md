---
title: Running Our Systems
---

![MYOB Banner](../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9577005343 -->

# Running Our Systems

---

## Introduction

Running systems in the cloud responsibly requires concerted effort. We need to ensure that our systems are secure, reliable, and cost-effective. This guide will suggest some best practices for running systems in the cloud.

### Cost Management

Provisioning resources in the cloud is relatively easy compared to traditional data centres. However, this ease of provisioning can lead to cost overruns if not managed properly. Here are some best practices for managing cloud costs:

1. **Regularly review costs**: This will initially help us understand the cloud costs of running our systems and later help surface opportunities for cost optimisation. Understanding the cost assists with budgeting, forecasting and pricing our products. Regularly reviewing costs will also help us identify and address any unexpected spikes in costs.

2. **Resource lifecycle management**: Cloud resources can easily accumulate over time and lead to unnecessary costs and risk. Regularly review and ensure that resources are removed when they are no longer needed.

3. **Right-size resources**: Ensure that resources are appropriately sized for the workload and environment. Over-provisioning can lead to unnecessary costs. For example, an AWS RDS `db.m7g.xlarge` costs twice as much as a `db.m7g.large`.

4. **Generational improvements**: Regularly review and update the resources used in the cloud to take advantage of newer, more cost-effective options. For example, `gp3` volumes are both more cost-effective and performant than `gp2` volumes. AWS RDS offers Graviton instances that can be lower price and higher performance than other instances of equivalent size (e.g. `db.m7g.large` compared to `db.m6i.large`).

5. **Autoscaling**: Autoscaling, horizontally and/or vertically, can help ensure that you have the right amount of resources at any given time. This can help save costs by scaling down resources when they are not needed. Consider scaling down non-production environments outside of business-hours e.g. with AWS Instance Scheduler.

6. **Use Reserved Instances**: Your workload already be covered by MYOB-wide Savings Plans. If you have predictable workloads at scale, consider using reserved instances to further save costs. Talk to the Cloud Engineering via [#svc-aws](https://myob.slack.com/archives/C0WN82RPV) for guidance.

7. **Use Spot Instances**: For workloads that are fault-tolerant and can be interrupted, consider using spot instances to save costs.

8. **Share success stories**: Share success stories of cost optimisation with the wider team. This will help share knowledge and strategies for cost management, and foster a culture of cost-consciousness, encouraging others to look for opportunities to optimise costs.

#### Tools

There are many tools available to help manage cloud costs. Some tools that we use at MYOB include:

- AWS Cost Explorer
- [AWS Cost Insight Dashboards](https://myobconfluence.atlassian.net/wiki/spaces/CLOUDENG/blog/2022/11/22/8969191718/Announcing+AWS+Cost+Insight+Dashboards)
- [Azure Cost Management](https://azure.microsoft.com/en-au/products/cost-management)

#### Success stories

- [Jupiter AWS Cost Optimisations](https://myobconfluence.atlassian.net/wiki/spaces/JUP/blog/2022/12/19/8972697603/Jupiter+AWS+Cost+Optimisations)
- [Jupiter on Spot Instances](https://myobconfluence.atlassian.net/wiki/spaces/JUP/blog/2024/02/05/9403208244/Jupiter+Platform+Updates+-+February+2024)
- [Advanced FinOps Initiative 2023](https://myobconfluence.atlassian.net/wiki/x/s4DGFQI)
- [Snowflake Cost Optimisation](https://myobconfluence.atlassian.net/wiki/x/kwEYRgI)

Managing cloud cost is only part of total system cost management. See the [System Cost Management](../production-operations/cost-management.md) entry for broader details.

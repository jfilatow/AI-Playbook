---
title: Release Management
---
<!-- confluence-page-id: 9293923491 -->
![](../assets/BANNER.png)

# Release Management

#### Level of guidance: Suggestion

## What is it?

What is a **release**? A release is the process of making product changes (value) available to customers.

What is **management**? - The practices and processes leveraged to provide a stable, plannable, and reportable outcome.

Hence, **Release Management** is the practice of planning and managing how product changes are released to our customers, to reduce the impacts and risks to their business processes.

## Why do we have it?

The key outcome of Release Management that we want is the confidence that changing our software products and systems will have minimal to ideally no negative impact on our customers.

There are certain risks that are associated with releasing software. Some problems or risks we may face as an organisation are:

- **Support risks**: releases may require onboarding or training, so a release may need to be documented and showcased to relevant stakeholders in sales, support, or to the customer ahead of time.
- **Release windows**: changes can only occur between specific high-risk periods of time. This means scheduled, forward-thinking releases to avoid dangerous times of the year.
- **Impact Risk**: Changes to our products may have large impacts on our customers, especially in environments with custom modules or code built on top of MYOB products.

We want to be able to track when a product or feature release should occur and when it has occurred, so we can gain transparency and audit our applications over time, and mitigate the above risks with confidence.

## How do we do it?

At MYOB we strive for lightweight Release Management. Teams are empowered to make the necessary changes at the appropriate granularity, in the context of their domain. This is enabled to meet the desired outcomes agreed upon by management.

Due to the varying size, effort, and schedules of the many products MYOB delivers, Release Management may differ vastly between products or systems. Release Management looks different for an on-premise in-person installation release versus a cloud-based continuously-delivered software-as-a-service release.

The key things to know to succeed at Release Management are:

- **Know your product domain, plan accordingly**: Understand your product and its customers. Don't try to do daily release cycles for incredibly complex on-premises enterprise deployments, and don't aim for biannual release cycles for continuously integrated SaaS products.
- **Automate as much as possible**: Reduce manual steps and automate the release process. This includes testing, builds, deployments, configuration, infrastructure and etc.
- **Communicate any plans**: Keep stakeholders informed about upcoming releases as soon as possible. This includes both internal and external stakeholders.
- **Cross-Functional teams**: Release Management is a product-wide effort that should involve cross-functional teams working on the product, not only product and tech teams, but also related customer support, consultant, legal/risk/compliance depending on the release.
- **Measurement and Analytics**: Try slow rollout deployment techniques such as Canary Deployments or Blue/Green deployments, to see how a new release performs. Gather analytics and telemetry data, and use this to understand the product baselines, and how a release performs against these baselines.
- **Auditing and Governance**: Ensure there is an unchangeable log of releases, for auditing and governance purposes.
- **Continuous Improvement**: Use the right metrics to measure the effectiveness of the Release Management process and continuously evolve the process. If things go wrong, think about why, and how you can improve that in the future.

## Related Practices

- [Feature Toggles](./feature-toggles.md): Feature toggles are one way of separating the technical practice of deployments from the business practice of product releases

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

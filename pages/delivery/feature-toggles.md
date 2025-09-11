---
title: Feature Toggles
---

![MYOB Banner](../../assets/images/myob-banner.png)

<!-- confluence-page-id: 9293661745 -->
![](../assets/BANNER.png)
# Feature Toggles
#### Level of guidance: Default

## Decisions to make
- How do I manage unfinished code in a continuous integration/continuous deployment repo without feature branches?
- How could I A|B test a specific feature?

## What is it?
Feature toggles are an engineering practice where specific code or features are enabled or disabled based on the configuration supplied to the application. This allows for the code to be production ready in source control but also hides in-progress features while they are being developed and tested.


Implementing a feature often involves making code changes over many deployments, where the feature toggle can be disabled in all production environments. When the feature is ready and the business is ready to enable the feature, the toggle can be enabled.

Further reading: [Feature Toggles (Martin Fowler)](https://martinfowler.com/articles/feature-toggles.html).

## Why do we have it?

Feature Toggles Enable:
* The decoupling of feature deployments and releases, which helps reduce development and delivery complexity.
* Unfinished work will not block a deployment.
* Higher software quality by testing and integrating code earlier, with faster feedback for developers.
* Smaller incremental delivery of work.
* Reduction in delivery risk via removal of 'big bang' deployments.
* Reduce/remove long-lived feature branches, which reduces delivery risk and merge issues.
* Feature toggles are often used to enable [Trunk Based Development](./trunk-based-development.md).
* Further reading can be found here: [Feature Toggles (Martin Fowler)](https://martinfowler.com/articles/feature-toggles.html).

## How do we do it?
There are many ways in which this can be achieved and is fairly dependent on the context and size of the feature in question. Some examples could be:
- Simple if statements
- Environment Variables
- Language-specific configuration libraries
- 3rd party Feature Toggle services.

MYOB has access to Split.io for toggling-as-a-service.

You should _not_ use a 3rd party tool to manage business functionality of feature allocation. For example, showing premium features to a premium user type. This is not a feature toggle but a business rule that belongs in the application code.

There are general locations of feature toggles to consider:
* 'At the edge' - e.g. Not registering a Web API endpoint in prod so the entry is blocked
* 'At the core' - e.g. within the code e.g. only show the new price after a certain date

3rd party apps like Split.io can provide other useful benefits such as notifications and analytics. It is best to consider more advanced tooling when scaling, and if the other features will provide value to your team.

When you are starting to use feature toggles:
* Start with simple implementations
* A toggle has a lifespan, aim for days or weeks while you are getting started.

## Feature Toggles Are Temporary
As an application grows in complexity, the number of toggles can grow even more rapidly, as they are both cheap and useful. This increase in toggles, however, can lead to higher testing and management complexity.

It's important to note that feature toggles are ultimately temporary, and after they begin to deliver value, they should be removed.

Teams should be reviewing toggles often and removing redundant, abandoned, or unneeded toggles. Feature Toggle systems can help to alert teams to audit toggles.

Some other suggestions to help manage toggles:
* Using "expiration dates"
* Placing a limit on the number of feature toggles
* Ensure a removal task is created when a toggle is created

## Feature Toggle Life Span
The lifespan depends on the context of the feature.

As mentioned previously, aim for days or weeks if you can.

The longer they exist the higher chance they will be orphaned.

The only strong guidance here is that they should be removed at a point in time. The sooner you remove them the better.

## Further info or feedback
Please email us at codex@myob.com or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

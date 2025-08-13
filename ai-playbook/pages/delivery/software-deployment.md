---
title: Software Deployment
---
<!-- confluence-page-id: 9293955925 -->
![](../assets/BANNER.png)
# Software Deployment
#### Level of guidance: Default

## What is it?
Software deployment is the engineering practice where a team makes a technical decision to put an application into a target environment, e.g. a test environment, the production cluster, a cloud stack, or the end user's desktop or mobile device.

It is a collection of steps, activities, and processes that are required to make a change to code, configuration, or data, e.g. create the database, start the application server, register with logging, etc.

A software release is a business process where the features of the deployment are enabled for end users. Separating deployments from releases allows the business to decide when the features should be made available, i.e. Quarterly, during maintenance, daily, etc.

Continuous Deployment is a deployment practice that complements continuous integration. Read more about [Continuous Deployment here](../glossary.md#continuous-deployment).

Further reading [here](https://www.informit.com/articles/article.aspx?p=1833567&seqNum=2) and [here](https://martinfowler.com/delivery.html).


## Why do we have it?
Software deployment is one of the most important parts of any software development process. It is the process of putting an application into a target environment. i.e. Deploying my website to the test environment, allowing for the application to be reviewed and tested by QAs, Developers, or Product Managers.

The strategies used by developers to [Integrate Code](./continuous-integration.md) have an impact on the quality and speed that changes can be made and thus deployed.

Teams that streamline integration and deployment processes can deliver new features more frequently, with better quality, and with reduced risk.

## How do we do it?
* Practice [Continuous Integration (CI)](../glossary.md#continuous-integration).
* [Infrastructure As a Code](./infrastructure-as-code.md) - define all the resources together with the code in your repository and do any changes to infrastructure in the code as a part of the deployment process.
* Quality built-in - [quality strategy](./quality-strategy.md) is strictly followed.
* Always use an automated deployment pipeline. At MYOB we use [Buildkite](https://myobconfluence.atlassian.net/wiki/spaces/OA/pages/1541113027/Buildkite) as a pipeline tool of choice.
* Consider practising [trunk based development](./trunk-based-development.md). The value may depend on the system your team is dealing with and the team's maturity.
* Learn about [Change Management](./change-management.md) and [Release Management](./release-management.md)
* Use artefact management tools. At MYOB the preferred tool is [Cloudsmith](https://myobconfluence.atlassian.net/wiki/spaces/OA/pages/1544781924/Cloudsmith).
* Decouple deployment and release. [Feature toggles](./feature-toggles.md) can greatly help with this.
* Release small and frequent changes to get fast and early feedback.
* Regular automated deployments for apps with infrequent changes, to make sure the deployment process keeps working, dependencies are kept up to date, and developers can get feedback on errors.
* Canary deployments may be used depending on the nature of the system and requirements. Read more [On the glossary](../glossary.md#canary-deployment)) and [At Martin Fowler's Blog](https://martinfowler.com/bliki/CanaryRelease.html).
* Reduce variance - build the application once, then deploy the same build artefact into higher environments with a different configuration, to reduce the possibility of the compiled or interpreted version of the software varying between environments.
* Reduce runtime dependencies - resolve all dependencies (e.g. third-party libraries) when building the artefact, so that dependencies don't need to be resolved later at deployment time.
* Smoke test after promotion - gain feedback on whether the deployment was successful, before making it available.
* Zero-downtime deployment - deploy without interrupting customer experience.

## Further info or feedback
Please email us at codex@myob.com or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

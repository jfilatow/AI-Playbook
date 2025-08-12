---
title: Quality Strategy
---
<!-- confluence-page-id: 9293923467 -->
![](../assets/BANNER.png)
# Quality Strategy
#### Level of guidance: Default

## What is it?
MYOB's quality strategy is a set of practices that enable teams to move fast while being confident they aren't negatively impacting customers.

## Why do we have it?
A good quality strategy will provide fast feedback and empower teams to stay nimble and make changes quickly.

Without an effective quality strategy, teams can lose their confidence to make changes quickly. Sometimes teams can find their tests becoming a maintenance burden that hinders their ability to deploy to production. This means they are slower to deliver value to customers and slower to respond to any issues that arise.

## How do we do it?

### We shift quality left
By including quality and testing concerns during the planning and elaboration stage of delivery, we enable faster feedback on problems and help foster a quality-first mindset. Quality is explicitly included in the inception and elaboration stages of delivery.

### We share responsibility
By making teams collectively responsible for quality, we ensure issues are actively worked on at the earliest time.
Quality Analysts are responsible for overall strategy and processes, but it is the team that is responsible for the final quality outcome.

### We practice Test Driven Development
By practising Test Driven Development (TDD), we ensure quality is built into our development practices.
It also helps us continuously refactor and improve our code, as well as avoid unnecessary complexity.

### We follow the testing pyramid
By following the testing pyramid we ensure our tests are fast and reliable. Unit tests provide the fastest feedback and are the foundation of our testing.
All core logic should be covered by unit tests.
Other types of tests are used to cover areas that unit tests can't reach. Whenever writing tests higher in the pyramid, we always ask ourselves if the same outcome can be achieved with a faster, more reliable test.

### We automate our tests
By automating our tests we make them faster and more reliable. Teams should have the confidence to deploy to production after a desk check, without the need to execute any manual regression tests.

### We cultivate our tests
By tending to our tests we ensure they remain fast, reliable, and relevant. If there is a bug or an incident we add test cases to ensure similar issues don't recur. We also actively seek opportunities to make our tests faster and more reliable by fixing, replacing, or removing tests that are redundant or fail too often.

### We test proactively
By using techniques such as security testing, load testing, performance testing, and exploratory testing, we discover and address issues before they impact our customers.

### We invest in our ability to recover
By investing in our ability to recover quickly, we minimise overall negative customer experiences. This includes adequate logging, monitoring, and alerting. We invest both in minimising the chances of issues reaching production and in our ability to recover quickly when they inevitably do.

### We measure and enforce quality
By using tools that analyse, measure, and enforce quality, we better understand and maintain our quality posture. This includes static analysis tools that can be automated as part of our pipelines.

### We define and document quality strategy
Quality strategy is a document created by the team during the early stage of the software delivery. The quality strategy defines scope, roles and responsibilities, testing strategy, test environments, CI/ CD, triage process, how go-to market/release approaches(dark launch, feature toggle, AB testing, pilot, staggered, GA etc) and Risks. Having a quality strategy enables teams to build a shared understanding of the entire process that will deliver quality for a team/ program.
Example templates:  
* [Template 1](https://myobconfluence.atlassian.net/wiki/spaces/SA/pages/8693711665/Quality+Strategy+Structure)

### We define testing strategy 
When a new project is initiated or when we expand existing products with new features or capabilities, we make sure to define our [testing strategy](./testing-strategy.md) so that the team has a shared understanding of what types and levels of testing to perform. The testing strategy refers the test pyramid and recommends when and what to automate for a specific feature delivery.  

## Further info or feedback
Please email us at codex@myob.com or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

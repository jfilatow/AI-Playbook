---
title: API Design
---
<!-- confluence-page-id: 9292186723 -->
![](../../assets/BANNER.png)

# API Design

## What is it?

The practice of API design focuses on what an API does and how consumers interact with it. There are many other characteristics of APIs such as type, protocol, or security, but these are not covered here.

## How do we do it?

We should consider the following when designing APIs:

- API interactions should do one thing well. Interactions should be specific and easily understood. There shouldn't be any unexpected consequences. These types of interactions promote reuse and can be easily built into valuable user experiences. Interactions that do too many things are difficult to reuse because different consumers will have different needs.

- APIs should not have hidden assumptions. API interactions should not make any assumptions about the state of the consumer or the provider. This makes APIs easier to use and reuse because there are no dependencies on the state of specific systems. Hidden assumptions can increase friction, bugs and incidents when new consumers come on board.

- APIs should follow standards. APIs that follow industry standards are easily understood by both humans and machines. This makes it easier for consumers to adopt our APIs. Departing from standards will cause confusion and can make it harder to integrate using standard libraries.

- APIs should make error-handling easy. Errors should follow standards so that they can be handled by consumers appropriately. APIs should use error codes and include information that allow users to handle errors easily and appropriately. We also prefer idempotent interactions so that consumers don't need to consider side-effects or the state of a provider before retrying.

- APIs should be designed like a product. Consumers should be considered as customers when designing APIs as the value of APIs are only realised via experiences delivered by consumers. APIs that are built without any product-thinking can result in sub-optimal value or even worse - never get used!

- APIs should deliver domain capabilities beyond CRUD operations. This help helps build meaningful domains that respect boundaries. APIs that look like database CRUD operations can result in domain capabilities scattered across consumers who need to implement the logic themselves. This can result in less reuse and functionality duplicated across multiple systems.

- Interactions are not bespoke to a consumer. While we should not build for use-cases that don't exist, there are many pitfalls when APIs are built without considering multiple consumers. The fastest way to deliver value is often building on top of existing interactions - however this leads to a tendency of Bespoke APIs to develop hidden side-effects and assumptions. This can result in friction for new consumers, bugs or even production incidents.

## Further Notes on API Design and Architecture

- [Types of APIs](./types.md)
- [Types of API Architecture](./architecture-types.md)
- [Design Patterns and how they are used with APIs](./design-patterns.md)
- [Best practices for Designing APIs](./design-best-practice.md)

## Further Guidance

At MYOB we most commonly have HTTP-based APIs using JSON that follow standard HTTP semantics. Detailed industry guidance on this can be found at:

- <https://httpwg.org/specs/rfc9110.html>

- <https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods>

The following links provide further guidance on API design:

- <https://cloud.google.com/apis/design>

- <https://www.infoq.com/presentations/effective-api-design/>

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

---

**Previous:** [← Apis](../README.md) | **Next:** [Api Observability →](../api-observability/README.md)

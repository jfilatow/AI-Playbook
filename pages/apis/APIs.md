---
title: APIs
---

![MYOB Banner](../../assets/images/myob-banner.png)

<!-- confluence-page-id: 9293923284 -->
![](../assets/BANNER.png)

# What is an API?

## Application programming interface (API)

An application programming interface (API) is a way for two or more computer programs to communicate with each other. It is a type of software interface, offering a service to other pieces of software

APIs underpin the business capabilities we provide to our customers. Good API design allows us to accelerate delivery through stable, reusable and well-understood abstractions to business logic. Good APIs should be easy to use, work as expected without any surprises.

## What makes a good API

- Reuse
  - It allows for reuse and is decoupled.
- Business logic
  - A good API should abstract a capability or operation from the consumer. Its not a simple pass through to downstream systems where the consumers need to understand and execute a set of steps. Good APIs focus on outside-in abstractions i.e. they create an interface the consumers want to use.
- Strong contracts
  - Does the app bypass the API for any capabilities. All access from the consumers goes through a strong contract i.e. the consumer never bypasses the API interface
- Ownership
  - Can one reasonably sized team own and manage the API. If not its not a good API and it probably needs to be split(if its too much) or merged(if its too small)
- Customer-first
  - A good API is designed like a product where consumers are its customers. It should be easy to use and hard to misuse, and it should do what people expect it to do without any unexpected side-effects.

## Characteristics of a well designed API are

- Easy to learn
- Easy to use, even without documentation
- Hard to misuse
- Easy to read and maintain code that uses it
- Sufficiently powerful to satisfy needs
- easy to extend
- appropriate to audience

## Categories

- Based on Consumers and access - internal, external, partner
  - the types are described [here](./api-design/types.md) in codex
- Based on protocol for e.g. SOAP, REST, GraphQL or RPC
- Synchronous vs asynchronous APIs

## Practices

- [API Design](./api-design/README.md)
- [API versioning](./api-security/versioning.md)
- [Documentation](./documentation.md)

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

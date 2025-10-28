---
title: Design Patterns used in API Architecture
---

![MYOB Banner](../../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9422864791 -->
![](../../assets/BANNER.png)

# Design Patterns used in API Architecture

---

Design patterns are reusable solutions to common problems encountered during software development. When designing APIs, several design patterns can be employed to ensure scalability, maintainability, and extensibility. Here's an outline of some commonly used design patterns specifically tailored for APIs:

## RESTful Design Pattern:

- Resource-based: Represent API endpoints as resources (nouns) with unique URIs.
- CRUD operations: Utilise HTTP methods (GET, POST, PUT, DELETE) to perform CRUD operations on resources.
- Stateless: Each request from the client must contain all necessary information for the server to fulfil the request.
  
### [The Restful Design Reference (from Patrick Savalle at medium.com)](https://medium.com/@patricksavalle/rest-api-design-as-a-craft-not-an-art-a3fd97ed3ef4)
![](../../assets/API-Design/RESTFul-API-Reference.png)

### Restful Design References
- [REST API Handbook](https://developer.wordpress.org/rest-api/)
- [RESTFul Patterns Best Practice](https://www.linkedin.com/pulse/api-design-patterns-best-practices-building-robust-apis/)

## DTO (Data Transfer Object):

- Transfer data between different layers of an application or between applications.
- Helps to reduce the number of method calls and data transmission overhead in APIs.

### DTO References
- [DTOs in the Entity Framework](https://learn.microsoft.com/en-us/aspnet/web-api/overview/data/using-web-api-with-entity-framework/part-5)
- [DTOs in C#](https://www.c-sharpcorner.com/article/data-transfer-objects-dtos-in-c-sharp/)
- [DTO Design Pattern Example](https://www.codeproject.com/Articles/1050468/Data-Transfer-Object-Design-Pattern-in-Csharp)

## Facade Pattern:

- Provides a simplified interface to a complex subsystem.
- Hides the complexities of the underlying system and present a unified interface to the client.

### The Facade Pattern as Applied to APIs
- [Microservice APIs and the Facade Pattern]()https://medium.com/israeli-tech-radar/microservices-facades-and-everything-in-between-c4898d73ddb2
- [The API Facade Pattern in Action](https://wso2.com/library/blog-post/2015/10/article-a-pragmatic-approach-to-the-api-facade-pattern/)

## Adapter Pattern:

- Helps in converting the interface of a class into another interface that a client expects.
- Useful for integrating existing APIs or systems with different interfaces. This can include Third-Party API Integration 
- When integrating with external APIs or internal APIs that have different interfaces, adapters can be used to convert the external API calls into a format that matches an application’s interface. 
  - This allows easy integration without changing the core APIs code.
- 
### The Adapter Pattern as Applied to APIs
- [Adapter Use with the Facade Pattern](https://medium.com/@BobGuBobGu/adapter-and-facade-patterns-8b05e00a29a3).
- [An Example of Adapter Use](https://www.linkedin.com/pulse/using-adapter-design-patterns-migrate-legacy-api-calls-tan-t/)

## Decorator Pattern:

- Allows behaviour to be added to individual objects dynamically.
- Useful for adding features like caching, logging, or rate limiting to API endpoints.

### The Decorator Pattern as Applied to APIs
- [Example of the Decorator Pattern in use with a Web API](https://www.c-sharpcorner.com/article/how-to-build-apis-using-asp-net-core-a-clean-architectural-approach-and-the-de/)
- [The Decorator in Microservices (APIs)](https://hackernoon.com/how-to-implement-decorator-pattern-in-microservice)

## Builder Pattern:

- Simplifies the creation of complex objects by separating the construction process from its representation.
- Useful for creating complex API requests or responses.

### The Builder Pattern as Applied to APIs
- [Builder Pattern use in APIs](https://hackernoon.com/using-the-builder-design-pattern-in-net-c-to-develop-a-fluent-api)

## Observer Pattern:

= Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.
- Useful for implementing event-driven APIs where clients subscribe to certain events.

### The Observer Pattern as Applied to APIs
- [Observer Pattern in use with APIs](https://www.c-sharpcorner.com/article/asp-net-core-web-api-development-with-observer-design-pattern/)
- [A RESTFul Observer Pattern Example](https://60devs.com/immediate-state-updates-for-rest-http-apis-using-observer-pattern.html)

## Factory Pattern:

- Defines an interface for creating objects, but allows subclasses to alter the type of objects that will be created.
- Useful for dynamically creating instances of classes based on specific conditions or configurations.

### The Factory Pattern as Applied to APIs
- [Application of the Factory Pattern in APIs](https://www.telerik.com/blogs/aspnet-core-basics-knowing-applying-design-patterns)

## Middleware Pattern:

- Chain of responsibility pattern used in the context of web applications.
- Allows processing of HTTP requests and responses through a series of middleware components.
- Useful for implementing cross-cutting concerns like authentication, authorisation, logging, etc., in APIs.

### Middleware Pattern References
- [What is Middleware?](https://www.moesif.com/blog/engineering/middleware/What-Is-HTTP-Middleware/)
- [A Middleware Example]()https://dotnettutorials.net/lesson/asp-net-core-middleware-components)

## Further References
 Here are some general references where you can find information about API specific design patterns:

- [API Design Patterns - Martin Fowler](https://martinfowler.com/tags/API%20design.html)
- [RESTful API Design Patterns - Microsoft Docs](https://microsoft.github.io/code-with-engineering-playbook/design/design-patterns/rest-api-design-guidance/)
- [Design Patterns for APIs - Swagger (now OpenAPI)](https://swagger.io/solutions/api-design/)
- [API Design Patterns - Apiary]()https://help.apiary.io/tools/style-guide/
- [GraphQL Design Patterns - GraphQL.org](https://graphql.org/learn/best-practices/)
- [API Design Patterns - Nordic APIs](https://nordicapis.com/design-first-api-development-myth-or-reality/)
- [Patterns in API Design - ThoughtWorks](https://www.thoughtworks.com/en-au/insights/topic/apis)

## Further info or feedback
Please email us at codex@myob.com or contact us on Slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

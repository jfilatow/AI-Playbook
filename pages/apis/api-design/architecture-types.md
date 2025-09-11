---
title: Types of API Architecture
---

![MYOB Banner](../../../assets/images/myob-banner.png)

<!-- confluence-page-id: 9422340466 -->
![](../../assets/BANNER.png)

# Types of API Architecture

Whilst there are different types of APIs whose requirements are defined by scope and Domain ([Types of APIs Page](./types.md)). These APIs can have different types of architecture depending upon their use and
environmental requirements. API architectures are based on different factors such as; the nature of the application, scalability requirements, security considerations, and integration needs.
Below are some common types of API architectures, each with its own advantages, use cases, and implementation considerations.
The choice of architecture depends on factors such as performance requirements, data complexity, and development team preferences.

The main types of API Architecture in use are;

- Protocol Based Architecture.
  - RESTful, SOAP , RPC APIs.
- Language Based Architecture.
  - GraphQL, gRPC, Falcor APIs.
- Transport Based Architecture.
  - WebSocket APIs.
- Event Based Architecture.
  - Event-Driven APIs (Microservice Type Architectures)

# Common types of API Architectures

## Protocol Based Architecture

API architecture can be protocol based. Thus, outlining the message formats and transport mechanisms. Some common types of protocol based API architectures are:

- REST, a collection of guidelines for lightweight, scalable web APIs.
- SOAP, a strict XML standard used by HTTP protocols (along with SMTP, FTP, UDP, and TCP) for request payloads via POST requests.
- RPC, a protocol for invoking processes that can be written with XML (XML-RPC) or JSON (JSON-RPC).

### RESTful API (Representational State Transfer)

REST is an architectural style that uses standard HTTP methods like GET, POST, PUT, DELETE for communication between clients and servers.
It employs stateless communication where each request from a client contains all the necessary information for the server to fulfil it.
REST APIs typically use JSON or XML as the data format.

- [RESTful References](https://restfulapi.net/)
- [AWS RESTful Examples](https://aws.amazon.com/what-is/restful-api/#:~:text=RESTful%20API%20is%20an%20interface,applications%20to%20perform%20various%20tasks.)

### SOAP API (Simple Object Access Protocol)

SOAP is a protocol for exchanging structured information in the implementation of web services.
It relies on XML as its message format and operates over HTTP, SMTP, or other application layer protocols.
SOAP APIs define strict rules for message structure and communication, often requiring additional libraries for implementation.

- [SOAP References](https://www.w3schools.com/xml/xml_soap.asp)
- [SOAP Example](https://www.microfocus.com/documentation/silk-performer/205/en/silkperformer-205-webhelp-en/GUID-FEFE9379-8382-48C7-984D-55D98D6BFD37.html)

### RPC (Remote Procedure Call) API

RPC is a protocol that allows a program to cause a subroutine or procedure to execute in another address space (commonly on another machine on a shared network).
RPC APIs abstract the complexity of network communication by allowing clients to call remote procedures as if they were local.
Common implementations include gRPC, which uses protocol buffers for serialisation and HTTP/2 for transport.

- [RPC References](https://www.ibm.com/docs/en/i/7.1?topic=category-remote-procedure-call-apis)
- [RPC vs REST](https://aws.amazon.com/compare/the-difference-between-rpc-and-rest/#:~:text=RPC%20APIs%20allow%20developers%20to,functions%20on%20another%20chat%20application.)

## Language Based Architecture

Language based API architectures are defined by the language they use. This often determines the messaging formats, although common formats like JSON and XML my wrap the language instructions within.
This may, in turn decide what protocols they use; Some examples of a language based API Architectures are; GraphQL, gRPC, and Falcor.

### GraphQL API

GraphQL is a query language for APIs and a runtime for executing those queries with existing data.
Unlike REST, where clients receive fixed data structures, GraphQL allows clients to request only the data they need, reducing over-fetching and under-fetching of data.
GraphQL APIs are typically organised around a single endpoint that receives queries specifying the requested data.

- [GraphQL References](https://graphql.org/)

### gRPC API

gRPC is a high-performance, open-source universal RPC framework.
It supports multiple languages and platforms and can be a suitable alternative or complement to GraphQL for building APIs.

- [gRPC References](https://grpc.io/)

### Falcor API

Falcor is a JavaScript library for efficient data fetching.
It allows you to model all your back-end data as a single virtual JSON graph, unlike REST APIs where each endpoint returns a fixed data structure.

- [Falcor Reference](https://netflix.github.io/falcor/)

## Transport Based Architecture

### WebSocket API

WebSockets provide full-duplex communication channels over a single TCP connection, enabling real-time bidirectional communication between clients and servers.
WebSocket APIs are suitable for applications requiring low-latency, continuous data exchange, such as chat applications, online gaming, or financial trading platforms.

- [AWS Notes on WebSocket APIs](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api.html)

## Event Based Architecture

### Event-Driven API: (Microservice Type Architecture)

Event-driven architecture involves the production, detection, consumption, and reaction to events.
Event-driven APIs facilitate asynchronous communication between services by emitting events and allowing other services to subscribe to these events.
This architecture is commonly used in microservices and distributed systems to enable loose coupling and scalability.

- [Event Driven Principles](https://medium.com/event-driven-utopia/event-driven-apis-understanding-the-principles-c3208308d4b2)
- [History and Evolution of Event Driven APIs](https://solace.com/blog/evolution-of-apis-restful-event-driven-apis/)
- [Architecture Notes](https://www.asyncapi.com/docs/tutorials/getting-started/event-driven-architectures)
- [Event-driven APIs in Microservice Architectures](https://github.com/wso2/reference-architecture/blob/master/event-driven-api-architecture.md)

## Further info or feedback

Please email us at <codex@myob.com> or contact us on Slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

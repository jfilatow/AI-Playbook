---
title: Observability Traces
---

![MYOB Banner](../../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9559278520 -->
![](../../assets/BANNER.png)

# Observability Traces

---

## Tracing
Distributed tracing is a method used to monitor and profile applications, especially those that are distributed across multiple servers, services, or components. It provides a way to track the flow of a single user request as it travels through various parts of a complex system. Distributed tracing is essential in modern software systems for several reasons:-

- Complexity Management: In distributed systems, a single request can traverse through multiple services and components. Understanding the flow of this request and identifying bottlenecks or failures becomes challenging without distributed tracing.

- Performance Monitoring: Distributed tracing helps in monitoring the performance of each component involved in processing a request. It provides insights into where time is being spent, which aids in optimising system performance.

- Troubleshooting and Debugging: When issues occur, distributed tracing provides a detailed view of the request's journey across services. This visibility is crucial for identifying the root cause of failures and debugging issues effectively.

- Dependency Analysis: With distributed tracing, you can analyse dependencies between different services and understand how changes in one service affect others. This is invaluable for maintaining and evolving complex systems.

- Capacity Planning: By analysing the performance data collected through distributed tracing, teams can make informed decisions about resource allocation and capacity planning to ensure that the system can handle expected loads.

- Understanding User Experience: Distributed tracing allows you to track requests from end to end, providing insights into the user experience. This includes understanding latency experienced by users and identifying opportunities for improving the overall user experience.
## Use of OpenTelemetry 
OpenTelemetry facilitates distributed tracing in following ways:-

- Instrumentation: It provides libraries and instrumentation agents for various programming languages and frameworks. Developers can use these tools to instrument their applications to automatically generate trace data for incoming requests.

- Trace Context Propagation: OpenTelemetry defines standard formats for trace context propagation, allowing trace information to be passed between different services and components in a distributed system. This ensures that all parts of the system can contribute to the same trace.

- Trace Collection and Export: It provides integrations with various back end systems and monitoring platforms like Sumo Logic, allowing trace data to be collected, aggregated, and exported for analysis. This data can then be visualised, analysed, and used for troubleshooting and optimisation.

---

### Resources & Useful Links
- [Distributed Tracing](https://system-catalogue.myob.com/docs/default/system/obs-central/traces/)
  
---

## Further info or feedback
Please email us at codex@myob.com or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

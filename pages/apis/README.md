---
title: APIs and Integration
---
<!-- confluence-page-id: 9292284900 -->

This section introduces how we think about exposing and consuming capabilities across systems at MYOB. It provides a shared framework for designing integrations regardless of whether they use Restful APIs, events, batch files, or other patterns.

The guidance is organised around three core dimensions:

- **Integration direction** – Is the system exposing a capability, or consuming one? (or both?)
- **Integration purpose** – What is the intent of the interaction (querying, triggering, syncing, etc.)?
- **Trust boundary** – Who’s on the other side, and how much control or confidence exists in the integration?

These dimensions shape the integration pattern help determine what controls we should apply. More detailed guidance on RESTful APIs, events, authorisation, and platform capabilities can be found in the rest of this section.

## Thinking in Domains and Capabilities

Integration is the mechanism but what really matters is how systems expose and consume business capabilities.

Well-shaped integrations start with clear domain boundaries. Each domain should define and own its capabilities. These should be cohesive, well-bounded, and designed to be consumed without leaking internal complexity.

When capabilities are not clearly owned or intentionally exposed, integrations often lead to tight coupling, unclear responsibilities, and architectures that are difficult to change.

## Integration Direction

Understanding whether a system is **exposing** and/or **consuming** a capability shapes how responsibilities are assigned and what controls need to be considered.

Exposing a capability means taking responsibility for how other systems use it, this involves defining contracts, protecting internal boundaries, and supporting external consumers.
Consuming a capability means depending on another system, adapting to its constraints and handling the risks that come with external dependencies.

While both sides require thoughtful design, the trade-offs and failure modes are different.

### Exposing Capabilities

Exposing a capability means making data or functionality available for others to interact with. This could be:

- Providing a RESTful API
- Publishing events to a topic
- Uploading files to a shared location

Key technical decisions to make when exposing a capability:

- How will the systems and data be protected from misuse or overload (e.g unintentional DDoS)?
- What contract will define how the capability can be consumed, and how to maintain a stable contract over time?

### Consuming Capabilities

Consuming means relying on a capability exposed by another system. Examples include:

- Calling a third-party or internal API
- Listening to events
- Processing data from a scheduled batch file

Key technical decisions to consider:

- What happens if the integration fails or becomes unavailable?
- How to reduce the impact of changes in the contract?

While the specific controls depend on the pattern, technology, and boundary crossed, the need for **clarity and reliability** is essential, whether exposing or consuming a capability.

[See the controls section at the end of this page for implementation guidance](#applying-controls-to-synchronous-integrations), but continue reading to understand how direction, purpose, and trust come together.


## Integration Purpose and Patterns

Understanding the purpose for using a capability, whether it is for querying data in real time or triggering a process, shapes how the capability should be exposed and consumed. Some capabilities are best expressed as restful APIs. Others are a better fit for event-based or other patterns.

Sometimes a single capability needs to be expressed in multiple ways, because different consumers may use it for different purposes.

The nature of the interaction, what outcome is needed, and when helps determine whether the integration should be **synchronous** or **asynchronous**.

### Synchronous interactions

Synchronous interactions are appropriate when an immediate answer is required and the caller is expected to wait. They suit critical operations where failures must be caught immediately and the caller is responsible for dealing with success or failure responses such as payments, password updates, etc.

At MYOB, RESTful APIs are the default choice for synchronous integrations.

### Asynchronous interactions

Asynchronous interactions are preferred when no immediate response is needed. This approach is better for high-scale operations, unpredictable or long-running processes. It also helps to decouple systems, improving reliability and resilience.

They are also useful when multiple systems need to react to the same event or when buffering and retries are important.

Responsibility for handling issues shifts to the receiving system, which may not always be aware of failures or missed messages.

### Matching purpose to pattern

This table links common integration purposes to the most suitable interaction pattern:

| **Purpose**         | **Description**                                              | **Interaction**   | **Examples**                                |
|---------------------|--------------------------------------------------------------|-------------------|---------------------------------------------|
| **Query data**      | Get data on demand                                           | Synchronous       | Get customer details, check system status   |
| **Sync data**       | Mirror data between systems, on trigger or schedule          | Asynchronous      | Push CRM updates, sync bank feeds nightly   |
| **Trigger process** | Start an action or workflow                                  | Synchronous or Asynchronous     | Make payment, kick off onboarding           |
| **Notify of event** | Alert other systems that something has changed               | Asynchronous      | Subscription suspended, customer unsubscribed |
| **Enrich a process**| Retrieve data during another system's workflow               | Synchronous       | Check fraud score before sending invoices   |


## What about MCP and interactions with AI agents?

Integrations with intelligent agents and the use of Model Context Protocol (MCP) are evolving quickly.

This is an emerging area, and patterns are still forming. If there's a need to use it, bring the use case to [Daisy][daisy] before proceeding. Until clearer guidance is available, it shouldn’t be used in production by default.


## Trust Boundaries

Every integration crosses a boundary — between systems, teams, or organisations. Sometimes the systems are owned by the same team. Other times, they span different domains or external partners. Understanding the trust boundary helps shape how much control and protection is required.

Trust influences key decisions, including:

- What level of authentication and authorisation is appropriate
- Whether to route traffic through controlled infrastructure (e.g. API gateways, proxies)
- What observability, governance, and SLA expectations should be in place

While trust varies, it’s often safest to assume a **low-trust default** unless there’s a clear reason not to. This helps avoid blind spots and prepares systems to evolve independently.

---

### Boundary Types

| **Boundary Type** | **Interacting With**                        | **Trust Level** | **Considerations**                                                                 |
|-------------------|---------------------------------------------|------------------|-------------------------------------------------------------------------------------|
| **Public**        | External untrusted third parties            | Low              | Strong protection controls, clear contracts, discoverable interfaces, rate limits |
| **Partner**       | Known organisations with formal agreements  | Medium-low       | Protected endpoints, versioned interfaces, monitoring and access governance       |
| **Cross-domain**  | Other MYOB domains or business units         | Medium           | Shared expectations, coordinated changes, consistent patterns                     |
| **Private**       | Systems owned by the same team/domain       | High             | Lightweight controls, faster iteration, local observability                       |


## Putting it all together: Designing and Securing the Integration

With integration direction, purpose, and trust boundaries established, this section brings it all together by outlining the controls that matter most.

These are not exhaustive checklists. They provide a foundation for secure, reliable integrations, and highlight where attention should be focused depending on how the integration is designed.

---

### Applying controls to synchronous integrations

| **Area**           | **Description**                                  | **Desired Outcome**                             | **Requirements**                                                                 |
|--------------------|--------------------------------------------------|--------------------------------------------------|----------------------------------------------------------------------------------|
| **Authentication** | Verifies the caller identity                     | Only trusted callers can access the API         | Use OAuth2, API keys, or internal tokens; validate at gateway or service         |
| **Authorisation**  | Enforces rules on what the caller can do         | Callers only access allowed resources           | Check scopes, roles, or claims at the API or service level                       |
| **Observability**  | Enables visibility across the request path       | Requests can be traced, monitored, and diagnosed| Include correlation IDs; log status codes, latency, and key actions             |
| **Error Handling** | Provides consistent behaviour on failure         | Failures are surfaced clearly and handled well  | Use meaningful status codes, retries, and fallback mechanisms where needed       |
| **Versioning**     | Enables safe evolution of APIs                   | Changes do not break existing consumers         | Use URI versioning, headers, or negotiation; support backward compatibility      |
| **Ownership**      | Defines who maintains the integration            | Clear responsibility for the interface          | Identify the owning team and document escalation paths                          |
| **Support & Onboarding** | Reduces time to integrate                  | Consumers can easily understand and use the API | Provide examples, docs, sandbox access, and contact channels                    |

---

### Applying controls to asynchronous integrations

| **Area**           | **Description**                                      | **Desired Outcome**                               | **Requirements**                                                                  |
|--------------------|------------------------------------------------------|----------------------------------------------------|-----------------------------------------------------------------------------------|
| **Authentication** | Validates identity of producers and consumers        | Only trusted publishers or subscribers allowed     | Use identity-aware brokers or token-based access                                 |
| **Authorisation**  | Manages access to topics or event types              | Unauthorised access is blocked                     | Role- or group-based controls at broker or routing layer                         |
| **Observability**  | Enables visibility into event flow and delivery      | Events can be traced and audited across systems    | Correlation IDs, event IDs, timestamps; log success/failure per subscriber       |
| **Error Handling** | Prevents silent failures                             | Delivery failures are visible and recoverable      | Use retries, Dead letter queues, and subscriber failure tracking                               |
| **Versioning**     | Supports safe schema evolution                       | Changes don’t break consumers                      | Use backward-compatible payloads, schema registries or versioned topics      |
| **Ownership**      | Clarifies who manages event design and evolution     | Event lifecycle is intentional and accountable     | Define the owning team; document contract and change coordination                |
| **Support & Onboarding** | Enables reuse and avoids one-off builds       | Events are discoverable and usable                 | Provide event definitions, sample payloads, and subscription instructions        |

---

## Next Steps

While these controls won’t address every scenario, they offer a starting point for building thoughtful, resilient integrations.

The framing introduced here helps guide how domains expose and consume capabilities across systems. The rest of this section builds on that foundation with guidance on designing HTTP-based APIs. The content will continue to evolve to include events and other ways of expressing capabilities beyond HTTP.


[daisy]:https://myobconfluence.atlassian.net/wiki/spaces/DAA/pages/10374250530

---

**Previous:** [← Ai Powered Features](../feature-development/ai-powered-features.md) | **Next:** [Api Design →](api-design/README.md)

---
title: Glossary
---
<!-- confluence-page-id: 9292284815 -->
# Glossary

Contents:

- [Glossary](#glossary)
  - [Definitions](#definitions)
    - [API Authentication](#api-authentication)
    - [API Authorisation](#api-authorisation)
    - [API Rate Limiting](#api-rate-limiting)
    - [API tokens](#api-tokens)
    - [Architecture Decision Record](#architecture-decision-record)
    - [Asymmetric Encryption](#asymmetric-encryption)
    - [Attack Surface](#attack-surface)
    - [Blue-Green Deployment](#blue-green-deployment)
    - [Canary Deployment](#canary-deployment)
    - [Consumer-aligned Data Product](#consumer-aligned-data-product)
    - [Continuous Integration](#continuous-integration)
    - [Continuous Delivery](#continuous-delivery)
    - [Continuous Deployment](#continuous-deployment)
    - [Cross Functional Requirement](#cross-functional-requirement)
    - [Cross-Site Scripting (XSS)](#cross-site-scripting-xss)
    - [Denial of Service](#denial-of-service)
    - [DMZ](#dmz)
    - [Enabling Data Product](#enabling-data-product)
    - [Encryption at Rest](#encryption-at-rest)
    - [Encryption in Transit](#encryption-in-transit)
    - [Infrastructure](#infrastructure)
    - [JSON Web Tokens](#json-web-tokens)
    - [Level of Guidance](#level-of-guidance)
    - [Load Testing](#load-testing)
    - [Mob Programming](#mob-programming)
    - [Mutual TLS (mTLS)](#mutual-tls-mtls)
    - [Penetration Testing](#penetration-testing)
    - [Performance Testing](#performance-testing)
    - [Reconnaissance Tests](#reconnaissance-tests)
    - [Regression Testing](#regression-testing)
    - [Rolling Deployment](#rolling-deployment)
    - [Remote Code Execution (RCE)](#remote-code-execution-rce)
    - [Principle of Least Privilege](#principle-of-least-privilege)
    - [Pair Programming (term)](#pair-programming-term)
    - [Run Book](#run-book)
    - [Schema](#schema)
    - [Secrets](#secrets)
    - [Security Low Bar Assessment](#security-low-bar-assessment)
    - [Security Sandwich](#security-sandwich)
    - [Source-aligned Data Product](#source-aligned-data-product)
    - [Source Control](#source-control)
    - [STRIDE Model](#stride-model)
    - [SQL Injection](#sql-injection)
    - [Symmetric Encryption](#symmetric-encryption)
    - [TSO](#tso)
    - [Threat Actor](#threat-actor)
    - [Threat Modelling](#threat-modelling)
    - [Vulnerability](#vulnerability)
    - [YBIYRI](#ybiyri)
  - [Further info or Feedback](#further-info-or-feedback)

## Definitions

### API Authentication

Ensures that only authorised users or systems can access and interact with the API.

### API Authorisation

By enforcing proper authorisation mechanisms, you can ensure that only authorised users or systems can access specific API endpoints or perform certain actions.

### API Rate Limiting

Rate limiting controls the number of requests a client can make to an API within a specified time window, protecting the API from abuse and ensuring fair usage.

### API tokens

An API Token is an arbitrary string that authenticates actions against an application programming interface.

It is a string that can be programmatically associated with a user or role, that gives access to resources over a network.

### Architecture Decision Record

Architecture Decision Records (ADRs) are a technique for capturing important decisions made during software architecture design and development. ADRs are a valuable tool for communicating and sharing architectural decisions with stakeholders, team members, and future developers.

### Asymmetric Encryption

Use public/private key pairs. RSA and ECC (Elliptic Curve Cryptography) are popular for establishing secure connections and exchanging keys.

### Attack Surface

The attack surface of a software environment is the sum of the different points (for "attack vectors") where an unauthorised user (the "attacker") can try to enter data or extract data from an environment

### Blue-Green Deployment

A pattern for low-risk zero-downtime deployment and rapid rollback. Blue-green deployment involves having a separate and duplicated parallel production environment. During deployment, we gradually switch inbound traffic from the old environment to the new one.

### Canary Deployment

A pattern for reducing the impact of any problems during deployment, allowing for rapid rollback. Canary deployment involves making the new version of a system or application available to a subset of users, validating that the features are working correctly, then completing the deployment for all users/consumers.

### Consumer-aligned Data Product

Many business departments need data from the whole value stream to make sensible decisions. E.g.: Management requires detailed reports and KPIs from all domains to identify strengths and deviations. Marketing would need to do funnel and web analysis over all steps in the customer journey. In these domains, the data model is optimised for a specific department's needs and thus the focus is on fulfilling data needs of one specific business domain, and can therefore be described as consumer-aligned. This data product is typically used for analytics and reports. Consumer-aligned data products are not usually created for sharing with multiple domains.

### Continuous Integration

A practice that aims to identify integration errors as early as possible by asking each team member to integrate and validate their work at least daily. This reduces the rework of changes and enables small incremental changes.
Check [here](deliver/continuous-integration.md) for more information.

### Continuous Delivery

A practice beyond Continuous Integration that keeps the software system always in a releasable state by pulling many practices (such as automation, [infrastructure as code](deliver/infrastructure-as-code.md)) together.
It allows fast release of features and rapid response to any failures.

### Continuous Deployment

A practice beyond Continuous Delivery, where every change goes through the pipeline and automatically goes into production once passing all automated tests and quality checks. This results in many production deployments every day for systems in active development.

### Cross Functional Requirement

Cross-functional requirements are requirements which cover all the functionality in our system. An example of a Cross-functional requirement could be "Users should not have to wait for more than 30 seconds for a page to load" or "We should be able to handle 500 requests per second without performance decreases"

### Cross-Site Scripting (XSS)

Malicious scripts can be injected into web pages viewed by other users, leading to data theft or session hijacking.

### Denial of Service

Malicious input can cause the server to crash or become unavailable by consuming resources excessively.

### DMZ

A Demilitarised Zone or DMZ is an area of an application that allows specific unknown traffic to make requests to it. Commonly, a publicly accessible application exists in a DMZ to enable requests from the public, while non-public applications exist in "Private" zones. The DMZ allows controlled and moderated entry and exit between the public and internal networks.

### Enabling Data Product

Enabling data products are data products that are derived from existing data products to provide foundation for various other data products. They are created mostly due the desire to reuse them for various use cases.

For example: A 360-degree customer view can be used by different teams in a company to build data products for a variety of purposes. The marketing team could use a customer 360 to build a data product that identifies customers who are most likely to be interested in a new product or services. The sales team could use a customer 360 could create a data product that lists customers who are using a competitor's product or who are nearing the end of their contract. The service and support team could use a customer 360 to build data products for more personalised and efficient support.

Another example is a [complicated subsystem](https://teamtopologies.com/key-concepts) team building a customer lifetime value model by using data products from different domains as well as the 360° customer view, and different teams use this model to build data products focused on campaigns or providing offers to the clients.

### Encryption at Rest

Data at rest means data that is housed physically on computer data storage in any digital form. Data at rest includes both structured and unstructured data.

At-Rest Encryption means that the data is encrypted on the physical disk when it is stored, meaning if a data breach were to happen and physical drives were stolen or duplicated, the data on those drives would be encrypted.

BitLocker is a common example of at-rest encryption.

### Encryption in Transit

Data in transit is data that is being moved from one physical location (a server/cluster etc) to another. Encryption in transit is the process of encrypting your traffic before sending it so that data is protected during transmission.

HTTPS is a common example of encryption in transit.

### Infrastructure

Infrastructure is a catch-all term to define the systems that we use to run an application. Infrastructure can refer to physical hardware such as a server in a data centre; a virtual machine in the cloud; a platform such as Kubernetes that we run our app on; or a platform-as-a-service that we deploy our app to.

Infrastructure is configured to enable specific connectivity, to enable an application to run, scale, and communicate to deliver value.

### JSON Web Tokens

Tokens are generated after the user authenticates and contain claims about the user. The token is signed to ensure its integrity.

### Level of Guidance

Codex has 3 levels of guidance for chapters and practices.

- Suggestion: This is a recommendation that we suggest you do, but you do not HAVE to do it if you think it wouldn't work for your team or specific use case.
- Default: This is a practice you must be doing unless you have a good reason or explanation to not be doing it. Defaults are well-researched, applied, and tested, so they are good sensible practices to be used by default.
- Standard: This is a practice you must be doing, always. Either due to internal policy or to meet legislative or industry standards.

### Load Testing

Load testing is the process of determining the behaviour of the system when large numbers of users access it at the same time. Application load should be extreme, to test the limits of the system.

### Mob Programming

Mob Programming is a software development approach where the whole team works on the same thing, at the same time, in the same space, and on the same computer. This is similar to pair programming where two people sit at the same computer and collaborate on the same code at the same time. With mob programming, the collaboration is extended to everyone on the team, while still using a single computer for writing the code and inputting it into the code base.

### Mutual TLS (mTLS)

Both client and server use certificates to authenticate each other.

### Penetration Testing

Penetration testing is usually conducted by an external team or entity. This type of testing should be conducted at approximately once a year or whenever significant changes are made to the API. For example; new endpoints or security framework changes.

### Performance Testing

Performance testing is a non-functional software testing technique that determines how the stability, speed, scalability, and responsiveness of an application holds up under a given workload. Application load should be normal, to understand typical application behaviour.

### Reconnaissance Tests

Reconnaissance Tests involve manually exploring the API using proxy tools by capturing and analysing client-server communication.
They are conducted from the point of view of both an unauthenticated user and a legitimate application user. User roles and data validation aspects are explored during reconnaissance.

### Regression Testing

Regression testing is a software testing practice that ensures an application still functions as expected after any code changes, updates, or improvements. Usually, it involves re-running all tests after a change to detect that functionality has been maintained.

### Rolling Deployment

A pattern for zero-downtime deployment where new application instances are rolled out into production incrementally. This requires the ability of the system to work with new and old versions concurrently serving traffic.

### Remote Code Execution (RCE)

Attackers can execute arbitrary code on the server by exploiting unvalidated input.

### Principle of Least Privilege

Give only the minimum amount of access to a user to do a task.
User A needs to read 1 folder in a shared drive. User A should only have access to the 1 folder, not the entire shared drive.

### Pair Programming (term)

Pair programming is an agile software development technique in which two programmers work together at one workstation. One, the driver, writes code while the other, the observer or navigator, reviews each line of code as it is typed in. The two programmers switch roles frequently.

### Run Book

A run book, also known as an operations manual or standard operating procedure (SOP), is a documented set of procedures and instructions designed to guide individuals or teams in carrying out routine tasks, managing systems, or responding to incidents in a consistent and efficient manner.

### Schema

A schema is best defined as a pattern or model. In a database context, a schema is a templated model of how data should be saved, i.e what columns exist, what data type a column is, how that data connects to other pieces of data, etc.

### Secrets

A secret is any value you don't want to be exposed to the public or people in your organisation.

Usernames, Passwords, Drivers Licences, ID documents, addresses.

### Security Low Bar Assessment

Is an assessment done against a set of high-level security capability requirements that apply to all software development and onboarding initiatives. This assessment is done by the team involved and reviewed by the Security team for integration into the company's Architectural Framework.

### Security Sandwich

Traditional approaches to security have relied on up-front specification followed by validation at the end. This makes security an approach only done before and after work may have already been done. It also fails to utilise opportunities to automate security tasks.

Teams should evaluate how they can inject security throughout the AGILE development cycle

### Source-aligned Data Product

When the domains (aligned along the customer journey) publish their data as data products, so that consumers can access them to build another data product for a use case, then this domain data can be referred to as source-aligned. Most of the data in the source aligned data products correspond closely to the domain events and entities generated in their operational systems.

### Source Control

Source control (or version control) is the practice of tracking and managing changes to code. Source control management (SCM) systems provide a running history of code development and help to resolve conflicts when merging contributions from multiple sources.

Examples of this would be GIT or SVN, with product offerings such as GitHub or BitBucket.

### STRIDE Model

A framework for performing threat modelling.
[Wikipedia](https://en.wikipedia.org/wiki/STRIDE_(security))

### SQL Injection

Attackers can inject malicious SQL code through input fields, manipulating the database.

### Symmetric Encryption

Use a shared secret key between the client and server. AES (Advanced Encryption Standard) is the most commonly used algorithm.

### TSO

Technical System Owner, the role with responsibility for maintaining a healthy and reliable system and the features they provide to our customers.

### Threat Actor

A Threat Actor or Threat Agent is a party that is responsible for or attempts to bring about, harm to an organisation. Threat actors may be internal, external, or partners to their target, and their motives may vary.

### Threat Modelling

Threat Modelling involves assessing an applications components for possible threats. This is conducted in conjunction with the security team, who advise and guide a team through the Modelling process. The outcomes from a Threat Modelling workshop are the initial security vulnerabilities for a component of an API. These need to be prioritised and assessed for risk. Remediation is then conducted according to the final assessment.

### Vulnerability

Vulnerabilities are flaws in a computer system that weaken the overall security of the device/system. Vulnerabilities can be weaknesses in either the hardware itself or the software that runs on the hardware. Vulnerabilities can be exploited by a threat actor to damage a system or product.

### YBIYRI

You Build It, You Run It (YBIYRI) is a philosophy that emphasises the responsibility and ownership of a development team for the entire lifecycle of the software they create, including its deployment and operation.

## Further info or Feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

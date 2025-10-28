---
title: Production Readiness
---

![MYOB Banner](../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9294021763 -->
![](../assets/BANNER.png)

# Production Readiness

---

A list of items that should be reviewed by teams as part of an assessment of readiness for production.
This list is for any change, large or small and is accumulated from guidance and advice in our:

- *[Engineering Standards](../engineering-standards/README.md)*
- *[Sensible defaults](https://github.com/MYOB-Technology/platform-sensible-defaults)*
- *[MYOB Security Policies and Standards](https://myobconfluence.atlassian.net/wiki/spaces/security/pages/854230670/MYOB+Security+Policies+Standards)*

The items are logically grouped but captured in no particular order.

## Architecture & Documentation

- Does the system have just enough documentation, (not the Solution Option or Solution Proposal) such as:
  - Architecture diagrams e.g. [C4 models for visualising software architecture](https://c4model.com/)
  - System hosting architecture diagram
  - Design diagrams and/or design narratives that make the design clear in a way that is useful for future custodians
  - API documentation e.g. [OpenAPI](https://swagger.io/specification/)
  - Rehearsed disaster recovery plan and run book
  - [System Catalogue](https://system-catalogue.myob.com/) entry where the information is current
- Run-books have been created or updated that assist with operations activities, modifying and supporting the system

## Security & Compliance

- [Security Threat Modelling](../security/threat-modelling.md) has been undertaken in collaboration with or feedback from the Application Security team
- Do you have mitigation, if required, for [Denial of Service attacks (DoS)?](https://en.wikipedia.org/wiki/Denial-of-service_attack)
- Does the system impose usage limits to prevent unbounded consumption of resources?
- The solution has no vulnerabilities reported through static application security testing (SAST) (SonarLint, SonarQube)
- Data is appropriately encrypted at rest and in transit using secure TLS (1.2+) and ciphers
- Security & penetration testing, if required, has been performed and remediation of vulnerabilities completed in collaboration with the Application Security team
- Our identity capability (MYOBID) has been used appropriately
- Our access management capability (AMS) if being used, has been used appropriately
- Any secrets are managed via secure storage and can be rotated in a timely fashion ideally following a run book
- Any certificates are stored securely; alerts are in place and give sufficient notice to the team when they are due to expire. The certificates can be updated in a timely fashion
- Third-party dependencies are known, documented and have no vulnerabilities (Dependabot).
- Required licensing is paid for or if open-source software (OSS) the license has been checked and is suitable for commercial use
- Relevant compliance, standards and government legislation is met e.g.
  - ATO DSP Framework (AU Payroll)
  - AU/NZ Privacy acts. Data retention and Personal Information (PI)
  - ISO27001
  - Payment card industry data security standard (PCI DSS)

## Business Continuity

- All code is kept under source control in the MYOB GitHub organisation account
- Systems are covered by a Disaster recovery plan with consideration to Recovery time objective (RTO) and Recovery point objective (RPO)
- There are no single points of failure (SPOF) or any single points of failure can be recreated within the required Recovery time objective (RTO)
- Appropriate services have been selected and redundancy put in place where required to ensure non-functional requirements are met (RTO driven)
- Data backup and restoration processes have been put in place with appropriate automation to ensure non-functional requirements are met (RPO driven)
- After-hours support has been arranged, if necessary (RTO driven)
- System catalogue information is up to date and easily enables incident management to identify the system custodians and any on-call capability
- The team is aware of the incident management process

## Functional & Non-Functional Requirements

- Non-functional requirements have been defined and agreed upon with the Product Managers that cover:
  - Performance
  - Availability
  - Data retention & backups
  - Service restoration
  - Service level objectives
  - Scalability ideally horizontally (out)
- Appropriate user audit controls have been established, as required by relevant legislation and compliance

## Analytics & Reporting

- Consideration has been given to reporting, data, and business intelligence requirements
- Appropriate product telemetry / metrics is accessible to Product mangers

## Infrastructure

- Infrastructure as code has been practised, infrastructure is provisioned through automation, and environments are easily re-creatable
- Infrastructure cost allocation with appropriate resource tagging is in place leveraging cloud budget and cost alerts tools
- A reoccurring cloud hosting cost review meeting has been established
- Access to production infrastructure is limited to the minimum necessary set of staff, with the ability to modify infrastructure severely restricted and preferentially disabled (only performed via CI)
- Access to query data sources is limited to the minimum necessary set of staff and has any necessary controls in place to handle PI, PCI DSS or otherwise sensitive data - Compliance (Way to manage access with automated onboarding / offboarding) following the principle of least privilege (POLP)
- Infrastructure and change audit controls have been established, especially relevant for systems requiring ISO-27001 or PCI DSS controls

## Continuous Integration & Continuous Delivery

- Continuous Integration (CI) is practised and Continuous delivery (CD) is actioned via automation
- Work is continuously and automatically integrated, validated, and deployed to all integrated environments via a continuous delivery pipeline
- A decision has been made to support release roll-back, roll-forward or both (Rollback has been defined and tested)
- Integration testing in collaboration with dependant services against pre-prod has occurred
- Updates can be rolled out with no or minimal outage. Releases are safe with a well-known, rehearsed, roll-back run book
- Deployment should be exercised regularly no less than once per week

## Observability

- Appropriate logging has been put in place that omits or masks PI, PCI DSS, access credentials and any other sensitive data appropriately and conforms to the logging standard
- Appropriate health check endpoints have been implemented and appropriate alerts configured
- Logs are directed to Sumo Logic via Log central
- Appropriate values have been established, covering performance SLOs, capacity and cost
- Appropriate metrics are monitored and are easily accessible, including costs
- An SLO dashboard has been configured to actively monitor performance
- Observability as code has been considered and practised where appropriate

## Peer Reviews

- All changes have been sufficiently reviewed through at least one of the following pair programming, mob programming, pull requests or code reviews
- All review feedback has been appropriately actioned

## Release Coordination

- Custodians of dependant services have been consulted and informed about the use of their service
- Our Sales teams have been notified of significant changes impacting sales, and the release has been coordinated appropriately
- Our Marketing teams have been notified of the changes and given an opportunity to update marketing materials appropriately and distribute release communications
- Our Legal team has been consulted on any issues or concerns with the work related to our legal Notices including product terms of use, terms and conditions, license agreements and privacy policies
- Release communications to internal stakeholders have been distributed appropriately

## The Final Important Step

- Celebrate!

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

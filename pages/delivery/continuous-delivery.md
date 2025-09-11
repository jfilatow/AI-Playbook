---
title: Continuous Delivery
---

![MYOB Banner](../../assets/images/myob-banner.png)


# Continuous Delivery

#### Level of guidance: Standard

## Overview
**Continuous Delivery (CD)** ensures that software is always in a deployable state. It is a critical practice at MYOB that enables teams to deliver high-quality, reliable software efficiently. With Continuous Delivery, every change to the codebase (features, bug fixes, etc.) is automatically built, tested, and prepared for release to production. However, the actual release to production remains a **manual decision**. To be clear, not a manual long step by step process, but a simple button push (or similar) that triggers a fully automated production deployment.

This practice strikes a balance between automation and control, providing teams with flexibility to deploy on their own terms while ensuring robust quality guarantees.

---

## Key Characteristics of Continuous Delivery at MYOB

1. **Reliable and Repeatable Builds**
- Deployment processes are automated in a way that is repeatable, ensuring that every release, regardless of size, undergoes the same rigorous build process.

1. **Frequent Code Integration**
- Teams integrate code changes into the mainline frequently to minimise integration conflicts and ensure the application is always in a releasable state.

1. **Automated Testing**
- Continuous Delivery relies on a comprehensive suite of automated tests—including unit, integration, functional, and performance tests—to catch issues early and maintain confidence in the codebase.

1. **Release on Demand**
- Teams manually control when software is deployed to production, enabling flexibility to coordinate deployments with business or operational requirements.

---

## Principles for Performing Continuous Delivery

1. **Automate Everything**
- Ensure every step of the delivery pipeline, from code integration to staging deployments, is fully automated.

1. **Build Confidence with Testing**
- Rely on extensive automated testing to validate code quality. Testing suites should cover edge cases, regressions, and performance benchmarks.

1. **Release Small, Incremental Changes**
- Opt for small, frequent releases instead of infrequent, large releases. Smaller changes are easier to test, debug, and deploy.

4. **Agile-Ready Releases**
- Align your release cadence with agile iterations and sprint deliveries. Continuous Delivery enables seamless releases at the end of every sprint.

5. **Push Left Strategy**
- Catch defects early by integrating testing and feedback mechanisms early in the development lifecycle.

---

## Benefits of Continuous Delivery

1. **Improved Quality**
- Automating testing and deployment steps reduces errors introduced by manual processes, ensuring higher-quality releases.

1. **Faster Feedback Loops**
- Teams receive feedback quickly, enabling fast iterations and issue resolution.

3. **Customer-Centric Focus**
- Continuous Delivery enables frequent, reliable releases that deliver incremental value to customers.

4. **Risk Mitigation**
- Smaller, incremental deployments significantly reduce the risk of large-scale, error-prone releases.

---

## How to Get Started

1. **Automate Your CI Pipeline**
- Build on existing continuous integration (CI) practices to automate your code integration and testing processes.

2. **Establish Quality Gates**
- Create mandatory checks in your pipeline, such as testing coverage thresholds and code quality audits.

3. **Implement Deployment Pipelines**
- Ensure that every build progresses seamlessly through staging environments and is prepared for production deployment.


---

## Tools and Resources
Refer to the [Technology Defaults](https://myobconfluence.atlassian.net/wiki/x/QwHLDwI) and [MYOB Tech Radar](https://tech-radar.myob.com/) for tools we use at MYOB.

Refer to [minimumcd.org](https://minimumcd.org/minimumcd/) for more helpful advice on how to achieve Continuous Delivery outcomes.

By adopting Continuous Delivery, MYOB teams build the foundation for faster, higher-quality releases while retaining control over release timing. This practice is essential for delivering on our commitment to exceptional delivery outcomes.

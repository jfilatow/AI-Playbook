---
title: Continuous Deployment
---

![MYOB Banner](../../assets/images/myob-banner.png)
---



# Continuous Deployment

---

#### Level of guidance: Suggestion

## Overview
**Continuous Deployment (CD)** takes automation to the next level beyond [Continuous Delivery](./continuous-delivery.md). In this practice, every successful build that passes automated quality gates is automatically deployed to production without any human intervention. Continuous Deployment ensures faster delivery of value to end-users while maintaining high-quality standards.

> **Disclaimer**: Teams should only consider adopting Continuous Deployment once they have established a reliable and effective Continuous Delivery process. Without a solid Continuous Delivery foundation, teams risk exposing users to unstable or incomplete software.

---

## Key Characteristics of Continuous Deployment at MYOB

1. **End-to-End Automation**
- Every step, from code commit to production deployment, is fully automated. This requires extensive and robust automation practices, including testing, builds, and deployments.

1. **Rapid Deployment**
- Teams can deploy new changes to production quickly and frequently without manual bottlenecks.

1. **Robust Observability**
- Continuous Deployment relies heavily on monitoring, logging, and alerting systems to instantly identify and address any issues that arise post-deployment.

1. **Smaller, Incremental Changes**
- Changes are deployed in smaller, incremental chunks. This approach reduces risks associated with large deployments and makes identifying and fixing errors easier.

5. **High Confidence in Testing**
- Automated testing must comprehensively cover unit, integration, regression, and performance scenarios to ensure software stability in production.

---

## Principles for Performing Continuous Deployment

1. **Build Confidence Through Testing**
- Testing suites must provide high levels of assurance that deployments are error-free. This includes automated tests across various domains (e.g., functional, performance, security).

1. **Focus on Observability and Monitoring**
- Set up robust monitoring systems to track the application's health, deployments, and user interactions. Use tools like Datadog, Azure Monitor, or Splunk to detect anomalies.

1. **Always Be Deploying**
- Embrace the philosophy of frequent, incremental deployments. By deploying often, teams reduce the complexity of each change and create a more stable production environment.

1. **Establish Rollback Mechanisms**
- An automated rollback strategy is essential to quickly revert changes if an issue is detected. Tools and processes should be in place to make rollbacks seamless with minimal impact.

5. **Maintain a Feedback Loop**
- Continuously incorporate feedback from automated monitoring systems and end-users to improve processes and product quality.

---

## Benefits of Continuous Deployment

1. **Immediate Value Delivery**
- Customers receive new features, bug fixes, and updates without delay, aligning with business goals for rapid value generation.

1. **Reduced Time to Market**
- Removing manual deployment steps speeds up the delivery pipeline, allowing teams to respond quickly to market demands.

1. **Enhanced Team Productivity**
- By automating repetitive deployment tasks, teams can focus more on innovation and less on manual release management.

1. **Smaller, Safer Changes**
- Frequent deployments reduce the risk of large releases and make identifying and resolving issues easier.

1. **Innovation Enablement**
- Continuous Deployment fosters a culture of experimentation, where teams can test and iterate on ideas with minimal friction.

---

## How to Get Started

1. **Master Continuous Delivery First**
- Ensure that your delivery pipeline is highly reliable and automated before transitioning to Continuous Deployment.

1. **Audit Your Automation Tools**
- Evaluate whether your tools and infrastructure support full end-to-end automation, including production deployments.

1. **Set Rigorous Quality Gates**
- Implement robust automated testing to prevent unstable code from reaching production. Consider incorporating canary deployments to test changes on a smaller audience before full rollout.

1. **Focus on Monitoring and Alerting**
- Establish real-time monitoring and alerting systems to detect anomalies and performance issues immediately after deployment.

1. **Collaborate with Teams**
- Foster cross-functional collaboration to align development, operations, and quality assurance teams on the goals and practices of Continuous Deployment.

---

## Tools and Resources
- **CI/CD Platforms**
- **Infrastructure as Code**
- **Monitoring and Logging**
- **Feature Flags**

Refer to the [Technology Defaults](https://myobconfluence.atlassian.net/wiki/x/QwHLDwI) and [MYOB Tech Radar](https://tech-radar.myob.com/) for tools we use at MYOB.
---

## Final Thoughts

Continuous Deployment is a transformational practice that enhances delivery speed and team agility. However, it requires a mature pipeline and a disciplined approach to automation, testing, and observability.

By adopting Continuous Deployment thoughtfully and building on a strong foundation of Continuous Delivery, MYOB teams can accelerate the delivery of robust and innovative solutions while maintaining world-class quality standards. Consider Continuous Deployment only when your team has confidence in every aspect of the delivery and deployment process.

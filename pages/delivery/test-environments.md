---
title: Test Environments
---

![MYOB Banner](../../assets/images/myob-banner.png)

<!-- confluence-page-id: 9649455794 -->
# Test Environments

#### Level of guidance: Standard

## What is it?

A test environment is any space in which software undergoes a series of experimental uses. Teams can leverage this environment to verify whether the application meets the stipulated standards for functional and non functional requirements.

It aims to simulate the real-world conditions in which the software or system will operate, allowing software developments teams to identify and address any issues or bugs before they impact users.

## Why do we have it?

Test environments are crucial in ensuring the reliability, functionality, and safety of various systems, products, or processes. They help organisations minimise risks, improve quality and enhance the user experience in production environments by providing a safe space for experimentation and validation without risking disruption to live operations.

## How do we do it?

In the development cycle, there are different types of testing environments that serve specific purposes. Some teams use some or all of these types for testing.

|Environment|Purpose|
|-----------|-------|
|Local|This is a test environment set up on a developer's local machine, enabling them to test the code on their own computers to catch issues early.|
|Development|A shared test environment for a team or multiple teams where new features are deployed and tested.|
|System Integration Testing|Ensures different system components work together smoothly and interact as expected. It is also used for end to end and exploratory testing.|
|Performance Testing|Tests the system's speed, responsiveness, reliability and stability under various conditions, helping to identify bottlenecks, response, memory leaks and scalability issues. Most of the teams usually reuse System Integration / Development environment when executing performance testing|
|Production|This is the live environment where the software is accessed and used by end-users.|

It's also important to note that across MYOB, we do not have standardised environment names (yet). For any environments you have, it's important that their purposes are defined clearly, especially if those environments may be dependent on other systems for testing.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

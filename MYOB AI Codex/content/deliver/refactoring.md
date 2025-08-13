---
title: Refactoring
---
<!-- confluence-page-id: 9293923479 -->
![](../assets/BANNER.png)

# Refactoring

#### Level of guidance: Default

## Decisions to make

- How can I increase the quality of my code over time?
- How can I make code easier to read for my colleagues?

## What is it?

Refactoring is the engineering practice of making small, incremental improvements to our code without affecting the desired behaviour.
Examples of small refactoring can include:

- Improving the naming of functions and variables
- Improving the modular design of the software by splitting, combining, or moving code
- Simplifying complicated functions to make them more readable.

## Why do we do it?

When a system or product is successful, there will be a need to keep enhancing it, fix problems, and add new features.

[Research](https://www.researchgate.net/publication/318811113_Measuring_Program_Comprehension_A_Large-Scale_Field_Study_with_Professionals) indicates that developers spend most of their time reading and comprehending code, so the nature of a code-base makes a big difference on how easy it is to make these changes.

Since enhancements are often applied on top of each other, it becomes increasingly harder to make changes as time goes on.

To combat this, it's important to refactor code so that added enhancements don't lead to unnecessary complexity, and to ensure that our code is easy to read and maintain.

## How do we do it?

We use automated tests to ensure we are refactoring code without affecting behaviour. Without automated tests, we would not have confidence that our changes would not impact existing behaviour.

Most refactoring should occur during the Refactor stage of the [Red-Green-Refactor](https://martinfowler.com/bliki/TestDrivenDevelopment.html) test-driven development cycle. We must be diligent to maintain our ability to work effectively with our code.

We should also look to refactor when we become aware that our code could be improved. This could be due to many factors, such as doing a code review or having changes in our business environment.

## Further Resources

- For detailed techniques and further resources on refactoring we recommend [refactoring.com](https://refactoring.com).
- [Kent Beck's Design Rules](https://martinfowler.com/bliki/BeckDesignRules.html) provide more guidance on how much to refactor.
- Evan's guidance on how to [always be tidying](https://myobconfluence.atlassian.net/wiki/spaces/~944510255/blog/2022/03/09/8715109302/Always+be+tidying).

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

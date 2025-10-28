---
title: Code Review
---

![MYOB Banner](../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9293955873 -->
![](../assets/BANNER.png)

# Code Review

---

#### Level of guidance: Standard

## Decisions to make

- Is code review mandatory?
- Should I do a code review if we use pair programming?
- Is a pull request equal to a code review?
- How could I get effective feedback from code review?

## What is it?

Code review is an engineering practice where a structural assessment of code is performed to **build quality in**, with the aim to improve consistency and maintainability of the code over time. Code review has many approaches both formal and informal.

## Why do we have it?

Code review aims to improve overall quality, maintainability, and simplicity. All these factors help reduce the time needed to understand the source code and decrease the inclusion of errors.

The key outcome we aim to achieve is to improve code and test quality as early as possible, while we build software systems. There are many benefits of code reviews:

- **Time saving**: Code reviews do take time to perform, yet when done effectively, save time in the long run.
- **Improved quality**: following code guidelines, having developers with different experiences view the same code, and increasing feedback given to developers.
- **Better team knowledge sharing**: this includes mitigating the risk of a single point of contact on a piece of code, onboarding new members, and collective knowledge of the current system.

## How do we do it?

The key factors of Code review involve:

- **Reviewers**: find suitable reviewers who are capable of responding to your request within a reasonable time.
- **Frequency**: review small changes as early as possible.
- **Review Guidelines**: as a team, define and agree on a set of key guidelines to help get the most out of your code reviews, and to maintain a desired level of quality.
- **Actions based on review outcome**: call out the review outcome and indicate what kind of actions are required: good without change, mandatory change, and optional change.

There are three approaches currently adopted in the organisation before integration to mainline:

- **Pair Programming**: by pairing with another person, the code is reviewed in real-time. This can remove the need to review a pull request later. When using the right pair programming practices, and following established code guidelines, the code is considered reviewed when the pair finishes. This can also be combined with regular or ongoing team tech huddles.

- **Pull Requests**: Pull Requests are often adopted by teams following a feature-branching strategy. Pull Requests in many Source Control applications encourage or optionally enforce code reviews before merging any changes. This helps the practice to happen asynchronously and non-locally. The Article [Ship/Show/Ask approach (Martin Fowler, 2021)](https://martinfowler.com/articles/ship-show-ask.html#ShouldMyTeamAdoptThisApproach) shares patterns on when and how to get feedback while using a pull request.

- **Mob Programming**: Mob Programming is when many developers work together on code at the same time. It is especially useful when there is a need for a team to make high-level design or technical decisions. It can be thought of as large-scale pair programming.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

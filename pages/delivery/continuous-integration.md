---
title: Continuous Integration
---
<!-- confluence-page-id: 9293955892 -->
![](../assets/BANNER.png)

# Continuous Integration

#### Level of guidance: Standard

## Decisions to make

- How often should I push my changes into the main branch?
- How do I get feedback quickly on my changes, so that I can move on with confidence?
- What kind of automated checks should we run against each merged change to give me feedback?
- How do I test my code against an existing codebase with multiple team members?

## What is it?

Continuous integration is an engineering practice where developers regularly integrate small and frequent code changes into the main branch of a repository, at least once per day. The integration is then automatically built and tested, to give developers feedback as soon as possible.

## Why do we have it?

Without a continuous approach, there will be longer periods of time between integrations, making it increasingly more difficult to find and fix problems. These integration problems will increase deployment risks dramatically which leads to longer deployment and release times. Below are some benefits Continuous Integration brings:

- Increase the visibility of code changes and facilitate greater collaboration between developers.
- Significantly less time spent on debugging and back-tracking to discover what went wrong
- Significantly reduce the likelihood of code not being deployment ready.
- Increase the amount of time developers spend on building features.

By automating builds and tests, developers can make smaller changes and commit them with confidence allowing the team to move fast while keeping high-quality standards and maintaining a deployable state.

## How do we do it?

To build a continuous integration pipeline a few different tool sets are required. Source control is needed to store code and track changes. A pipeline will need to be defined which includes automated steps to execute tests, perform code quality checks, and build the application. When the pipeline fails for a given commit, immediate feedback should be given to the developers who contributed to the change. Examples of failures that would break a build include compilation errors, quality gate failures, and automated test failures - but many more things can go wrong.

A sample CI workflow would look like the following:

- The developer commits the code to the source control.
- The code is linted and checked for compliance with style and quality guidelines.
- The code is scanned for security vulnerabilities.
- The code automatically builds to check for any compilation or integration issues.
- The automated tests are executed to test the code.
- If there are build or test failures, the team is alerted to address the issue. This is a 'stop the line' event and no further commits should be pushed until this is addressed.
- If the build and tests are successful, the developer is free to do further commits.
- Repeat this cycle throughout the development phase.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

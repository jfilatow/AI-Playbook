---
title: Data and Schema Management
---

![MYOB Banner](../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9293955904 -->
![](../assets/BANNER.png)

# Data and Schema Management

---

#### Level of guidance: Default

## Decisions to make

- How do I manage changes to databases used as part of your build, deploy, test and deployment?
- How to manage test data?

## What is it?

**Data** is any piece of information that needs to persist for an amount of time.

**Schema** is the format of data e.g. column names or table names in a database or excel file.

Data and Schema management is the engineering practice of managing data and schema as part of the development, testing, and deployment process. It also involves how to preserve and migrate long-lasting application data during a new deployment, or during the rollback of an application.


## Why do we have it?

We require the capability to reproduce an environment along with the application and database, in an automated way. This includes creating the database instances, schemas, structure, and data loads suitable for development and testing.

The application Data and Schema, however, will evolve throughout development. So by automating the management of Data and Schemas we can reduce the rate of errors that may arise from adding new features or integrating new code.

It also means that the approach is tested in multiple environments before reaching production, is repeatable without manual intervention, and has an audit history that can track changes made to the Data and Schema over time.

## How do we do it?

These are the key practices we follow:
- **Automate changes to databases**: any database changes should be automated as a part of the build, test, deploy, and release process. This includes database initialisation, table creation, production database migration, etc., and can be accomplished through schema tools or scripts
- **Database scripts should be versioned**: this enables an application to use the right version of a database schema for the right deployment.
- **Incremental changes**: We should keep the application working after every database change. This means making database changes ahead of a product release that requires them, incrementally over time, to maintain database functionality. This adds the capability of releasing the new application, and also the capability to roll back to a previous earlier version of the application if needed.
- **Version your database**: the key to migrating data automatically is to version your database. This can be done with a table to track the version number. At deployment time, you can validate the version number of the application and the database to make sure the right version is in use.
- **Least privilege access to production data**: no one should have direct access to the production database except by escalation.
- **Avoid production data in tests**: production data violates our policy for accessing sensitive and private customer information.
- **Test data management**: Some teams write tests that depend on specific data in persistent test datasets, which creates a problem with test isolation and maintainability. Test data includes both test-specific data and test reference data, both of which need to be automated and version controlled.

## Further info or feedback
Please email us at codex@myob.com or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

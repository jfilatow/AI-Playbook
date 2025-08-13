---
title: Trunk Based Development
---
<!-- confluence-page-id: 9293923503 -->
![](../assets/BANNER.png)

# Trunk-Based Development

#### Level of guidance: Default

## Decisions to make

Should I branch or not when we have one or multiple teams working on the same codebase?

## What is it?

Trunk Based Development is an engineering practice where developers commit directly to the trunk at least once every 24 hours. Each committer is streaming small commits straight into the trunk with a pre-integration step of a successful build. It differs from traditional source control management by greatly reducing or removing the use of branches.

## Why do we have it?

Trunk-based development aims to keep the trunk in a **production deployable** state with minimal effort via small frequent integrations. It also aims to **simplify** and **minimise** the merging pains of your code repositories by reducing the administrative work of managing branches and identifying conflicts or issues at a much earlier stage of development.

Trunk-based development is designed to create a more reliable and consistent way of working for developers. At the expense of trading in short-term convenience, it adds long-term time savings and higher quality output. It's a paradigm shift to encourage systemic thinking, and increase the amount of timely feedback to developers.

## How do we do it?

The team will only fully realise the benefits of Trunk Based Development when there is a safety net built in to minimise the risk. To safely enable Trunk Based Development, it’s essential the following practices are also in place:

- *Pair Programming*
: by pairing with another person, the code is reviewed in real-time, effectively eliminating the need for a pull request later.

- *Test Driven Development*
: writing tests first, before writing the functional code, will help build self-testing code and increase quality with minimum cost.

- *Fast automated builds*
: the team needs to be confident about the quality of a code change. This is achieved via fast automated builds to ensure a build won’t be broken. This requires solid testing practices to minimise the number of slow tests. If the build is broken, fixing it immediately is the top priority of the team.

- *Feature Toggles*
: in this context, *feature toggles* are used to manage unfinished feature code in the trunk, so that the code can be merged earlier. The tests need to cover both modes with feature toggles on and off.

- *Work in small batches*
: break things down into smaller batches, reducing the time taken to get feedback on our work.

When teams are not able to practice Trunk Based Development due to constraints, one alternative is to use Short-lived Feature Branches. The key rules are:

- The branch should be created, merged, and deleted in no more than 2 days. Ideally less than 1 day. Any longer, there is a risk of it becoming a long-lived feature branch.
- The number of developers that work on a short-lived feature branch should stay at one (or two if pair programming). It should not be shared for general development activity.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

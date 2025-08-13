---
title: Defect Triage
---
<!-- confluence-page-id: 9658335301 -->
# Defect Triage

#### Level of guidance: Default

## What is it?

Defect triage is the process of prioritising and categorising reported software defects based on their severity, impact, and frequency of defect occurrence. This involves stakeholders, including developers, QAs, BAs, and project managers, to decide which defects should be addressed first to provide a quality product to our customers.

## Why do we have it?

To ensure that development teams focus on fixing the most critical and impactful defects first, optimising the use of resources and maintaining project timelines. It helps prioritise defects effectively, enhances the overall quality, saves cost, improve customer satisfaction and stability of the software product.

## How do we do it?

1. Identify

    > A defect is a deviation of the software application from the end user’s requirements or original business requirements

    A defect can be identified by a customer or any one from the internal teams.

2. Document and Report

    Each team has its own method for documenting and reporting defects.

    At MYOB, the most common practice is to document defects using a Jira card. It's recommended to have a defect template ready.

    **What should be captured in a defect card:**

    |Area               | Description                               |
    |----------------   |-------------------------------------------|
    |Summary            | A high-level summary of the issue         |
    |Steps to reproduce | Detailed steps to replicate the defect    |
    |Evidence           | Screenshots/ Video/ Logs                  |
    |Environment        | Development/ Test/ Production             |
    |Build number       | The specific build in which the defect was found |
    |Reported by        | Name of the person reporting the defect   |
    |Expected outcome   | What should happen instead                |
    |Priority           | optional - define if known                |
    |Severity           | optional - define if known                |

    Once the Jira card is created, some custodian teams receive automatic notifications through their communication channels (Slack/Teams), while in other cases, teams must be contacted directly.

3. Initial assessment

    Initial assessment can be conducted by a BA, QA or the initial support person. Idea of this assessment is try to replicate the defect, add missing data, define severity and priority if known.

4. Define severity, priority
    * Severity : The amount of damage or harm a defect could create
        Example guideline about how MYOB teams define severity
        * Critical - Defect affects critical functionality or critical data
        * High - Defect affects major functionality or major data and customer doesn't have a workaround/ impact business reputation
        * Medium - The defect affects minor functionality or non-critical data
        * Low - The defect does not affect functionality or data directly. It has an easy workaround.
    * Priority is the precedence to fix the defect
        Most of the teams at MYOB are adopting [MoSCoW](https://en.wikipedia.org/wiki/MoSCoW_method) method to define the priority
        * Must - Must fix before the production release.
        * Should - Can fix in future releases
        * Could - May or may not fix
        * Won't - Will not fix

5. Assign defect status
    * Examples
        * Open - The defect is accepted
        * Duplicate - Similar defect already exists in the backlog
        * Not a bug - The defect is not accepted. (example - it can be a feature that has not been implemented)
        * Deferred - Will be fix in a future sprint/ release
        * Rejected - The defect is not accepted (example - rare edge case that’s hard to reproduce)
        * Cannot reproduce - The defect cannot reproduce in a later version
        * Fixed - The defect has been fixed
    Who defines the defect status? QA, BA or the person who is doing the first level assessment can define the defect status during or before the defect triage. Escalate if required.

6. Triage

    General practice for defect triage involves conducting a defect triage meeting, though the specific approach can be defined by the teams and stakeholders involved. Ensure the whole team has a common understanding of the process.

    * How to conduct a defect triage
        Few ideas
        * BA/ QA triage
        * Defect triage during standup
        * Defect triage meeting
    * Participants - Identify who should attend.
    * Pre-requisites - Gather necessary information before the meeting. (Full fleshed defect cards, Know how to reproduce the defects, etc..)
    * Frequency of the triage meeting - Determine how often triage meetings should occur.
    * Outcome - Agree on the priority of the defects and define when to fix

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

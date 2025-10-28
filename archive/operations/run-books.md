---
title: Run Books
---

![MYOB Banner](../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9487581185 -->

# Run Books

---

#### Level of guidance: Default

## What is it?

A run book, also known as an operations manual or standard operating procedure (SOP), is a documented set of procedures and instructions designed to guide individuals or teams in carrying out routine tasks, managing systems, or responding to incidents in a consistent and efficient manner. Creating and maintaining runbooks is a crucial part of ensuring operational stability and efficient debugging.

## Why do we have this?

1. **Consistency**: Run books ensure that tasks are performed consistently and accurately. By documenting step-by-step procedures, organisations can reduce the likelihood of human error and maintain a consistent standard in their operations.

2. **Knowledge Transfer** / Training**: Run books serve as a knowledge transfer tool. They document the expertise and experience of individuals, making it easier for new team members to understand and carry out tasks effectively.

3. **Emergency Response**: In critical situations or emergencies, having well-documented run books are invaluable resources for quickly and efficiently resolving issues, minimising downtime, and restoring normal operations.

4. **Risk Management**: By documenting procedures and best practices, run books contribute to risk management efforts. They can help identify potential risks and mitigate them by establishing standardised processes.

5. **Continuous Improvement**: Run books are not static documents. They can be updated and improved over time based on feedback, changes in technology, or lessons learned from incidents. They are also excellent opportunities for automation and reducing toil in a team.

## How do we do it?

For your system, use the following guidance:

1. **Identify Common Tasks**: Lay out all operations of your team to identify repetitive tasks and issues that your team encounters. These could include generic tasks around access management, logging, managing dependencies etc. or something specific to your system.

2. **Categorise and Organise**: If you have many runbooks, it can be helpful to categorise them by task type, system, or some other criteria. This makes it easier for team members to find the runbook they need.

3. **Smell Test**: If you have no run books, that is likely a smell. There are several generic activities that most systems need. e.g Database password reset, DR guide etc. This is a good place to start. If you have too many (>10 per system - rough ballpark guide), it's a good time to re assess if your system is too large or if it carries any increased operational risk that needs to be automated. i.e When X happens, log in here and reboot Y service. - This is a clear stability issue that should be prioritised and fixed.

4. **Automation**: Review repetitive tasks to assess which can be automated.

For each runbook, use the following guidance:

1. **Step-by-Step Instructions**: Each runbook should provide clear, step-by-step instructions that are easy to follow. This includes the initial setup, the actual steps to perform the task or resolve the issue, and any cleanup or verification steps.

2. **Use Plain Language**: Avoid jargon and technical terms where possible. If you must use them, provide clear definitions. The goal is to make the runbooks accessible to all members of your team, regardless of their technical expertise.

3. **Include Visual Aids**: Screenshots, diagrams, and flowcharts can make complex procedures easier to understand.

4. **Link to Alerts**: Alerts should lead to actions. Linking them to run books is an easy yet effective way to embed the use of run books in daily operations.

5. **Test Your Runbooks**: Before you finalise a runbook, have someone else on your team follow the instructions to ensure they are clear and correct.

6. **Update & Improve**: Runbooks should be living documents. As your systems and procedures evolve, so too should your runbooks. Regularly review and update your runbooks to ensure they remain accurate and useful.

## Examples

Here are some examples to show how teams organise, manage & embed their run books in their ways of working.

**Internal Example:**
<https://myobconfluence.atlassian.net/wiki/spaces/REP/pages/9089649400/Jupiter+Vulnerability+Management+Process>

**External Example:**
<https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/>

**Organising Runbooks:**
<https://myobconfluence.atlassian.net/wiki/spaces/SMEPE/pages/1017253286/Operational+Procedures>

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

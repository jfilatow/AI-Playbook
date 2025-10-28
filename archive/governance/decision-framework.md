---
title: Decision Framework
---

![MYOB Banner](../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9294021744 -->
![](../assets/BANNER.png)

# Decision Framework

---

## Who should use this & why?

Change is inevitable and pushed by both business & technical drivers. The circle of impact of such a change can vary – within a domain, across domains and even across the organisation. Most changes can be solved in multiple ways. Each way brings its own advantages & disadvantages. So, if an organisation must expend energy regularly to make decisions & keep evolving, a standardised decision framework (process & artefacts) helps:

* Share context
* Discover known unknowns
* Foster a culture of feedback
* Build trust & commitment for the change
* Expend “just-right” efforts in decision making

## Decision Starter Kit

There are some key tools and techniques in this framework that enable good decisions. If you are new to driving decisions in MYOB or would like a refresher, this is right place to begin.

| Tool or Technique | When to use | How it helps | Where it lives |
| ----------------- | ----------- | ------------ | ----------- |
| [Solution Design](./solution-design/README.md) | Initiative kick-offs | <ul><li>Capture evolving context of a solution for an initiative</li><li>Capture decisions made (each will have its own ADR)</li><li>Tell key stakeholders just enough details of the solution</li><li>Record workings of solution</li><li>Enable feedback</li></ul>| Driving domain |
| [Architectural Decision Record](./architecture-decision-record.md) | Kicking off a significant  decision <br /><br /> (more than few cards OR change in architectural direction)|<ul><li>Capture weighted considerations</li><li>Capture solutions alternatives considered</li><li>Capture decision</li></ul>| Type A: Domain <br /><br />Type B: LoB<br /><br />Type C: [Tech](https://myobconfluence.atlassian.net/wiki/spaces/TEC/pages/9329770902/Architecture+Decisions+Register)  |
| Decision Type  | Kicking off a significant  decision | <ul><li>Determine size of impact </li><li>Determine appropriate stakeholders</li></ul>| Noted within ADR  |
| [Request for Comments](./rfc-process.md) | Before implementing Solution or Decision  | <ul><li>Enable wider collaboration & feedback</li><li>Reduce risks, call out assumptions or add missed context</li></ul>| [#sig-rfc](https://app.slack.com/client/T02998537/C059YTLJHCZ)|
| Decision Register | After feedback on Solution or ADR  | <ul><li>Stitch together evolution of  a domain, LoB or MYOB</li><li>Critically examine current state</li></ul>| Type A: Domain <br /><br />Type B: LoB<br /><br />Type C: [Tech](https://myobconfluence.atlassian.net/wiki/spaces/TEC/pages/9329770902/Architecture+Decisions) |

*Note*: Architectural Decision Records were historically called Solution Options (name discontinued).

## Key Principles

1. Where available, reference (All-in-Ones, Confluence Pages etc.) not re-document.
2. Just enough documentation (refer and add only minimum needed to paint a cohesive story).
3. Simple yet smart documentation (lines & boxes, colour code the same diagram to show current vs future state, bullet points instead of paragraphs etc.).

## How to use the framework?

This section helps decisions makers as to which decision type they are making and the appropriate tools & methods to leverage.

### Driving Different Decision Types

Use this table to understand the appropriate channel & stakeholders for each decision type.

**Type A (Domain)**: These are decisions that primarily impact a specific domain within the organisation. The circle of impact is usually limited within the domain, and the stakeholders involved are mainly domain representatives and technical leaders within that domain.

**Type B (LoB)**: These decisions have a broader impact, affecting multiple domains within a specific Line of Business. The key stakeholders include representatives from the impacted domains, segment architects, and LoB level technology forums.

**Type C (Tech)**: These decisions have the highest level of impact, potentially influencing the entire organisation. Stakeholders for these decisions include the Chief Technology Officer (CTO), the Head of Architecture, and heads of impacted technologies or platforms.

| Type | Driver | Where/Whom to share | Reviewers | Tie-breaker |
| ---- | ------ | ------------------- | --------- | ----------- |
| A (Domain) | Team/ Domain Representative |Domain Technical Forum or slack channel |  Team outside the domain which has potential impact e.g. custodians of the system outside the domain. <br /><br /> Segment Architect.<br /><br /> Engineering Managers. | Technical Domain leaders such as EM/DM or delegated to Principal Developer. |
| B (LoB) | Team/ Domain Representative | Segment Technology Forum or slack channel.<br /><br /> LoB Level technology forum or slack channel.<br /><br /> Head of Architecture.|  Team outside the domain which has potential impact e.g. custodians of the system outside the domain. <br /><br /> Segment Technology Manager / Head of Tech.<br /><br /> Segment/LoB Architect.<br /><br /> Engineering Managers. | Segment Technology Manager / Head of Tech or delegated to Segment/LoB Architect.  |
| C (Tech) | Team/ Domain Representative | Such a forum usually would not exist for that specific problem & people and likely will need to be created. <br /><br /> Head of Architecture should be included in such a group. <br /><br /> TAG & Tech SLT  |  Chief Technology Officer.<br /><br /> Head of Architecture.<br /><br /> Impacted Heads of Tech / Platforms | Chief Technology Officer or Head of Architecture with delegated authority. |

### Examples

Type A: <https://myobconfluence.atlassian.net/wiki/spaces/BIL/pages/9013855686/Solution+option+for+back-office+gateway+performance+test>

Type B: <https://myobconfluence.atlassian.net/wiki/x/OARPGwI>

Type C: <https://myobconfluence.atlassian.net/wiki/spaces/CLOUDENG/pages/8976794106/MYOB+AWS+Resource+Tagging+Proposal>

### Glossary of Roles

#### Reviewers

An individual or group of stakeholders that must be made aware of the changes being proposed due to the impact it has on their teams/domain or functions. These usually are people/teams outside the domain. Some of them might provide feedback. Some of them will be key to moving ahead and we want alignment with them (ranging from explicit via ADRs or implicit via slack eye emoji).

#### Tie-breaker

If the group is unable to make a timely decision, the tie breaker will be engaged by the decision maker. It will be an individual who is consulted in a coaching capacity to enable the group to make the decision.

### Warning

This framework is not a silver bullet. Not all decisions that will come from this process will be perfect. That is okay. Efficient decisions are better than perfect (expensive) decisions. Sometimes, context changes which may need a team to pause & pivot. This is useful to remember as we employ these methods to keep things moving and avoid “Analysis Paralysis” / expensive meetings with no outcomes.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

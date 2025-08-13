---
title: Using Open Source Code
---
<!-- confluence-page-id: 9294021787 -->
![](../assets/BANNER.png)

# Using Open Source Code

## Introduction

At MYOB we successfully use a lot of use of open source code within our products - and this is broadly encouraged. It’s usually better for us to use an existing and widely adopted open source solution than to build and maintain our own. However there are some things we need to keep in mind.

1. The open source code must be fit for purpose, be of sufficient quality, and be well cared for by the maintainers
2. We must sufficiently protect ourselves from the legal implications of open source licenses.

This document is focused on open source libraries, frameworks, and tools that are incorporated into our products as dependencies.

## Choosing Open Source Code

Before including an open source dependency within our software, we must do some quality checks. Below is some recommended things to look at.

### Do we need it?

- Is there something already in wide use at MYOB? - do we need to introduce something new? Is there something already on the MYOB Tech Radar?
- Are there commonly-used libraries/tools in the language ecosystem, that developers are likely to be already familiar with?
- Is the long term value of the code worth the maintenance cost of the dependency? E.g. does the dependency do much more than what is needed? Does the dependency also bring in many other dependencies?

### Is it good quality, and is it well maintained?

- How many GitHub stars? - indicating popularity in the community
- Are there recent commits? - indicates an active maintainer (with the caveat that some long-lived projects are quite stable)
- How many active maintainers are there? - projects depending on a single maintainer can be fragile
- Who is the maintainer, is there a commercial interest? - sponsorship by a larger company is usually a good thing
- Are GitHub issues and PRs responded to and actioned promptly? Suggest have a look particularly for issues and PRs that include words like VULN.
- Is Dependabot enabled, or other tools/approaches to flag and automate dependency management and manage vulnerabilities?

Finally, does it have an OSS license that we can accept?

## Which Open Source Licenses are acceptable?

When selecting open source dependencies, we must be aware of the license applicable to the dependency. Open source authors select a license which defines how we are allowed to use the code, including any obligations that we must meet when we use it.

### Permissive Open Source License - **Use freely**

This category of “commercial-friendly” licenses impose minimal obligations for us to comply with. The most common permissive licenses are *MIT, BSD, and Apache*, although there are other less-common permissive licenses.

**Freely use open source dependencies with MIT, BSD, and Apache licenses in our products.**

**For other licenses you believe to be permissive, please talk to the Head of Architecture or TAG and we will seek legal review.**

Note if we use these licenses in distributed software - downloadable binary applications or mobile applications - we need to be especially careful to ensure we are meeting the obligations of the license. This often involves including a copyright statement and copy of licenses within our product.

### Restrictive Open Source Licenses - **Do not use**

Restrictive (or Copyleft) licenses impose obligations that may be difficult or prohibitive for us to meet. Common restrictive licenses include the GPL, LGPL, and AGPL licenses, as well as the MPL and EPL licenses.

Although our online-only products *could* use some restrictively licensed dependencies and manage the obligations, we believe it is safest for MYOB to avoid them altogether - there is almost always a good alternative.

**DO NOT incorporate GPL, LGPL, AGPL, MPL, or EPL licensed dependencies in our products, regardless of whether they are hosted or distributed.**

Please look for alternative open source dependencies that are permissively licensed.

Exceptions to this policy will require approval from the CTO.

General process for approval will be to draft an [ADR](../process-and-governance/architecture-decision-record.md), tag the CTO for explicit written approval.

The ADR should include:

- Intended usage - internal platform/tool vs customer-facing product
- Usage as a standalone tool vs embedded
- Alternatives that could be used (the other options)

To allow consideration and acceptance of risk if required.

### Is a commercial license available?

Restrictive licenses are often used to restrict commercial use of open source and entice us to purchase a commercial license. This is particularly common for the AGPL license. If a restrictively-licensed dependency is particularly compelling, it may be worth investigating whether a suitable commercial license can be purchased. A purchase of this nature will need to go through normal procurement processes.

### Unlicensed Code - **Do not use**

If you find code published without an open source license, we should assume that we don’t have any right to use the code in our products.

## One of our products is already using a dependency with a restrictive license - what do I do?

We do currently have some dependencies within our products that do not match our policy above. Where possible during normal software maintenance we should replace dependencies that use restrictive licensing with better options - we’d recommend capturing these in your Light on the Hill.

## Further reading

1. [tl;drLegal - Software Licenses in Plain English](https://tldrlegal.com/)
1. [Licenses | Choose a License](https://choosealicense.com/licenses/)
1. [Open Source Licenses: Types and Comparison | Snyk](https://snyk.io/learn/open-source-licenses/)

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

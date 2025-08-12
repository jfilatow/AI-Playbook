---
title: Build Security In
---
<!-- confluence-page-id: 9294021666 -->
![](../assets/BANNER.png)

# Build security in

#### Level of guidance: Standard

## Decisions to make

- How to 'build security in' as part of the software development lifecycle.
- How do I "shift security left"?
- How do I manage secrets
- What security standards should be adopted?

## What is it?

**Build security in** is the engineering practice of including security practices throughout the deployment and development lifecycle. It involves making small and frequent security changes and improvements over time. This includes:

- Defining specific security checklists for your team or product.
- Using established frameworks for security best practices.
- [Threat Modelling](../security/threat-modelling.md) with product owners and developers. Diversity in skills and experience is critical to doing Threat Modelling well.
- Classify security concerns as stories, acceptance criteria, or cross-functional requirements.
- Include automatic security testing into the [Continuous Integration](./continuous-integration.md) pipeline.
- Include security testing as a part of the release process.
- [Secrets](../glossary.md#secrets) such as passwords or login tokens are managed in a systemic process.

## Why do we have it?

Security is not only critical in operating a business but also essential in building trust with our customers. High-profile breaches of security and privacy issues will greatly damage the trust relationship.

The scale and complexity of security threats increase every day. The traditional [security sandwich approach](../glossary.md#security-sandwich) (aka bolt-on security) is hard and expensive to integrate with a continuous delivery approach and reduces our ability to use automated security checks.

We as a business want to minimise our security and privacy risks by implementing well-designed security practices across many aspects of our work. This will help to create trust with our customers, making our customers happier to work with us.

## How do we do it?

For further reading, check out the [Security chapter of Codex](../security/README.md).

These are the key practices to help us shift security to the left and 'build security in' earlier:

- **Security Champion**: Identify a champion in your team who is also a member of the wider security community to advocate and enforce stronger security practices.
- **[Secret Management](../glossary.md#secrets)**: Define how to store and manage secrets, including changing (rotating) secret values over time.
- **Security in [cross-functional requirements](../glossary.md#cross-functional-requirement)**: Define Security requirements in cross-functional requirements. This can become security acceptance criteria within a user story or become a standalone security story.
- **Define security checklists**: Define and use a security checklist artefact as a baseline for security practices for your team or product.
- **Threat Modelling**: Use the [STRIDE](../glossary.md#stride-model) model to identify and prioritise security requirements associated with an application.
- **Application Vulnerability Testing**: Identify vulnerabilities and alert the team. This should be a part of the Continuous Integration pipeline.
- **[Least Privilege Access](../glossary.md#principle-of-least-privilege)**: Access to systems or data should be managed based on the principle of least privilege.

## Templates, Examples, and Sensible Defaults

- Flagging security concerns in user stories or acceptance criteria
  - Instead of saying "As a user, I want to access a resource" say "As a user, I want to be able to log in securely, and access only the minimum viable information required"
  - Instead of acceptance criteria saying "Access to a resource should be allowed" say "Access to a resource should be disallowed unless X, Y, or Z"

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

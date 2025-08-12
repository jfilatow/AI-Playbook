---
title: Information Classification
---
<!-- confluence-page-id: 9293923564 -->
![](../assets/BANNER.png)

# Information Classification

#### Level of guidance: Standard

## What is it?

At MYOB, we classify information in terms of value, legal requirements, criticality, and sensitivity to unauthorised disclosure or modification.

Information classification identifies the types of information used inside a system or product based on policy, standards, or regulation. Knowing how information is classified helps us determine what security controls are required to protect that information.

The [MYOB Data Classification and Security Standard](https://myobo365.sharepoint.com/sites/IQMS/Shared%20Documents/Policies%20and%20Documentation/All%20MYOB%20Standards%20-%20Published/MYOB%20Data%20Classification%20Standard.pdf) refers to the following classifications for MYOB data:

### Public

Public (0 - GREEN) – Public data is defined as data that anyone either internal or external to MYOB can access. The disclosure, use or destruction of Public data will have limited or no adverse effects on MYOB nor carry significant risk. Examples of Public data may include readily available news, announcements intended for the public, public product information and product instruction manuals.

### General

General (1 - AMBER) – General data is any data used in the day-to-day operation of MYOB. Most MYOB information should fall into this category. General data is subject to MYOB’s standard level of protection. Examples of General data may include Customer Data files, financial statements, team plans and support tickets.

### Restricted

Restricted (2 - RED) - Restricted data is the most important type of data managed by MYOB and requires stringent protection. Data in this classification may require legal notification if breached or otherwise disclosed. Examples of Restricted data may include Tax File Numbers (TFN), Personal Information (PI), Sensitive or Health Information (SI/HI), Payment Card Information (PCI) and sensitive employment matters.

**The default data classification (before formal classification) is General.**

At MYOB, you may encounter these terms however you are not expected to classify data yourself.

## Why do we do it?

We want to protect our customers and the information they trust us to hold. Information classification allows us to separate sensitive data from non-sensitive data and prioritise security measures. Protecting data effectively requires investing the right amount of effort in proportion to its classification.

MYOB's Information Classification aims to classify data in accordance with standards so that it can be managed under an appropriate data lifecycle.

## How do we do it?

It's essential to understand the type of data we're dealing with. At MYOB, we categorise information according to the following four categories.

* PI Data: A subset of Customer data that the Privacy Act regulates.
* ISO Data: Data we must protect to keep ISO certification.
* PCI Data: Payment Card Information; such as credit or debit cards.
* COI Data: Customer Owned Information; such as ledger or bank transaction information.

Refer to the [Further Resources](./information-classification.md#further-resources) section for more information.

It is expected that engineers will be able to identify these information categories and their classifications, and engineers are expected to know and use these terms in their day-to-day work.

### 1) PI Data

Classification: Customer data, Internal Restricted Data, or Confidential Data.

Data that identifies or relates to an individual is considered to be Personal Information (PI). This includes, but is not limited to Name, Email, Address, Phone number, Date of birth, or Driver's license number.

If a system handles PI data,

* the system must not log PI data.
* it is strictly forbidden for people operating outside Australia and New Zealand to access PI data.
* verify that the non-production system does not contain any PI data.
* Access to PI data must not be required for development or operational activities.

### 2) ISO Data

Classification: Customer data, Internal Restricted Data, or Confidential Data.

Tax File Number (TFN), Inland Revenue Department (IRD) number, and Superannuation number must not be used outside of whitelisted systems. MYOB must protect these data to keep its ISO certification. For this reason, we refer to them as ISO data at MYOB.

If a system handles ISO data,

* Verify the system is approved to use ISO data.
* To clarify requirements for certification, refer to [ISO 27001-ISMS](https://myobconfluence.atlassian.net/l/cp/2HsVMcS4) or contact GRC.
* Access to ISO data must not be required for development or operational activities.

### 3) PCI Data

Classification: Customer data or Confidential Data.

The data associated with credit cards (numbers / CVV) is extremely sensitive and is referred to as PCI data because it is strictly regulated by the PCI DSS.

If a system handles PCI data,

* the system must be under [MYOB PCI DSS products](https://myobconfluence.atlassian.net/l/cp/EDuhxdfX).
* data from PCI must never be present, transited, or used in any other systems.
* the system must comply with 12 requirements consisting of 220+ individual sub-requirements. Details can be obtained from GRC.
* access to PCI data is strictly forbidden in any activity one may perform.

### 4) COI Data

Classification: Customer data.

The majority of sensitive data we protect is also Customer Owned Information (COI), but we specifically refer to Bankfeeds transactions and Ledger transactions as COI data.

If a system handles COI data,

* Access to COI data is strictly forbidden in any activity one may perform.

### 5) Other Data

If the classification of the data is not apparent, engage the [Governance Risk and Compliance Team (GRC)](https://helpme.myob.com/hc/en-us/articles/1500002641061-How-to-contact-GRC) to assist in classifying the data.

## Principles

1. Whenever possible, avoid using or storing sensitive data in applications.
2. All data in an application has a classification.
3. Information must be protected according to its classification.
4. Store sensitive data only where it has been explicitly permitted.

## Further Resources

* [MYOB Data Classification and Security Standard](https://myobo365.sharepoint.com/sites/IQMS/Shared%20Documents/Policies%20and%20Documentation/All%20MYOB%20Standards%20-%20Published/MYOB%20Data%20Classification%20Standard.pdf)
* [What is PI and Customer Owned Data? (MYOB)](https://myobconfluence.atlassian.net/wiki/spaces/DASS/pages/1118330300/What+is+PI+and+Customer+Owned+Data)
* To gain information on compliance, governance, and risk [Contact the GRC team](https://helpme.myob.com/hc/en-us/articles/1500002641061-How-to-contact-GRC)

## Relevant Standards

These are just some standards complied with by MYOB. For an exhaustive list, [contact the GRC](https://helpme.myob.com/hc/en-us/articles/1500002641061-How-to-contact-GRC)
* [ISO-27001](https://www.iso.org/isoiec-27001-information-security.html)
* [ISO-27002](https://www.iso.org/standard/75652.html)
* [PCI-DSS](https://www.pcisecuritystandards.org/document_library/?category=pcidss&document=pci_dss)

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

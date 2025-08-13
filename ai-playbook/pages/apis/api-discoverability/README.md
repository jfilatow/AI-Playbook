---
title: API Discoverability
---
<!-- confluence-page-id: 9310831465 -->
![image](../../assets/BANNER.png)

# API Discoverability

# Discoverability Overview

API Discoverability is the ability to search and find different API resources. The discoverability of an API directly impacts its adoption and usage. If the API is used internally, having a single or central source of information for the API can foster efficiency and innovation whilst allowing a certain amount of "self-service" for consumers. Discoverability more important when communicating aspects of an externally facing API. As external APIs often have less direct access to support and therefore clients need to be actively informed of changes and new features as they are released.

Discoverability includes marketing of the API, documentation of the APIs interfaces (endpoints), usage in context, examples of payloads, and any other relevant information that might help a client or consumer to use and implement the APIs functionality easily and efficiently.

If the teams are not able to discover existing APIs, they might build a new API with the same functionality. It can lead to a duplication of efforts and underutilisation of the existing API. Consumers may unwittingly (or not) use the API in a manner that it is not intended. Therefore, causing server-side issues or increase in workload.
An easily discoverable API cuts down on support requests and reduces incidents caused by misuse.

Discovering an API is often done via Developer Portals. Developer portals provide a convenient and scalable way to achieve this. Portals allow consumers to; search, filter, learn, understand, and sign up for the APIs they are interested in.
An ideal API developer experience caters to both technical and business audiences, enabling them to discover and consume the APIs easily.

- The core components of API discoverability include:
  - Visibility – Many developers discover third-party APIs in marketplaces, catalogues or portals, and integrators (e.g., Zapier). Including your APIs in these places can maximise visibility and increase the chances of discovery.
  - Documentation – Intuitive and easy-to-understand documentation enables internal and external developers to search and understand your API. As a result, they can more readily discover it, if it contains functionality or data they require.
  - Definitions – OpenAPI and other machine-readable API definitions can help developers quickly generate SDKs and test cases to see if an API meets their requirements. These capabilities can help accelerate adoption and avoid missed opportunities.

---

# API Discovery

API providers can create an effective self-service API program by incorporating aspects of API discoverability such as search, filter, categorisation, documentation, usage rules, terms and conditions.

## Internal vs External API Discovery

Making an API discoverable needs to be considered for both internal and external APIs. Often internal APIs are neglected as they are not publicly facing and deemed to be of lower priority. Internal consumers should be treated as external clients when developing APIs, as they are in essence the clients of an internal or server-side team.

External APIs need to be discoverable out of the box as they present a public "face" of the company to the outside world, and thus important in maintaining a professional image in public. Public APIs often cater to non-technical business stakeholders and need to be documented accordingly making them intuitive and any information easy to find. Another consideration for any externally facing API is security and this is often implemented via logins and an authentication process for the API portal.

## Making an API Discoverable

There are three main aspects of making an API discoverable; Defining the API, Documenting the API, and ensuring the API is marketed or available by it stakeholders.

Creating an API Portal is generally considered a method to achieve these aspects.
Portals consist of the following pages:

- **The Landing page** - A general explanation of the API or group of APIs available within.
- **Catalogue page** - A page holding main links to each API.
- **Details page** - Detailed documentation of the API and its endpoints. This can include links to FAQs.
- **Interface page** - A technical page detailing the requests and responses for each endpoint in the API, along with usable examples and or templates for users.
- **Contacts page** - with links where the user can get further questions answered.

The sections of a Portal are important for holding the information needed to use the API, but they are useless if not easily navigable. Finding the API page you are looking for can be enabled by the following tools;

- **Filters** - E.g;
  - Type, Team, Organisation, Category, Tags
- API providers can add additional checks and rules to restrict which APIs are exposed and which are not.
  - Filter Search by;
    - API name and description
    - Markdown content in the API documentation
    - Tags - e.g. Tax, Search, Data, etc.
    - Categories - e.g. system, process, Database, ATO, Internal etc.
    - Custom fields
    - Properties within API specifications (base URL, method, traits, endpoints, etc.)
- **Savable Searches** - Searches should be savable so clients can save their most common APIs and endpoints for easy access.
- **Categories** - Groups of API endpoints for the same area.
- **Tags** - Custom tags to be added for ease of searching specific APIs or aspects of APIs.

---

# Types of Discoverability

## Code Examples

Code snippets can significantly improve API discoverability by providing developers with practical examples of how to use an API. Code snippets can help in following ways:

- **Quick Reference** - Code snippets act as a quick reference guide. When developers need to perform a specific task with the API, they can look up relevant code snippets instead of going through extensive documentation.

- **Integration Guidance** - Code snippets often demonstrate how to integrate the API into various programming languages. This can be useful for developers working in diverse programming language/platforms.

- **Reduced Learning Curve** - By providing working code examples, developers can learn faster. This can be beneficial for those who are new to the API or programming in general.

- **Error Handling** - By including error handling in code snippets, developers can see how to handle common issues or edge cases when using the API, which can save time.

- **Improved Onboarding** - Code snippets can be an essential part of onboarding developers. They make it easier for new users to get started quickly.

## Changelog and Versioning

Changelog and versioning are essential components of API design and play a crucial role in enhancing API discoverability.

- Further information can be found in the [versioning page](../api-security/versioning.md).

## Tags and Categories

Adding Tags and categories can significantly enhance API discoverability by making it easier for developers to navigate through API documentation.

- **Improved Navigation** - Tags and categories help in organising groups of related content within API documentation. Information can be quickly located by searching through tags and categories.

- **Filtering** - Tags and categories can be used as filters. Users can filter APIs based on specific tags or categories, therefore reducing the time it takes to find the required documentation.

- **Multi-Platform Support** - Tags and categories can help developers find platform-specific documentation for APIs that are available on multiple platforms. This is useful when an API offers different functionalities across platforms.

##

# Discovery Examples

Here are some examples of environments being observed with dashboards and other display types. These examples are intended simply as examples o the concepts above in context. Please use these as a reference for ideas of they way that Discovery could be handled in your environment. These examples are not intended as a "How to…" or a formal guide that must be followed.

- [Codex Examples in Context](./examples.md)

### Other Examples

- [JSON APIs](http://apisjson.org/)
- [Postman API Discovery](https://www.postman.com/explore)
- [Aid to Discovery](https://swagger.io/)
- [GitHub API Docs](https://docs.github.com/en/rest?apiVersion=2022-11-28)
- [RapidAPI](https://rapidapi.com/)
- [Google APIs Explorer](https://developers.google.com/apis-explorer)
- [GitHub - A collective list of free APIs for use in software and web development](https://github.com/public-apis/public-apis)

---

# Resources & Useful Links

- [What is API Discovery?](https://rapidapi.com/blog/api-glossary/api-discovery/)
- [How Discoverability Leads to API Innovation](https://blog.stoplight.io/how-discoverability-leads-to-api-innovation)
- [Everything You Need To Know About API Discovery](https://nordicapis.com/everything-you-need-to-know-about-api-discovery/)
- [Innovate Faster with API Discoverability](https://smartbear.com/blog/innovate-faster-with-api-discoverability/)
- [REST API Discoverability](https://www.baeldung.com/restful-web-service-discoverability)
- [5 Ways to Improve API Discoverability](https://blogs.mulesoft.com/dev-guides/api-design/developer-experience-with-api-discoverability/)
- [How to make your APIs more discoverable](https://developers.redhat.com/articles/2022/10/06/how-make-your-apis-more-discoverable#building_an_inventory_of_apis)
- [Types of Discoverability](https://smartbear.com/blog/innovate-faster-with-api-discoverability/)
- [Starting Discovery](https://developers.redhat.com/articles/2022/10/06/how-make-your-apis-more-discoverable#building_an_inventory_of_apis)
- [Improving Discoverability](https://blogs.mulesoft.com/dev-guides/api-design/developer-experience-with-api-discoverability/)
[General how to](https://nordicapis.com/everything-you-need-to-know-about-api-discovery/)

---

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

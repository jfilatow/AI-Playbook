---
title: Documentation
---
<!-- confluence-page-id: 9294021588 -->
![](../assets/BANNER.png)

# Public API Documentation

There are many different flavours of public API documentation. This is our guide on how we believe it should be structured and presented to the public.

Developers expect to see well-structured, well written API documentation that is applicable to their needs. API documentation is often the starting point for determining how to integrate with your systems / services.

Having high quality documentation is a major enabler for consumers.

The key benefits are:

- Informs and demonstrates how to use the API
- Allows self-service which reduces toil and support
- Easily scales with API usage

Documentation is a high contact touch point. Providing a self service experience that is easy to consume, current and up to date, will help reduce the consumers time to integrate. Software integration can be a difficult. Providing a consistent, clear developer experience can greatly reduce common frustrations with poorly written API documentation. When business are assessing what service to use, the developer experience can be a key decision point.

## Documentation Structure

- Navigable API references
A reference list which contains a list of resources of your API which consumers can navigate. Typically a pane on the left or right of the page.

- Breadcrumb Navigation
Easy way to see where you are currently located.

- Search Box
Return relevant results based off keywords.

- Introduction Guides
How to get set up. How to perform common use cases.

- Related API resources grouped together
<!-- vale proselint.Cliches = NO -->
GET /foo and POST /foo on the same page
<!-- vale proselint.Cliches = YES -->

- Accessible
Ensure the site is [Level A](https://www.w3.org/WAI/WCAG21/quickref/) compliant.

- The API description
A simple, concise display of all the key information of the API endpoint.

At the least you should provide:

|Item|Description|Example|
|-|-|-|
|Name + HTTP Verb|The Endpoint| GET /v1/foo/bar|
|Purpose|Short description of what it does| Returns the value of foo bar|
|Parameter Descriptions| List of parameters the endpoint accepts. Query string or request parameters| Query,id,number,the id of 'bar'|
Curl Example|A curl command a user can quickly copy and test with|`curl -H "Accept: application/json" https://api.yourapp.com/v1/foo/bar?id=42`|
|Example Response|JSON or YAML with response Code| `{"id":42,"name":"Homer","beer":"duff"}`|

### Minimal Example

#### **Name**

```
GET /v1/character
```

#### **Purpose**

This allows you to specify a character first name are return all character attributes.

#### **Parameters**

|Name|Type|In|Description|
|-|-|-|-|
|`first_name`|string|query|The first name of the character|

#### **Curl**

```
curl -H "Accept: application/json" https://api.simpsons.com/v1/character?first_name=homer
```

#### **Example Response**

Response code `200`

JSON

```json
{
    "first-name":"Homer",
    "last-name":"Simpson",
    "job":"Nuclear Safety Technician",
    "email":"homer@hyper-compu-global-mega.net"
}
```

### Better

- Response should include common failure modes
- Examples should include a popular language (e.g. JavaScript)
- Level AA compliance

<!-- TODO example of better -->

### Best

- More request language examples (JS / ruby / Kotlin / .NET/C# etc)
- If you have a client then examples from those clients (with a link)
- Site is internationalised to target audience languages
- Level AAA compliance

<!-- TODO example of best -->

### Avoid

- Hard to navigate JSON responses i.e large nested example
- not specifying response type
- not enough description
- no examples

# Self Documenting APIs
<!-- TODO - Swagger and alternatives - how they can be helpful too. -->

# Status Up / Down

Whenever users are having issues connecting to APIs, one common question is, "Is it up?" Having a status page for your API which can accurately reflect the operational status is fairly important and can help avoid unnecessary queries to support teams. People can hook into notification to retrieve real time updates on incidents and resolutions.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

---

**Previous:** [← Api Testing](api-testing.md) | **Next:** [Delivery →](../delivery/README.md)

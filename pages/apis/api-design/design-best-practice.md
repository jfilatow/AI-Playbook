---
title: Best practices for Designing APIs
---
<!-- confluence-page-id: 9424142584 -->
![](../../assets/BANNER.png)

# Best practices for Designing APIs

Designing APIs with references involves creating endpoints that allow users to access related resources efficiently. Here's an outline of best practices for designing such APIs:

## Consistent URL Structure

- Design URLs that are intuitive and follow a consistent naming convention.
- Use nouns to represent resources and verbs for actions (e.g., GET /users/:id/posts/:id).
- Avoid exposing implementation details in URL.
- Avoid exposing sensitive information such as usernames, passwords, secrets etc.

## Use HTTP Methods

- HTTP defines set of request methods to indicate the desired action to be performed for a given resource.
- These request methods are sometimes referred to as HTTP verbs.
- Use appropriate methods for different operations to maintain consistency and clarity.
- Examples of HTTP methods
  - `GET` - for retrieving resource representations.
  - `POST` - for creating new resources or triggering operations.
  - `PUT` - for updating resources.
  - `DELETE` - for removing resources.

## Use correct HTTP Status Codes

- To make an API more structured and easy to use always respond with the proper HTTP Status codes.
- Should be done for both successful and failed API calls so that the user knows what happened with the request that they executed.
- Response codes can tell the consumer what their next option might be.
  - For Example;
  - A 500 Error may (depending on context) be translated into a bad Request payload with an appropriate error message.
  - A 400 series error may indicate the need for re-authentication.
  - Generally the response codes can tell the consumer whether the message can be resent or not.
- Some common examples are;
  - `200 OK` - Successful
  - `404 Not Found` - Resource not found on the server
  - `403 Forbidden` - The server understood the request but refuses to process it
  - `401 Unauthorized` - The request was not successful because it lacked valid authentication credentials
  - `400 Bad Request` - Errors from the client-side. like, model validation errors
  - `500 Internal Server Error` - Server-related errors

## Resource Representation

- Decide on the format for representing resources and their references (e.g. JSON, XML).
- Use lightweight data exchange format (e.g. JSON)
- Ensure that representations include necessary metadata and links to related resources for easy navigation.
  - Example; (from [Wikipedia - HATEOAS](https://en.wikipedia.org/wiki/HATEOAS))

    ```http
    HTTP/1.1 200 OK

    {
        "account": {
            "account_number": 12345,
            "balance": {
                "currency": "usd",
                "value": 100.00
            },
            "links": {
                "deposits": "/accounts/12345/deposits",
                "withdrawals": "/accounts/12345/withdrawals",
                "transfers": "/accounts/12345/transfers",
                "close-requests": "/accounts/12345/close-requests"
            }
        }
    }
    ```

- The response above provides links for further steps in the workflow.
- The links can be modified depending on what the downstream steps might be.

## Pagination and Filtering

- It is good practice and sense to understand who the data consumers are and therefore what data they would find most useful.
 This allows for the design of efficient Filters so data sets are not too large and complex.
- Where large data sets cannot be avoided Pagination is a solution for managing the amount of data coming back from a request.
- To handle large datasets efficiently APIs should provide ways that allow users to narrow down to exactly what they want, instead of returning all at once.
- Pagination and Filtering avoid wastage of network bandwidth and processing power on the server hosting the API.
- Allow users to specify query parameters for filtering and sorting results.
- Query strings that specify the maximum number of items to retrieve and a starting offset into the collection can be used. (/orders?limit=10&offset=20)

## Versioning

- APIs are continuously enhanced and new features are added. Versioning of an API can be used to manage changes and updates effectively.
- Allows smooth transition to new API from old API.
- Versioning often provides its greatest value when there are breaking changes between versions.
  When a data or technical contract has changed versioning can allow users who are not ready to accept the change to still use the older format.

When implementing versioning within an API some considerations are;

- Include version information in the URL or headers to ensure backward compatibility.
- Support at least one earlier version after a new release.
- Deprecate the old API once all users have switched to new version.
- Example
  > Version 1: `www.example-api.com/v1/authors`  
  > Version 2: `www.example-api.com/v2/authors`  
  > Version 3: `www.example-api.com/v3/authors`

## Security

- Implement authentication and authorisation mechanisms to control access to resources and references.
- Use industry-standard security protocols such as OAuth 2.0 or API keys.
- Use HTTPS to secure communication between clients and the API server.
- Validate and sanitise input data to prevent security vulnerabilities (e.g., SQL injection, XSS).
- Implement rate limiting and access controls to protect against abuse.
- Regularly audit and monitor API security.

## Documentation

- Provide comprehensive documentation that explains how to use the API, including examples of accessing resources and their references.
- Documentation should have references to all the API versions that you support.
- Include information on resource endpoints, request and response formats, and any additional considerations or constraints.
- More information about API documentation can be found in the Codex chapter; [API Discoverability](../api-discoverability/README.md)

## Logging

- Comprehensive logging should be implemented throughout your API to capture important events, errors, and debugging information.
- For easier parsing and analysis use structured log formats such as JSON.
- Centralise and manage logs using dedicated logging solutions or tools.

## Observability

- Observability mechanisms should be implemented to gain insights into APIs behaviour and performance.
- Distributed tracing tools can be used to trace requests across services and endpoints.
- Health checks should be implemented to monitor the status of API and its dependencies.
- Alerts and notifications should be set to proactively detect and respond to issues.

By following these best practices, you can design APIs with references that are intuitive, efficient, and easy to use, promoting better usability and developer experience.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

## References and Links

- <https://learn.microsoft.com/en-us/azure/architecture/best-practices/api-design>
- <https://www.linkedin.com/pulse/best-practices-rest-apis-sergey-idelson/>
- <https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/>
- <https://www.mulesoft.com/api-university/four-principles-designing-effective-apis>
- <https://medium.com/@shubhadeepchat/best-practices-for-good-rest-api-design-b5fae9a62c86>

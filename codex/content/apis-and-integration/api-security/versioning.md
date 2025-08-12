---
title: API Versioning
---
<!-- confluence-page-id: 9294021569 -->
![](../../assets/BANNER.png)

# API Change Management

## Overview

API is a form of contract between API consumers and builder. Hence it should be stable, consistent, well documented, and properly managed. We would not want to break this contract.
We need to manage changes to our API so that it does not impact the consumers. Our advice is to aim to be backward compatible, but plan for breaking changes or versioning as needed.

**API Versioning**: Use versioning in APIs to manage changes and updates while maintaining backward compatibility. This helps ensure that security features remain consistent across different versions of the API.

## Need

As APIs are being developed, expanded, and they mature, there often comes a point where teams need to release breaking changes.
To keep their existing consumers happy and consuming apps functional, providing teams need to version their APIs.
Breaking changes directly affect consumers' functionality. Breaking changes, if not planned properly, can be painful for consumers and other development teams using the API interfaces.

Some Reasons for API Versioning include;

- **Backward Compatibility**: Ensures that changes or updates to the API do not break existing clients’ applications.
- **Incremental Improvement**: Allows for the introduction of new features and improvements in a controlled manner.
- **Bug Fixes and Security Updates**: Provides a way to address bugs and security issues without affecting the entire user base.
- **User Experience**: Improves the user experience by providing clear and predictable paths for API evolution.
- **Flexibility**: Enables running multiple versions concurrently, giving different users the flexibility to choose the version that suits them best.

## Recommendations

### Aim to be backward compatible

Forcing every change to be viewed through the lens of backward compatibility drives us to create better API interfaces.

Tips that help to be backward compatible:

- Think from the consumer's point of view
- [Contract First Design](https://wso2.com/library/articles/soa-contract-first-design/)
- Require tolerant readers
  - e.g. a new field being added should not break the reader
- Make API contracts open to change
  - e.g. use JSON objects rather than plain text
  - e.g. JSON object rather than a direct array

### When we cannot make backward compatible changes

1. Introduce a breaking change without versioning

    We need to take steps in introducing the breaking change and communicate each step in advance.
    We need to give the consumer enough time to apply the changes. This is called API Expand-Contract pattern which makes more sense for Domain APIs but can be hard for Public APIs. Read more [here.](https://www.thoughtworks.com/en-au/radar/techniques/api-expand-contract)

    **E.g. Introducing a new mandatory field**
      - Make the field available but not mandatory
      - Communicate the change to the consumers to start providing the new field
      - Give enough time for the consumers to apply the change
      - Warn about introducing the breaking change of making the field mandatory
      - Make the field mandatory

2. Introduce versioning

    When we cannot wait for the consumers to absorb the breaking change, we will have to introduce versioning.
    These are our recommendations:
    - **Put the version in the URL path** - The version is commonly provided in the URL path, URL parameters or a header. We suggest the URL path as the default.
    - **Use integer numbers for versioning**
    - When a particular version has a vulnerability, or it needs to be deprecated; **Make the version mandatory**

## Implication of API Types

The easier it is to communicate a change to the consumers the less strict we can be on backward compatibility. Hence, we need to take the [Type of API](../api-design/types.md) into consideration.
While APIs are private contracts can easily be changed. Once these APIs are released into the Domain they need to be backward compatible. For Public APIs we need to be even more mindful of backward compatibility.

## Best Practice Recommendations for API Versioning

Outlined below are the best practices for API versioning:

1. **Semantic Versioning (SemVer)**:
   - Use a versioning scheme that conveys meaning about the underlying changes. A common approach is Semantic Versioning (SemVer), which uses three numbers: MAJOR.MINOR.PATCH (e.g., 2.1.0)
      - MAJOR: Incremented for incompatible API changes.
      - MINOR: Incremented for backwards-compatible additions or enhancements.
      - PATCH: Incremented for backwards-compatible bug fixes.
   - Semantic Versioning clear communication of the impact of changes and helps clients understand the level of changes without extensive investigation.
2. **URI Versioning**:
   - Embed the version number directly in the URL path.
     - Example: <https://api.example.com/v1/resource>
   - This makes the version being used clear and explicit, making it easy to manage and understand which version of the API is being used. It also enables running multiple versions concurrently.
3. **Header Versioning**:
   - Specify the API version in the request header.
     - Example: `Accept: application/vnd.example.v1+json`
   - Versioning in the header keeps the URL clean and can be more flexible and expressive, but may be harder to implement and understand for clients.
4. **Query Parameter Versioning**:
   - Use query parameters to specify the version.
     - Example: <https://api.example.com/resource?version=1>
   - Parameter versioning makes it easy to implement, but can clutter the URL and might not be as explicit as URI versioning.
5. **Backward Compatibility**:
   - Ensure new versions of the API are backward compatible whenever possible. Deprecate old features slowly and provide clear migration paths.
   - Reduces disruption for users and provides them with enough time to adapt to changes.
6. **Deprecation Policy**:
   - Establish a clear deprecation policy that informs users well in advance about the removal of any API features.
   - Provides users with a timeline to update their integrations, reducing frustration and maintaining trust.
7. **Documentation**:
   - Maintain comprehensive documentation for each API version. Highlight changes, new features, and deprecated functionalities.
   - Clear documentation helps users understand how to interact with different versions and eases the migration process.
8. **Testing and Monitoring**:
   - Thoroughly test each API version and continuously monitor its usage and performance.
   - When multiple versions are supported regression test each of the previous versions to ensure all changes are backwards compatible.
   - This ensures stability and reliability, and helps identify issues that could affect users.
9. **Version Lifecycle Management**:
   - Define the lifecycle for each API version, including introduction, maintenance, and retirement phases.
   Good lifecycle management helps users plan their integration and migration strategies according to the lifecycle stages.

## Further Reading

- [Hyrum's law](https://www.hyrumslaw.com/)
- [Contract First Design Principles](https://wso2.com/library/articles/soa-contract-first-design/)
- [An Approach to Contract First Design](https://milindmehta89.medium.com/adopting-the-contract-first-approach-for-seamless-api-development-49931868bdf7)
- [Postman API Versioning](https://www.postman.com/api-platform/api-versioning/)
- [REST API Versioning Strategies](https://www.xmatters.com/blog/blog-four-rest-api-versioning-strategies)
- [API Versioning Best Practice Guide](https://medium.com/@pantaanish/api-versioning-a-comprehensive-guide-to-best-practices-and-compatibility-d49eb980f0c6)
- [Semantic Versioning 2.0.0](https://semver.org/)
- [RETS API Versioning](https://blog.dreamfactory.com/version-rest-apis/#:~:text=REST%20API%20versioning%20is%20akin,do%20its%20requirements%20and%20functionalities)

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

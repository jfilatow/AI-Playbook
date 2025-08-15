---
title: API Testing
---
<!-- confluence-page-id: 9494462861 -->
![](../assets/BANNER.png)

# API Testing

## What is API testing?

API testing refers to the process of verifying and validating the functionality, reliability, performance, and security of an Application programming interface(API). An API acts like an intermediary that allows different software systems to communicate and interact with each other. API testing involves testing both the behaviour of individual API endpoints and the interactions between multiple endpoints.

## Why is API testing important?

In today's software development landscape, with applications decomposed into smaller, independently tested, and deployable components, API testing plays a crucial part. Prioritising API testing enables confident delivery of APIs, ensuring they perform their intended functions correctly and avoids unintended behaviours.

- Ensures the functionality, performance, security, and reliability of APIs and dependent applications.
- Early error detection and resolution in the development cycle prevent adverse impacts on the user interface and end-user experience.
- Enhances the quality and usability of software products by confirming compliance with specifications, standards, and stakeholder and user expectations.

## What are the different testing types that can be applied to APIs?

Various testing types can be applied to APIs such as functional, performance, security, reliability, and documentation testing.

- Functional testing verifies that the API performs expected tasks and returns expected results.
- Performance testing measures the speed, scalability, stability, and resource consumption of the API under different load and stress conditions.
- Security testing evaluates the security and protection of the API against unauthorised access and data breaches.
- Reliability testing assesses the availability, fault tolerance, and recovery of the API in case of failures or errors.
- Documentation testing checks the accuracy, completeness, and clarity of the API documentation for its users and testers.
- Contract testing is a method to ensure that two separate systems (such as two microservices) are compatible and can communicate with each other. Complete API contract testing must validate both the API producer (server side) and the API consumer (client side) to detect and diagnose when a contract is broken by either side.

## What are the challenges of API testing?

- Requires a deep understanding of the API design, functionality, and logic, as well as the tools and frameworks used to test them.
- Technical skills and knowledge are also necessary for testing complex scenarios, data formats, protocols, and parameters.
- Comprehensive and effective test strategy must be implemented to test various aspects of the API, such as functionality, performance, security, reliability, documentation, and usability.
- Close collaboration between developers, testers, consuming teams and other stakeholders is essential for testing across different components, systems, and platforms.

## How do we do it?

For an overall testing strategy please refer to [Testing Strategy](../deliver/quality-strategy.md) in codex.

Testing an API (Application Programming Interface) involves verifying that the API functions correctly, performs as expected, and meets its requirements. Here's a general approach to testing an API:

1. **Understanding API Documentation**: Before testing, thoroughly review the API documentation to understand its endpoints, parameters, request/response formats, authentication methods, error codes, and usage guidelines.

2. **Identifying Test Scenarios**: Based on the documentation, identify various test scenarios to validate different aspects of the API, including positive/negative cases, edge cases, and boundary conditions.

3. **Setting Up Test Environment**: Create or use existing test environments where you can safely execute API requests without affecting production data. This may involve setting up test servers, databases, and other necessary infrastructure. The test environment should include data to test all supported versions of the API.

4. **Test Case Design**: Develop test cases for each identified test scenario. Test cases should cover different HTTP methods (GET, POST, PUT, DELETE), parameter combinations, authentication mechanisms, error handling, and data validation.

5. Test cases should include scenarios to address all supported versions of the API, testing for backward compatibility and functional testing of behavioural changes of all supported versions.

6. **API Testing Tools**: Choose appropriate API testing tools to automate the execution of test cases and streamline the testing process. Popular tools include Postman, Insomnia, SoapUI, and Swagger.

7. **Test Execution**: Execute the test cases against the API endpoints, either manually or using automated testing tools. Ensure that each test case is executed correctly, and the expected results match the actual responses returned by the API.

8. **Data Management**: Manage test data carefully, ensuring that test data is isolated from production data and that the test environment is properly cleaned up after testing to avoid contamination or interference with subsequent tests.

9. **Handling Authentication**: Test authentication mechanisms thoroughly to ensure that only authorised users can access protected endpoints and that authentication failures are handled gracefully.

10. **Performance Testing**: Conduct performance testing to assess the API's response time, throughput, and scalability under different load conditions. Tools like Apache JMeter or Gatling can be used for this purpose.

11. **Security Testing**: Perform security testing to identify vulnerabilities such as injection attacks, cross-site scripting (XSS), and broken authentication. Tools like OWASP ZAP or Burp Suite can help in detecting security issues.

12. **Integration Testing**: If the API interacts with other systems or services, conduct integration testing to verify that data is exchanged correctly, and the integration points function as expected.

13. **Monitoring and Logging**: Implement monitoring and logging mechanisms to track API usage, performance metrics, and error logs in real-time. This helps in identifying issues and diagnosing problems quickly.

14. **Regression Testing**: As the API evolves or new features are added, perform regression testing to ensure that existing functionality remains intact and unaffected by changes.

15. **Documentation Validation**: Verify that the API documentation accurately reflects the API behaviour and that any changes made to the API are appropriately documented.

16. Maintain the test artefacts- Test strategy, test cases, test environment as the API evolves and when API versions are deprecated. Consider how the test suite can contribute to e2e automated testing.

By following these steps, you can effectively test an API to ensure its reliability, functionality, security, and performance, thereby delivering a high-quality API to consumers.

## Best Practices of API Testing

Consider the shift left and shift right in your API testing approach.

### API shift left testing

Shift left in API testing involves testing APIs early in the development cycle. Here's how it's done:

- API Design Review: Review API specifications to ensure they meet requirements.
- Mocking: Create mock APIs for parallel development and testing.
- Contract Testing: Use tools like Pact or Spring Cloud Contract to ensure interactions adhere to contracts.
- Unit Testing: Write granular tests for API methods.
- Integration Testing: Validate interactions between system components.
- Security Testing: Test for vulnerabilities at the API level.
- Performance Testing: Identify bottlenecks early with tools like JMeter or Gatling.
- Automation: Automate tests using frameworks like Postman or REST Assured.
- Continuous Feedback Loop: Establish communication channels for refining APIs throughout development.

### API shift right testing

In API testing, "shift right" involves ongoing testing activities post-deployment to ensure APIs perform as expected and adapt to user needs. Here's how it's done:

- Production Monitoring: Monitor APIs in production to detect anomalies and performance issues using tools like New Relic or Datadog.
- Real User Monitoring (RUM): Gather insights from user interactions to understand usage patterns and identify areas for improvement.
- A/B Testing: Compare API versions or features live to validate changes before full deployment.
- Canary Releases: Deploy new versions to a small user group for monitoring before full release.
- Chaos Engineering: Test system resilience by injecting controlled faults or failures.
- User Feedback Integration: Collect and analyse user feedback for optimising APIs.
- Security Audits: Regularly audit for vulnerabilities and compliance with security standards.
- Performance Optimisation: Continuously optimise API performance based on usage and feedback.
- Incremental Updates: Release improvements iteratively based on feedback and business needs.

## Further Guidance

The following links provide further guidance on API testing:

- <https://smartbear.com/learn/api-testing/what-is-api-testing/>
- <https://testfully.io/blog/api-testing/>
- [#sig-postman](https://myob.slack.com/archives/C05U1Q6080N)

## Further info or feedback

Please email us at <codex@myob.com> or contact us on Slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

---

**Previous:** [← Api Discoverability](api-discoverability/README.md) | **Next:** [Documentation →](documentation.md)

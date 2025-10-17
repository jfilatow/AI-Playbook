---
title: API Logging and Monitoring for Security
---

![MYOB Banner](../../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9582379224 -->
![](../../assets/BANNER.png)

# API Logging and Monitoring for Security

---

Logging and monitoring of security events in web APIs are essential practices to ensure the security, performance, and reliability of web applications. These practices involve systematically recording events and analysing them to detect and respond to potential security incidents. The important implementation considerations for Logging and Monitoring are outlined below.

## Logging and Monitoring Considerations

### Scope and Strategy

- **Define Objectives**: Establish what you aim to achieve with logging and monitoring (e.g., detect anomalies, ensure compliance, etc.).
- **Identify Critical Data**: Determine which parts of the API are most critical and what types of data need logging (e.g., access attempts, errors, data changes).
- **Type of Data**: Consider what data is most useful to log. Also try to restrict Private and Restricted data in Logs.
- **Logging Levels**: Consider what will be the default Logging level. Configure Logging levels so they can be changed to be more verbose for diagnosing incidents.
  - In General Logging levels from Least to Most Verbose are; Error, Warning, Information, Debug, and Trace.

### Data to Log

- **Access Logs**: Record who accessed the API, what endpoints were accessed, and the timestamps.
- **Error Logs**: Capture error messages, stack traces, and context of the errors.
- **Audit Logs**: Log changes to critical data or configurations.
- **Security Events**: Log attempts of unauthorised access, rate-limiting triggers, and any anomalies.

### Log Management

- **Log Storage**: Ensure logs are stored securely and are tamper-evident. Use centralised log management solutions.
- **Retention Policies**: Define how long logs should be retained based on legal, regulatory, and business requirements.
- **Scalability**: Ensure the logging system can handle the volume of logs generated without impacting performance.
- _**PLEASE REMEMBER**: Do not Log any Sensitive or Private Data. If you need advice on what is sensitive or Private please consult a Team Leader or the Security Team._

### Monitoring and Alerting

- **Real-time Monitoring**: Implement tools to monitor logs in real time and detect suspicious activities.
- **Alerting**: Set up automated alerts for specific security events (e.g., multiple failed login attempts).
- **Dashboarding**: Use dashboards to visualise key metrics and trends for easier monitoring.

### Compliance and Standards

- **Regulatory Requirements**: Ensure logging practices comply with relevant regulations (e.g., GDPR, HIPAA).
- **Security Standards**: Follow industry standards like OWASP API Security Top 10, NIST, and ISO 27001.

### Privacy Considerations

- **Data Minimisation**: Log only the necessary data to reduce the risk of data breaches.
- **Anonymisation**: Anonymise or pseudonymise logs where possible to protect user privacy.
- **Access Control**: Ensure that access to logs is restricted to authorised personnel only.

### Log Analysis

- **Automated Analysis**: Use machine learning and other automated tools to analyse logs for unusual patterns.
- **Incident Response**: Develop and implement an incident response plan for when security events are detected.

### Tools and Technologies

- **Log Management Systems**: Use MYOB's Log Central to archive your logs and send them to Sumo Logic for analysis
- **Security Information and Event Management (SIEM)**: Sumo Logic provides MYOB with a platform for SIEM
- **Application Performance Management (APM)**: MYOB uses OpenTelemetry, again going into Sumo Logic for analysis

Effective logging and monitoring are foundational to securing web APIs. They provide visibility into API usage, help in detecting anomalies, ensure compliance with regulatory requirements, and facilitate a rapid response to security incidents. Employing best practices and leveraging the right tools can significantly enhance the security posture of web APIs.

## What to Log and Monitor

### API Web Request Logging

Main use case of capturing web request logs is for troubleshooting purposes. Also, it assists understanding on how your API is being used, and by whom. Generally, request logs will rarely be viewed but are needed for debugging and investigations.

Your chosen web framework should have the ability to log to a file. Here are a few key things to ensure is happening.

1. Any sensitive information is redacted before writing to the file. e.g. Auth tokens in headers or requests, PI data etc
2. The log format is in a structured file format such as JSON. (Or another well known format.)
3. You are forwarding the logs to a log aggregator. At MYOB, it's Sumo Logic and are parsed correctly for indexing and searching.(See point 2.)

Ensure you are familiar with the process of how long logs are retained and are familiar with the process of what to do if / when you discover you are logging sensitive / PI data by accident. From time to time you will discover things you missed.

Besides the standard request type information such as, user agent, source IP, HTTP Verb etc. Some other key information to remember to log are:

- Timestamps in UTC
- [ISO8601 format](https://en.wikipedia.org/wiki/ISO_8601)
- Contextual information about failures e.g. "Transaction failed due to cc format error" is _much_ better than "Transaction Failed"
  Ensure you're logging the right amount of information. This may not be obvious from the beginning but some key things to remember are:
- Log at the right level for the environment you're in e.g., not DEBUG in production
- Add remove useful / not useful logs regularly

For further information and guidance, check the Observability teams [Logging Best Practice](https://system-catalogue.myob.com/docs/default/system/obs-central/getting-started/logs/logging-best-practice/) docs.

### Exception Tracking

This isn't specific to APIs but is worth mentioning when we talk about logging. If you attempt to log exceptions to a logging aggregator, you may struggle with effective parsing. They can regularly come through unstructured (multi line exception stack trace text) and when you attempt to view them they can be out of order making the content much harder understand. To remove this and improve the speed to restoring service, you should employ the use of services that can capture exceptions effectively and aggregate them to reduce noise.

There are tools that can assist with capturing unhandled exceptions within your API system. MYOB are currently experimenting with Sentry and BugSnag. Please check the [MYOB Technology Radar](https://tech-radar.myob.com) for the status of these tools.

### Service Availability

The benefit of availability monitoring is two-fold; first, you can be alerted that your API is down or has degraded performance without relying on consumers informing you. Second, the API consumers can easily check (or be alerted) if the API is unavailable and pro-actively handle the outage.
<!-- vale proselint.Typography = NO -->
An example of an API monitoring tool is [Site24x7](https://myobconfluence.atlassian.net/wiki/spaces/SO/pages/1375112206/Site24x7) for external monitoring and alerting and should be the default option. Whatever tool you choose to monitor your API with, you should consider the following:
<!-- vale proselint.Typography = YES -->
1. Verify API is not consistently returning an error, as well as it being up
2. Support for tracking and/or logging availability to facilitate reporting or analytics, and alerting
3. Measuring the API uptime against SLOs
4. Ensuring monitoring does not impact application performance

To facilitate monitoring availability, we recommend implementing a [health check endpoint](https://microservices.io/patterns/observability/health-check-api.html).

### External Dependencies

When considering monitoring availability of your API, you should also monitoring the dependencies your API relies on, third party or otherwise. Obviously if your dependencies are down, this will affect your API and if not properly handled can cause downstream impact. Health check endpoints can help assist greatly in these checks. Database connectivity, down stream APIs etc should all be checked in a health check endpoint. Setting up alerting on this failure check would also be advised.

The health check endpoint can account for external dependencies, it can return a 200 if the API is working but the response may include that a specific dependency is unavailable, check databases connections, etc.

## Tracing

### Correlation Ids

One of the initial simplest ways to trace a request through multiple systems is via a `correlation id`. If a request to your API triggered another downstream request, ensure you forward the correlation id in the request headers. These are generally UUIDs. If you are making a downstream API request which was not triggered from an API call, ensure you generate an set a new `correlation id` in your request header.
Typically the header is called `X-Correlation-ID`. This is especially important / critical if your API is performing transaction calls.

### Distributed Tracing

From the Observability teams guide to [Distributed Tracing](https://myobconfluence.atlassian.net/wiki/spaces/OD1/pages/9586507789/Traces).
>>>
    Distributed tracing, or request tracing, is a method for teams to monitor applications (tracing), especially those composed of micro-services (distributed tracing).
    It helps pinpoint where failures occur and what causes suboptimal performance. Developers are often required to instrument the code of an application so a centralised tracing system can be used to analyse performance and debug the operations of complex software.

    Tracing enables you to:

        Trace the path of a request as it travels across a complex system.
        See the latency of components along that path.
        Determine the point along that path where errors occur.

    The basic mechanics of tracing a service:

        Assign each external request a unique external request identifier (ID)
        Pass the external request ID to all services that are involved in handling the request
        Include the external request ID in all messages and logs
        Record information (e.g. start time, end time) about the requests and operations performed when handling a external request in a centralised service
        Send all the above information to central service to record the external request from start to finish.
>>>

## Metrics and Performance Monitoring

Monitoring aspects of your APIs behaviour and performance is key to ensuring performance and ability to debug errors effectively. There are several key reasons (but not limited to):

- support - need to know when to fix things (alerting)
- verifying API performance against agreed SLOs
- can't identify performance issues if you aren't measuring
- can't verify performance improvements if you aren't measuring
- need to measure performance and metrics to detect silent failures. i.e unusually low requests for the beginning of a day

### P99/P95 Value

The P99/P95 value represents the value below which 99%/95% of observations fall and can be considered a "worst-case" level. Whether you use P99 or
P95 depends on the SLO of your endpoint.
It is useful for identifying outliers and performance issues that may not be apparent when looking at median values.
For example, if the average is 500ms but the P99 is 5 seconds it indicates that 1% of requests are taking much longer.

Metrics that should be monitored include:

- response time\* (milliseconds)
- latency, or server processing time\* (milliseconds)
- uptime (percentage)
- error rate (percentage)
- CPU and memory usage (percentage)

\* indicates metrics that should have a P99/P95

Additional performance metrics that could be monitored:

- response codes
- throughput (e.g. # of requests per minute)

There should be alerting on these metrics around anomalous behaviour, for example;

- unexpected load (i.e., higher or lower than normal)
- increases in error rate, especially the P99/P95
- increased number of non-successful response codes (not specifically endpoint failures, e.g. time-outs)

## Web References

- [OWASP API Security Project](https://owasp.org/www-project-api-security/): Provides guidelines on securing APIs, including logging and monitoring practices.
- [NIST Special Publication 800-92: Guide to Computer Security Log Management](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-92.pdf): Offers comprehensive guidelines on log management.
- [Logging and Monitoring for API Security](https://auth0.com/blog/logging-and-monitoring-for-api-security/): Auth0 blog post discussing best practices.
- [A Complete Guide to Logging and Monitoring Microservices](https://logz.io/blog/logging-monitoring-microservices/): Logz.io guide covering logging and monitoring strategies.

## Bibliographical References

- "Logging and Monitoring in DevOps: Learn how to gather, analyse, and leverage monitoring and logging data for your application" by Colin Hardy.
- "API Security in Action" by Neil Madden.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on Slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

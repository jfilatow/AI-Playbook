---
title: Observability Data Use
---
<!-- confluence-page-id: 9312501770 -->
![](../../assets/BANNER.png)

# Observability Data Use

## What Data to observe

Modern systems generate a lot of data and not all the data is equal. Therefore, an in-depth system audit is important to establish the critical data that would require immediate attention before they cause system-wide impacts.

Following are the benefits of observing critical data :-

- Easier to identify and address issues in important area leading to lower downtime.

- Cost effectiveness - By focusing on critical data, the resources can be focused on important areas thus leading to cost effectiveness.

- Less clutter - By observing only critical data we can avoid cluttering with excess data.

## Alerts

It is important to have correct alerts as part of observability. Not each error needs an alert. Alerts should be configured to send notifications for a critical event- e.g. when a system behaves outside of threshold values. For non-critical issues, self-healing or automation can be used.

Alerts can be supported by runbooks. These runbooks can be alert specific and can provide help for the person on call about how to handle the specific circumstances that fire the alert.

Following are the benefits of alerting on critical events:-

- Ensures the team knows when something has to be fixed, which should include a call to action

- Can help to pick critical problems at early stage e.g. zero-days attacks.

- By alerting only on critical events, alert fatigue is reduced i.e. critical alerts are not lost in the sea of noise or all alerts are ignored because there is too much noise

Some common alerts that should be tracked as part of observability are as follows :-

- Performance Alerts: These alerts monitor system performance metrics like response time, latency, throughput, and resource utilisation. They help in timely identifying bottlenecks or capacity-related problems.

- Availability Alerts: These alerts can be triggered by network failures, infrastructure issues etc and are used to indicate when a service or component becomes unavailable or experiences downtime.

- Security Alerts: These alerts are configured to identify potential security breaches or suspicious activities and helps in detecting and responding to security incidents promptly.

- Resource Usage Alerts: Tracking of resource consumption, such as CPU usage, memory usage, disk space, or network bandwidth are done by these alerts. They help monitor resource-intensive processes or potential resource exhaustion.

- Service-level Objective (SLO) Alerts: SLO-based alerts monitor the compliance of key performance indicators with predefined thresholds. They provide insights into whether the system is meeting its service level objectives in terms of availability, latency, or error rates.

- Error and Exception Alerts: These alerts help in identifying issues in code execution, such as unhandled exceptions, database query failures, or network errors.

## Error Capture

When capturing error metrics for APIs most errors (and responses) fall into the HTTP error category. The most useful HTTP error codes often depend on how an API has set up its error handling. For example; we often find that $00 series errors can be passed back to the Client app as they point to Authorisation or Bad Request Data errors. 500 series errors are often bad internal code errors and can be useful for finding issues. Some useful HTTP errors to track are;

- 400 Bad Request Error - Occurs when the server cannot parse the request correctly
  - Indicates bad data or formatting in a request. Or possibly a bad URL endpoint.
- 401 Unauthorized Error - Occurs with bad user credentials.
  - Usually a bad username, password, certificate, of token.
- 403 Forbidden Error - This is when a server refuses the request due to Security concerns.
  - Usually Authorisation issues or violation of server imposed restrictions e.g. firewall rules.
- 404 Not Found Error - The server cannot find the requested resource.
  - This is often a bad URL or endpoint.
- 408 Request Timeout Error - This occurs when the server does not receive a response in an allotted time.
  - These can often be retryable.
- 500 Internal Server Error - This API error occurs when a server encounters an unexpected condition that prevents it from fulfilling the API request.
  - These often point to internal errors in the API like unhandled exceptions.
- 502 Bad Gateway Error - Occurs when a server receives and invalid response from a down stream server.
  - This is often caused by internet connectivity.
- 504 Gateway Timeout Error - this is usually associated with the 502 error and involves a lack of response in an allotted time.
  - Once again this can indicate connectivity issues.
- 200 - Success - Whilst not an error Success counts can provide health statistics in the form of pie charts and ratios. e.g. 200 vs 400 errors. Or a percentage of each.

- How much information is logged? or are simply statistics reported? these are two questions that must be asked when deciding on the correct data to observe.

### Resources & Useful Links

- [Useful API Errors](https://blog.hubspot.com/website/api-errors)
- [Distributed Tracing](https://myobconfluence.atlassian.net/wiki/spaces/OD1/pages/9586507789/Traces)

---

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

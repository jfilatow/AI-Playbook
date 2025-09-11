---
title: API Rate Limiting
---

![MYOB Banner](../../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9582772337 -->
![](../../assets/BANNER.png)

# API Rate Limiting

---

Rate limiting controls the number of requests a client can make to an API within a specified time window, protecting the API from abuse and ensuring fair usage.

# Why Rate Limiting is Important

- Prevent Abuse - Protects against denial-of-service (DoS) attacks. Rate limiting alone cannot fully prevent a sophisticated DDoS attack, it can help mitigate its impact by controlling the request rate per client, making it harder for attackers to bring down the API using a single client.
- Resource Management - Ensures fair use of resources. Attackers may attempt to overwhelm an API by sending many requests in a short period, leading to resource exhaustion. Rate limiting helps mitigate this by capping the number of requests a client can make, thus preventing the API server from being overwhelmed.
- Performance Stability - Maintains the performance and availability of the API.

# Implementation Strategies

- Fixed Window - Limits requests based on a fixed time window (e.g., 1000 requests per minute).
- Sliding Window -  Limits requests based on a rolling time window.
- Token Bucket - Allows bursts of requests while maintaining a steady rate over time.
- Leaky Bucket - Similar to Token Bucket but enforces a constant request rat

# Best Practices

- Granularity -  Define rate limits per user, per IP, or per API key.
- Dynamic Limits -  Adjust rate limits based on user roles or subscription levels.
- Rate Limit Headers -  Include rate limit information in API responses (e.g., X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset).

It is recommended that rate limiting and IP blocking should all be done as far away from that app layer as possible. e.g. 'at the edge'. If there is something available for the team to use 'at the edge' then a team should be using that. App layer blocking should be last resort.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on Slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

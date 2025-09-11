---
title: API Authentication
---

![MYOB Banner](../../../assets/images/myob-banner.png)

<!-- confluence-page-id: 9547253382 -->
![](../../assets/BANNER.png)

# API Authentication

API authentication is a crucial aspect of API security. It ensures that only authorised users or systems can access and interact with the API. By implementing robust API authentication mechanisms security of the APIs is enhanced. Various methods and best practices to implement API authentication effectively are as follows :-

# Authentication methods
 - Basic Authentication - Clients send the username and password encoded in Base64 in the Authorization header.
   ```
   Authorization: Basic aXlocm5hby4RcGFzc3dvcmQ=

 - API Key Authentication - Clients send a unique key in each request, usually in the request header.
   ```
   X-API-Key: abcdef12345
   Authorization: Bearer access_token

 - JWT (JSON Web Tokens) - Tokens are generated after the user authenticates and contain claims about the user. The token is signed to ensure its integrity.
   ```
   Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9…
  
 - Mutual TLS (mTLS) - Both client and server use certificates to authenticate each other.

 - OAuth 2.0 - Uses tokens instead of credentials. Tokens can be of different types (access tokens, refresh tokens).

# Best Practices for API Authentication
 - Use HTTPS: Always encrypt API requests using HTTPS to protect data in transit.
 - Token Expiry: Implement short-lived tokens and refresh tokens to minimise the risk of token theft.
 - Scopes and Permissions: Use scopes to limit the access level of tokens to only what is necessary.
 - Rate Limiting: Implement rate limiting to prevent abuse and ensure availability.
 - Logging and Monitoring: Monitor API access and log authentication attempts to detect suspicious activity.
 - Revocation Mechanism: Ensure there is a way to revoke tokens if they are compromised.
 - Least Privilege Principle: Give users the minimal level of access they need to perform their tasks.

## Further info or feedback
Please email us at codex@myob.com or contact us on Slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

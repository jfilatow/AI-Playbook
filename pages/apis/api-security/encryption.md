---
title: API Payload Encryption
---
<!-- confluence-page-id: 9546958764 -->
![](../../assets/BANNER.png)

# API Payload Encryption

Encrypt sensitive data transmitted over the network using HTTPS (TLS/SSL) to prevent eavesdropping and data tampering. This ensures that communication between clients and the API server remains secure. The minimum version of TLS that can be used is 1.2 as many environments and platforms do not support anything lower. It is preferable where possible to use TLS 1.3 to stay ahead of any changes.

## API Encryption Critical Functions

 - **Data Protection**: Encryption ensures that the data transmitted between the client and server is protected from unauthorised access. This is essential for safeguarding sensitive information such as personal data, financial details, and login credentials.

 - **Integrity**: Encryption helps in maintaining the integrity of the data. It ensures that the data has not been tampered with during transmission. Any unauthorised alterations can be detected if the encrypted data does not match what was expected.

 - **Authentication**: Encryption can be used as part of an authentication mechanism. It ensures that the communicating entities (client and server) are who they claim to be, which helps in preventing man-in-the-middle attacks.

 - **Compliance**: Many industries are governed by strict data protection regulations (such as GDPR, HIPAA, etc.) that mandate the use of encryption to protect sensitive data. Implementing encryption in APIs helps organisations stay compliant with these regulations.

## API Encryption Implementations

Implementing encryption in APIs is crucial for securing data in transit and at rest. Current standards and best practices for API encryption focus primarily on protocols, algorithms, and implementation guidelines. Here’s an outline of the key standards used:

### 1. Transport Layer Security (TLS)
**TLS or Mutual TLS (mTLS)** (and its predecessor, SSL) is a widely adopted security protocol that involves both the client and server authenticating each other. This is particularly important in API security to ensure that both parties are trusted. Both the client and server authenticate each other using TLS certificates. When an API uses HTTPS, it is leveraging TLS. It ensures that data sent between clients and servers is both trusted and encrypted.

Some implementation considerations for using TLS are;

- **Use and Enforce HTTPS**: Ensure the API endpoint is accessible over HTTPS. This requires obtaining and configuring an SSL/TLS certificate for the server. Redirect all HTTP traffic to HTTPS so there is no choice but a secure channel.

- **Client Certificates**: Issue and configure client certificates.

- **Server Configuration**: Configure the server to request and validate client certificates during the TLS handshake.

- **[TLS 1.3](https://tools.ietf.org/html/rfc8446)**: The latest version, offering improved security and performance over its predecessors.

- **[TLS 1.2](https://tools.ietf.org/html/rfc5246)**: Still widely used, but organisations are encouraged to upgrade to TLS 1.3.

### 2. OAuth 2.0
**[OAuth 2.0](https://tools.ietf.org/html/rfc6749)** is an authorisation framework that enables third-party applications to obtain limited access to an HTTP service.

- **[OAuth 2.0 Bearer Tokens](https://tools.ietf.org/html/rfc6750)**: These tokens are often used in API calls and should be transmitted over TLS to prevent eavesdropping and tampering.

### 3. **Message-Level Encryption**

Message-Level Encryption involves encrypting the actual message or payload of the API request and response. This can be done using various encryption standards like AES (Advanced Encryption Standard). Symmetric and Asymmetric Encryption algorithms are used to secure data at rest and in transit.

- **Symmetric Encryption**: Use a shared secret key between the client and server. AES (Advanced Encryption Standard) is the most commonly used algorithm.

- **Asymmetric Encryption**: Use public/private key pairs. RSA and ECC (Elliptic Curve Cryptography) are popular for establishing secure connections and exchanging keys.

- **Library Support**: Encryption libraries can be implemented; like `crypto-js` for JavaScript, `PyCryptodome` for Python, or built-in libraries in programming languages like Java and C#.

### 4. JSON Web Tokens (JWT)
**[JWT](https://tools.ietf.org/html/rfc7519)** is a compact, URL-safe means of representing claims to be transferred between two parties. It is often used for securing API communication. JWT tokens provided via Azure is recommended at MYOB.

- **JWT Structure**: Consists of a header, payload, and signature. A good site for checking JWT tokens and understanding structure is [jwt.io](https://jwt.io/)

- **Signing Algorithms**:

JWT Commonly uses the following signing algorithms;

  - **_HS256 (HMAC with SHA-256)_**
    - Hash-Based Message Authentication Codes (HMACs) enables signing messages with a shared key. They use a cryptographic hash function (for example, SHA256). Forgery resilience of HS256 depends on the hashing algorithm used. HS256 is a symmetric algorithm with only one private key that is kept secret, shared between the two parties, and used both to create and verify the signature. The key is issued while registering an application (client secret) or API (signing Secret) with the HS256 algorithm. A major drawback of this approach is that if the key gets compromised, you need to generate another one (redeploy your application/API).
    
  - **_RS256 (RSA (Rivest–Shamir–Adleman) Signature with SHA-256)_**
    - RS256 is asymmetric, that is, uses two different keys: the public key and the private key (that needs to be kept secret). One party (Cloudentity) signs a JWT with its private key. The other party (client application) validate the JWT with the public key of the sending party. The receiver cannot create a new JWT with the sender’s public key.
    
  - **_ECDSA (Elliptic Curve Digital Signature Algorithm)_**
    - Like RSA, ECDSA is an asymmetric encryption and digital signature algorithm. It differs from RSA in speed and the size of the key. With a smaller key, ECDSA can achieve the same security level as RSA. At the same time, ECDSA tends to be slower than RSA.

### 5. **End-to-End Encryption (E2EE)**

- End-to-end encryption ensures that data is encrypted on the client-side and only decrypted by the intended recipient server. AES is a common implementation of data level encryption and can be achieved in most programming language's encryption libraries.

### 6. **API Network Security**

 - Use an API gateway or supporting network infrastructure to enforce encryption and other security measures. AN API Gateway can be configured to handle TLS termination, request validation, and other security measures. Security policies for rate limiting, IP whitelisting/blacklisting, and request/response validation can be implemented in the Network platform infrastructure (e.g. AWS or Azure).

By employing these methods, you can significantly enhance the security of your APIs, ensuring encrypted data transfer and protection against various attack vectors.

## Web References

- [E2EE Overview](https://www.twilio.com/docs/glossary/what-is-end-to-end-encryption).
- [AWS API Gateway Documentation](https://docs.aws.amazon.com/apigateway/latest/developerguide/security.html) .
- [NIST Special Publication 800-57 Part 1 Revision 5 - Recommendation for Key Management](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-57pt1r5.pdf)
- [NIST FIPS 197 - Advanced Encryption Standard (AES)](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.197.pdf)
- [NIST SP 800-95 - Guide to Secure Web Services](https://csrc.nist.gov/publications/detail/sp/800-95/final)
- [(OWASP's) Cryptographic Storage Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html)
- [OWASP API Security Top 10](https://owasp.org/www-project-api-security/)
- [JWT Official Documentation](https://jwt.io/introduction/)
- [JWT Access Tokens](https://cloudentity.com/developers/basics/tokens/access-token/)
- [JWT.IO](https://jwt.io/)
- [Intro to JWT Tokens](https://jwt.io/introduction) 
- [RFC 7519 - JSON Web Token (JWT)](https://tools.ietf.org/html/rfc7519) 
- [OAuth2 Specification](https://datatracker.ietf.org/doc/html/rfc6749) 
- [OAuth 2.0 Mutual TLS Client Authentication and Certificate-Bound Access Tokens](https://tools.ietf.org/html/rfc8705) 
- [RFC 6749 - The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)
- [RFC 6750 - The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://tools.ietf.org/html/rfc6750)
- [RFC 8446 - The Transport Layer Security (TLS) Protocol Version 1.3](https://tools.ietf.org/html/rfc8446)
- [RFC 5246 - The Transport Layer Security (TLS) Protocol Version 1.2](https://tools.ietf.org/html/rfc5246)
- [Let's Encrypt](https://letsencrypt.org/) - free SSL/TLS certificates. 
- [Introduction to mTLS](https://developers.cloudflare.com/magic-transit/concepts/mtls/).
- [(Mozilla's) TLS Configuration Generator](https://ssl-config.mozilla.org/)

## Bibliographical References

- "Cryptography and Network Security: Principles and Practice" by William Stallings
- "API Security in Action" by Neil Madden
- "Web API Design: Crafting Interfaces that Developers Love" by Brian Mulloy

## Further info or feedback
Please email us at codex@myob.com or contact us on Slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

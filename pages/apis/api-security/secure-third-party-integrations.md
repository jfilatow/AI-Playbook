---
title: Secure Third-Party Integrations
---

![MYOB Banner](../../../assets/images/myob-banner.png)

<!-- confluence-page-id: 9582805102 -->
![](../../assets/BANNER.png)

# Secure Third-Party Integrations

Integrating third-party DLLs (Dynamic Link Libraries) into your Web API can provide additional functionality and features, but it also introduces potential security risks. It’s important to understand and mitigate these risks to ensure the security of your Web API.

# Potential Security Risks of Third-Party DLLs
 - Vulnerabilities in Third-Party Code -
Third-party DLLs may contain vulnerabilities that can be exploited by attackers. These vulnerabilities can be due to outdated libraries, poor coding practices, or undiscovered security flaws.

- Malicious Code - There's a risk that the third-party DLL might contain malicious code that can compromise the security of your application.

- Dependency Management - Dependencies might introduce indirect vulnerabilities. For example, a third-party DLL might rely on other libraries that are insecure.


# Best Practices for Securing Web APIs with Third-Party DLLs
 - Verify the Source - Ensure that the third-party DLLs are obtained from a reputable and trusted source. Verify the integrity of the downloaded libraries using checksums or digital signatures.

 - Use Well-Maintained Libraries - Prefer libraries that are actively maintained and have a good track record of responding to and patching security vulnerabilities.

 - Keep Libraries Up-to-Date - Regularly update third-party libraries to their latest versions. This includes applying security patches and updates as soon as they are available.
 
 - Implement Robust Error Handling - Ensure that your API has proper error handling to prevent leaking sensitive information through error messages.
 
 - Apply Security Testing - Regularly conduct security testing, including static code analysis, dynamic analysis, and penetration testing to uncover vulnerabilities.

## Further info or feedback
Please email us at codex@myob.com or contact us on Slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)


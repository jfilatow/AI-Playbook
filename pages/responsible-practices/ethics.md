![MYOB Banner](../../assets/images/myob-banner.png)

# Ethics for AI Tooling
---
- Section owner:  [Julian Vido] (julian.vido@myob.com) AI Safety Lead 
- Updated:  11/09/2025 
---

This guidance helps you use AI tools responsibly when implementing AI in the software development lifecycle.

## Core principles for AI tool use

### Stay accountable
You remain responsible for all outputs, even when AI tools help create them. This is important to ensure that you are aware of the limitations of AI tools and that you are not relying on them to make decisions for you. It also helps you to understand the risks of using AI tools and to be able to explain your decisions to stakeholders. It is important to note that AI tools are not perfect and you need to understand the limitations of the tools you are using. It is also important to note that AI tools are not a replacement for human judgement and you need to be able to explain your decisions to stakeholders.

**Do:**
- Review all AI-generated outputs before you commit them to code or production
- Document AI tool usage in critical systems and add comments to the code to explain how the AI tool was used
- Explain AI-assisted decisions to stakeholders 

**Don't:**
- Accept AI outputs without checking them
- Don't rely on AI when you can't explain the 'why' behind important decisions

### Prevent bias
AI tools can copy existing biases, especially from training data.

**Do:**
- Test AI-generated outputs with different scenarios and a diverse set of users (if relevant)
- Check outputs for potential bias in how they work or what they say
- Consider who might be left out by AI-assisted analysis and solutions

**Don't:**
- Assume AI outputs are neutral
- Put AI-generated algorithms into production without bias testing

### Protect data
AI tools may process information in ways that create privacy risks.

**Do:**
- Check what data AI tools collect and how they use it
- Follow best practice data handling requirements when you use AI tools
- Use privacy-protecting alternatives for personal data
- Turn on privacy settings in all tools

For information on approved AI tools and their privacy settings, see the [MYOB-approved AI tools](../appendix/MYOB-approved-tools.md)

**Don't:**
- Put sensitive or restricted data into insecure AI tools
- Use AI tools without understanding how they handle data in the context of the software development

## Decision framework

Before you use AI tools, ask:

1. Do you understand the limitations of the AI tool you are using?
2. Do you understand the data that the AI tool is using and how it is being handled?
3. Do you accept responsibility for the outputs of the AI tool?
4. Have you read the terms and conditions of the AI tool and understand the privacy settings?
5. Does this protect user data properly in the context of the software development?

If you cannot answer "yes" to all questions, consider using a different AI tool or approach.

## Things to consider

### Security and reliability
AI-generated outputs may contain security flaws or errors that look correct. Always check AI outputs through testing and reviewed.

### Intellectual property
AI tools may generate outputs based on copyrighted material. Make sure AI-assisted outputs follows open source licensing requirements and government IP policies.

### Environmental impact
AI tools use computing resources. Consider environmental costs and use AI tools in proportion to the task complexity.  See [Sustainability](sustainability.md) for more information.

### Skills and development
- Use AI tools to enhance rather than replace human expertise.
- Use AI tools to help you learn and understand the code you are writing and the data you are using.
- Use AI to enhance your skills and critical thinking rather than replace them
- Keep up to date with the latest AI tools and techniques to ensure you are using the best tools for the job

### Public trust
Be transparent about AI assistance in public-facing services. Consider how AI use affects customer confidence in MYOB products and services.
- Ensure you are transparent about the use of AI tools in your software development
- Ensure you are transparent about the limitations of the AI tools you are using
- Ensure you are transparent about the data that the AI tools are using
- Ensure you are transparent about the outputs of the AI tools
- Ensure you are transparent about the risks of using AI tools
- Ensure you are transparent about the benefits of using AI tools

## Resources

- [Understanding artificial intelligence ethics](https://www.industry.gov.au/publications/australias-artificial-intelligence-ethics-principles)
- [Australia's Artificial Intelligence Ethics Principles](https://architecture.digital.gov.au/strategy/australias-artificial-intelligence-ethics-principles)

---

**Previous:** [← Responsible Practices](README.md) | **Next:** [Sustainability →](sustainability.md)

---
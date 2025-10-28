---
title: Input Validation for API Requests
---

![MYOB Banner](../../../assets/images/myob-banner.png)
---


<!-- confluence-page-id: 9547546819 -->
![](../../assets/BANNER.png)

# Input Validation for API Requests

---

Data Input validation is important for sanitising all input data received from clients to prevent injection attacks such as SQL injection, XSS (Cross-Site Scripting), and CSRF (Cross-Site Request Forgery).

In .NET, particularly in ASP.NET Core, input validation for API controller endpoints is a crucial aspect to ensure the integrity and security of the data being processed by the application. The main reasons for the need for input validation on API controller endpoints are outlined below:

### Security

Input validation is crucial for securing web APIs because it helps prevent common vulnerabilities that could be exploited by attackers. The primary security concerns addressed by input validation include:

- **SQL Injection**: Attackers can inject malicious SQL code through input fields, manipulating the database.
- **Cross-Site Scripting (XSS)**: Malicious scripts can be injected into web pages viewed by other users, leading to data theft or session hijacking.
- **Remote Code Execution (RCE)**: Attackers can execute arbitrary code on the server by exploiting unvalidated input.
- **Denial of Service (DoS)**: Malicious input can cause the server to crash or become unavailable by consuming resources excessively.
- **Parameter Tampering**: Manipulating parameters in API requests to gain unauthorised access or modify data.

### Data Integrity

Proper input validation ensures that the data entering the system is accurate, consistent, and adheres to business rules. This prevents errors in data processing and maintains the integrity of the database.

### Compliance

Regulatory standards such as GDPR, HIPAA, and PCI-DSS often require robust input validation mechanisms to protect sensitive information and maintain compliance with legal requirements.

## Input Validation Methods and Techniques

Here are some common methods and techniques used for input validation in .NET API controllers:

### Model Validation Using Data Annotations

Data Annotations are attributes you can apply to your model classes to enforce validation rules. These attributes are defined in the `System.ComponentModel.DataAnnotations` namespace.

**Example:**

```csharp
public class UserModel
{
    [Required]
    public string Name { get; set; }

    [Range(18, 100)]
    public int Age { get; set; }

    [EmailAddress]
    public string Email { get; set; }
}
```

In this example:

- `[Required]` ensures the `Name` property is not null or empty.
- `[Range(18, 100)]` ensures the `Age` property is between 18 and 100.
- `[EmailAddress]` ensures the `Email` property has a valid email format.

When you use this model in a controller action, the framework automatically validates it before the action method is executed.

**Controller Example:**

```csharp
[HttpPost]
public IActionResult CreateUser([FromBody] UserModel user)
{
    if (!ModelState.IsValid)
    {
        return BadRequest(ModelState);
    }

    // Process the valid user
    return Ok();
}
```

## Custom Validation Attributes

You can create custom validation attributes by inheriting from `ValidationAttribute`.

**Example:**

```csharp
public class CustomAgeAttribute : ValidationAttribute
{
    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
    {
        int age = (int)value;
        if (age < 18 || age > 100)
        {
            return new ValidationResult("Age must be between 18 and 100.");
        }
        return ValidationResult.Success;
    }
}

public class UserModel
{
    public string Name { get; set; }

    [CustomAge]
    public int Age { get; set; }
}
```

### Fluent Validation

FluentValidation is a popular external library that allows for complex validation logic using a fluent API.

**Example:**

```csharp
public class UserModelValidator : AbstractValidator<UserModel>
{
    public UserModelValidator()
    {
        RuleFor(user => user.Name).NotEmpty();
        RuleFor(user => user.Age).InclusiveBetween(18, 100);
        RuleFor(user => user.Email).EmailAddress();
    }
}
```

**Usage in Startup.cs:**

```csharp
public void ConfigureServices(IServiceCollection services)
{
    services.AddControllers();
    services.AddFluentValidation(fv => fv.RegisterValidatorsFromAssemblyContaining<UserModelValidator>());
}
```

## Manual Validation in Controller

Sometimes, you might need to perform manual validation within the controller action.

**Example:**

```csharp
[HttpPost]
public IActionResult CreateUser([FromBody] UserModel user)
{
    if (string.IsNullOrEmpty(user.Name))
    {
        ModelState.AddModelError("Name", "Name is required.");
    }
    if (user.Age < 18 || user.Age > 100)
    {
        ModelState.AddModelError("Age", "Age must be between 18 and 100.");
    }
    if (!ModelState.IsValid)
    {
        return BadRequest(ModelState);
    }

    // Process the valid user
    return Ok();
}
```

### Whitelisting

Whitelisting (also known as allow-listing) involves specifying a set of acceptable inputs and rejecting anything not on the list. This is considered the most secure approach as it only allows known safe inputs.

**Example**:

```csharp
using System;
using System.Linq;

class Program
{
    static void Main()
    {
        string allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        string inputString = "userInput";

        if (inputString.All(char => allowedCharacters.Contains(char)))
        {
            Console.WriteLine("Valid input");
        }
        else
        {
            Console.WriteLine("Invalid input");
        }
    }
}
```

### Blacklisting

Blacklisting (or deny-listing) involves specifying a set of unacceptable inputs and rejecting anything that matches the list. While easier to implement, it is less secure because it may not cover all possible malicious inputs.

**Example**:

```csharp
using System;
using System.Collections.Generic;

public class Program
{
    public static void Main()
    {
        List<string> blacklistedPatterns = new List<string> { "<script>", "--", "' OR '1'='1" };
        string inputString = "userInput";

        bool isInvalid = false;
        foreach (string pattern in blacklistedPatterns)
        {
            if (inputString.Contains(pattern))
            {
                isInvalid = true;
                break;
            }
        }

        if (isInvalid)
        {
            Console.WriteLine("Invalid input");
        }
        else
        {
            Console.WriteLine("Valid input");
        }
    }
}
```

### Regular Expressions

Using regular expressions to define complex validation rules for strings, such as email addresses, phone numbers, or usernames.

**Example**:

```csharp
using System;
using System.Text.RegularExpressions;

class Program
{
    static void Main()
    {
        string email = "example@example.com";
        ValidateEmail(email);
    }

    static void ValidateEmail(string email)
    {
        string pattern = @"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
        if (Regex.IsMatch(email, pattern))
        {
            Console.WriteLine("Valid email");
        }
        else
        {
            Console.WriteLine("Invalid email");
        }
    }
}
```

### Encoding and Escaping

Encoding and escaping user inputs ensure that special characters are treated as literal strings rather than executable code. This is especially useful in preventing XSS and SQL injection attacks.

**Example**:

```csharp
using System.Web;

public class HtmlEscape
{
    public static string EscapeHtml(string inputString)
    {
        return HttpUtility.HtmlEncode(inputString);
    }
}
```

### Cross-Site Request Forgery (CSRF) Tokens

Using CSRF tokens to validate requests ensures that they originate from authorised sources, preventing unauthorised actions.

**Example**:

```csharp
using Microsoft.AspNetCore.Http;
using System;

public class CsrfTokenHelper
{
    private readonly IHttpContextAccessor _httpContextAccessor;

    public CsrfTokenHelper(IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
    }

    public string GenerateCsrfToken()
    {
        var session = _httpContextAccessor.HttpContext.Session;
        if (session.GetString("_csrf_token") == null)
        {
            var token = SomeRandomString();
            session.SetString("_csrf_token", token);
        }
        return session.GetString("_csrf_token");
    }

    public bool ValidateCsrfToken(string token)
    {
        var session = _httpContextAccessor.HttpContext.Session;
        return token == session.GetString("_csrf_token");
    }

    private string SomeRandomString()
    {
        // Replace this with actual random string generation logic
        return Guid.NewGuid().ToString("N");
    }
}
```

To use `IHttpContextAccessor`, you need to register it in the `Startup.cs` file in the `ConfigureServices` method:

```csharp
public void ConfigureServices(IServiceCollection services)
{
    services.AddHttpContextAccessor();
    services.AddSession();
    // Other services
}
```

Also, ensure you have session middleware configured in the `Configure` method:

```csharp
public void Configure(IApplicationBuilder app, IHostingEnvironment env)
{
    app.UseSession();
    // Other middleware
}
```

By incorporating these input validation methods, web APIs can be secured against a variety of threats, ensuring data integrity, compliance, and overall application security. Therefore reducing the risk of errors and potential security vulnerabilities.

## References

### Web References

- [OWASP Input Validation Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html)
- [OWASP SQL Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)
- [MDN Web Docs - Security](https://developer.mozilla.org/en-US/docs/Web/Security)
- [NIST Special Publication 800-95](https://csrc.nist.gov/publications/detail/sp/800-95/final)
- [Microsoft Documentation on Model Validation](https://learn.microsoft.com/en-us/aspnet/core/mvc/models/validation?view=aspnetcore-5.0)
- [FluentValidation Official Site](https://fluentvalidation.net/)
- [Data Annotations in .NET](https://learn.microsoft.com/en-us/dotnet/api/system.componentmodel.dataannotations?view=net-5.0)
- [Creating Custom Validation Attributes](https://learn.microsoft.com/en-us/aspnet/core/mvc/models/validation?view=aspnetcore-5.0#custom-attributes)

### Bibliographical References

- **"The Web Application Hacker's Handbook"** by Dafydd Stuttard and Marcus Pinto: A comprehensive guide to web application security, covering common vulnerabilities and defensive techniques.
- **"OWASP Top 10 - 2021"**: A document published by the Open Web Application Security Project detailing the top ten most critical web application security risks.
- **"Pro ASP.NET Core 3"** by Adam Freeman - This book provides comprehensive coverage of ASP.NET Core, including validation techniques.
- **"ASP.NET Core in Action"** by Andrew Lock - A detailed guide to ASP.NET Core, including input validation.

## Further info or feedback

Please email us at <codex@myob.com> or contact us on Slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

# Documentation Template

|System Name|Your System|
|:---|:---|
|Owning Division|EX|
|Owning Nation|Operations & Architecture|
|Owning Tribe|Platform Engineering|
|Owning Crew|Sentinel|
|Owning Person|John "Template" Smith |
|Contactable Slack Channel|#ex-security|
|Contactable email address|John.Smith@myob.com|


## Overview 
Describe the system in a terse paragraph, including a brief description of what it does. 

Present or link to a component diagram of the pieces that make up the system, identifying deployable components and any external interactions. 

Use a common set of terms and language to describe what it is using the 'c4 model' 

## Owner 
Details should be updated in the table above.

These should not  be individual contact details but a long lived email group or public team channel. It is important to keep these up to date, especially after initial development. During handover always check back to ensure the new owner/maintainer contact details are correct. 

## Source code 
Provide links to all source code repos. 

## Documentation 
Provide links to any documentation, including developer documentation. 

## Deployments 
Identify different environments and for each environment list: 

|Environment|Relevant URLs|Logging Aggregates|Monitoring|Alerting|
|:---|:---|:---|:---|:---|

## Integrated Systems
Identify different environments and for each environment list: 

|Environment|Integration Descriptions| Integrate with| Integration Contract| Data|
|:---|:---|:---|:---|:---|
|Production System|	Production System uses IDS for customer authentication|Link to IDS Documentation|IDS promises 99% uptime. We've registered to get updates from IDS in the case of outages.|Authentication Tokens, Session IDs etc|

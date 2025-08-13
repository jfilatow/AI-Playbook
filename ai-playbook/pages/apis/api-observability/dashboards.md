---
title: Dashboards in API Observability
---
<!-- confluence-page-id: 9312600084 -->
![](../../assets/BANNER.png)

# Dashboards in API Observability

## Dashboards

Dashboards often fall into one of three categories or types;

- **Operational dashboards** – these dashboards help the user see API state now (or at least in the last 15 minutes)

- **Analytical dashboards** – these dashboards give the user a clear view of performance trends and potential problems in a system.

- **Strategic dashboards** – this type of dashboard lets Teams track higher level goals e.g. OKRs.

Most Teams will use the Operational and Analytical type of dashboards. Strategic dashboards are used more for Team leads and Managers wanting an over all view of how systems are tracking against standards.

There are a few guidelines for designing Metric dashboards. Generally the goals should be;

- Clear visualisation of data.

- Easy filtering and refining of the data set (for most useful views)

- The use of standard views for displaying metrics.

- Be clear about what you're trying to achieve – your board’s purpose will inform its design.

- Only include what's relevant to the board's purpose - Anything that is only supportive or peripherally important can go on another board.

- Miller’s Law - The average person can only keep 7 (plus or minus 2) items in their working memory - remember this for panels/metrics.

- Use views or filters over the same data to keep the information specific and not overwhelming.

- Use the most efficient visualisation for a given metric (more about this in Visualising Metrics).

- Group related metrics.

- Use size and position to show importance. i.e. Large metrics or elements indicate importance, Panels that are displayed first are the used most.

- Reduce visual noise. E.g. If you can show only a line on a graph, essential labels (minimal data on axes) and maybe data when "hovering over" this allows the view to remain uncluttered and metrics and trends to be seen clearly.

### Visualising Metrics On Dashboards

When visualising metrics it is always important to choose the visualisation that most clearly communicates the data. To this end certain visualisations are better for certain types of data.
Some uses for data visualisations are shown below;

- **Line Chart**: Used to show trends over time or sequential data.
  - It is ideal for visualising data over time.

- **Bar Chart**: Suitable for comparing categories or discrete data points.
  - Bar charts are effective for comparing data by category, e.g. HTTP Errors per Application stack.

- **Pie Chart**: Useful for illustrating proportions or percentages of a whole.
  - Pie charts are commonly used to represent ratios, e.g. percentages of error types on an application stack.

- **Scatter Plot**: Helps visualise the relationship between two variables.
  - It is valuable for displaying correlations, identifying clusters, or detecting outliers in data points.

- **Histogram**: Displays the distribution of numerical data.
  - Histograms are beneficial for understanding data frequency.

- **Heatmap**: Shows data density and patterns in a two-dimensional grid.
  - Heatmaps are often used for visualising website traffic.

- **Gantt Chart**: Utilised for project management and scheduling.
  - Gantt charts illustrate tasks, their start and end dates, and dependencies, making it easy to track progress and timelines.

- **Tree Map**: Ideal for hierarchical or nested data.
  - Tree maps can represent file sizes on a disk, or the organisation of a directory structure.

- **Network Graph**: Displays relationships between entities.
  - Network graphs are useful for visualising infrastructure connections.

- **Choropleth Map**: Presents data using color-coded regions (e.g., countries, states).
  - Choropleth maps are commonly used to represent demographic data or geographic statistics.

- **Bullet Graph**: Bullet graphs are great for tracking progress towards goals or targets.
  - They can display actual versus target values for key performance indicators (or OKRs).

- **Gauge Chart**: Gauge charts are effective for displaying single-value metrics in relation to a predefined range or threshold.

Please see the Page - [Observability Metrics](./metrics.md) for further information on the types of Metrics observed.

---

## References and Links

- [GeckoBoard - Dashboard Design](https://www.geckoboard.com/best-practice/dashboard-design/)
- [Just in Mind Dashboard Design](https://www.justinmind.com/ui-design/dashboard-design-best-practices-ux)
- [Top 10 Principles of Dashboards Design 2023](https://realmonkey.co/web-design/principles-of-effective-dashboard-design)
- [Millers Law](https://www.cobeisfresh.com/blog/managing-information-overload-in-ux-design-millers-law)
- [ChatGPT](https://chat.openai.com/)
- [Useful API Errors](https://blog.hubspot.com/website/api-errors)
- [Distributed Tracing](https://myobconfluence.atlassian.net/wiki/spaces/OD1/pages/9586507789/Traces)

---

## Further info or feedback

Please email us at <codex@myob.com> or contact us on slack: [#sig-tech-codex](https://myob.slack.com/archives/C02N8ADPGUX)

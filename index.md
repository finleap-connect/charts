---
layout: default
---

# Getting Started

{{ site.description }}

You can add this repository to your local helm configuration as follows:

```console
helm repo add {{ site.repo_name }} {{ site.url }}
helm repo update
```

## Charts

{% for helm_chart in site.data.index.entries %}
{% assign title = helm_chart[0] %}
{% assign all_charts = helm_chart[1] | sort: 'created' | reverse %}
{% assign latest_chart = all_charts[0] %}

### [{{ title }}](#{{title}})

{% if latest_chart.icon %}
  <img src="{{ latest_chart.icon }}" style="height:1.2em;vertical-align: text-top;" />
{% endif %}
  
{{ latest_chart.description }}

[Home]({{ latest_chart.home }}) \| [Source]({{ latest_chart.sources[0] }})

```console
helm install {{ site.repo_name }}/{{ latest_chart.name }} --name myrelease --version {{ latest_chart.version }}
```

| Chart Version | App Version | Date |
|---------------|-------------|------|
{% for chart in all_charts -%}
{% unless chart.version contains "-" -%}
| [{{ chart.name }}-{{ chart.version }}]({{ chart.urls[0] }}) | {{ chart.appVersion }} | {{ chart.created | date_to_rfc822 }} |
{% endunless -%}
{% endfor -%}

{% endfor %}

---
layout: base
---
# Work in progress

{% for draft in collections.draft -%}
<div>
  <h1>
    <a href="{{ draft.url }}">
      {{ draft.data.title }}
    </a>
  </h1>
  {{ draft.templateContent | truncateHtml: draft.data.summaryLength }}
  <a href="{{ draft.url }}">Read More</a>
</div>
{%- endfor %}
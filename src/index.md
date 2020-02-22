---
layout: base
pagination:
  data: collections.homepage
  size: 3
  alias: posts
---
# Recent

{% for post in posts -%}
<section class="section">
  <div>
    {%- include title.html with data: post.data -%}
    {{ post.templateContent | truncateHtml: post.data.summaryLength }}
    <a href="{{ post.url }}">Read More</a>
  </div>
</section>

{%- endfor -%}
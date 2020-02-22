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
  <div class="container">
    <div class="is-pulled-right has-text-right">
        <div>{{- post.data.date | date: "%Y-%m-%d" -}}</div>
        <div>
          {%- for tag in post.data.tags -%}
            <span class="tag is-black">{{- tag -}}</span>
          {%- endfor -%}
        </div>
    </div>
    <h1>
      <a href="{{ post.url }}">{{- post.data.title -}}</a>
    </h1>
    {{ post.templateContent | truncateHtml: post.data.summaryLength }}
    <a href="{{ post.url }}">Read More</a>
  </div>
</section>

{%- endfor -%}
---
layout: base
tags:
title: My Rad Markdown Blog Post
date: 2016-01-01
pagination:
  data: testdata
  size: 2
testdata:
 - item1
 - item2
 - item3
 - item4
 - item5
 - item6
---
# {{ title }}

Foo bar baz

{%- for item in pagination.items %}
  - {{ item }}
{% endfor -%}
{{ pagination }}

{% if pagination.previous -%}
[previous]({{ pagination.previous }})
{%- endif %} {% if pagination.next -%}
[next]({{ pagination.next }})
{%- endif %}
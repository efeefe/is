---
title: Concepts
jscomments:
    active: false
show_sidebar: false
published: true
visible: false
menu: Concepts
content:
    items:
        - '@self.children'
    limit: 20
    order:
        by: default
        dir: asc
    pagination: true
    url_taxonomy_filters: true
feed:
    limit: 10
---

{% set default_collection = page.collection %}

<div class="columns">

{% for p in page.collection %}
  <div class="card" style="width:420px; margin:10px;">
  {% if image %}
  <div class="card-image">
      <a href="{{ page.url }}">{{ image.cropZoom(800,400).html|raw }}</a>
  </div>
  {% endif %}
      <div class="card-body">
      <a href="{{ page.url }}"><h4 class="card-title">{{ p.title }}</h4></a>
      <p class="card-text">{{ p.summary }}</p>
      <a href="#" class="btn btn-primary">Read more</a>
    </div>
  </div>
{% endfor %}

</div>

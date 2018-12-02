{% extends "./layout.tpl" %}

{% block title %}{{ title }}{% endblock %}

{% block head %}
    <link rel="stylesheet" href="/stylesheets/index.css">
{% endblock %}

{% block content %}
  <h1>{{ model.content }}</h1>
{% endblock %}

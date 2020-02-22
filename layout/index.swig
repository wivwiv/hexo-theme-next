{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ title }}{% if theme.index_with_subtitle and subtitle %} – {{ subtitle }}{% endif %}{% endblock %}

{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}

{% block content %}
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}
      {% if post.visible !== false and not post.not_in_home %}
      {{ post_template.render(post, true) }}
      {% endif %}

      {% if loop.index === 2 or loop.index === 8 %}
        <article class="post post-type-normal post-ad">
          <div class="post-block">
            <ins class="adsbygoogle"
              style="display:block"
              data-ad-format="fluid"
              data-ad-layout-key="-hh-7+2h-1m-4u"
              data-ad-client="ca-pub-3312623505166629"
              data-ad-slot="7307339641"></ins>
            <script>
              (adsbygoogle = window.adsbygoogle || []).push({});
            </script>
            <footer class="post-footer"></footer>
          </div>
        </article>
      {% endif %}
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}

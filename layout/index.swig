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
      {% if post.visible !== false %}
      {{ post_template.render(post, true) }}
      {% endif %}

      {% if loop.index === 2 %}
        <article class="post post-type-normal post-ad">
          <div class="post-block">
            <ins class="adsbygoogle"
              style="display:block"
              data-ad-format="fluid"
              data-ad-layout-key="-i2-7+2w-11-86"
              data-ad-client="ca-pub-3312623505166629"
              data-ad-slot="7307339641">
            </ins>

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

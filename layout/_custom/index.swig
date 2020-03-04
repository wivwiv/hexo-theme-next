<div id="my-header">
  <!-- 首页顶部信息 -->
  {% if is_home() %}
      {% set colors_ = [
          "rgb(17, 17, 17)",
          "rgb(58, 63, 81)",
          "rgb(35, 183, 229)",
          "rgb(39, 194, 76)",
          "rgb(114, 102, 186)",
          "rgb(35, 183, 229)",
          "rgb(240, 80, 80)",
          "rgb(250, 215, 51)"
      ];
      %}
      {% set tags_ = site.tags %}
    <div class="site-tag">
      <a href="/tags" rel="tag" style="background-color: {{ colors_[0] }}">+ 全部</a>
      {% for tag in tags_ %}
        {% if tag.length >= 2 %}
          <a 
            href="{{ url_for(tag.path) }}"
            style="background-color: {{ colors_[loop.index % 8] }}"
            rel="tag" 
            title="共计{{tag.length}}篇"># {{ tag.name }}</a>
        {% endif %}
      {% endfor %}
    </div>
  {% endif -%}
</div>

<style>
#my-header {
  margin: 20px auto;
}
@media (max-width: 767px) {
  #my-header {
    margin: 20px;
  }
}
.site-tag {
  margin: 28px auto 24px auto;
}
.site-tag a {
    border-radius: 5px;
    background-color: #fff;
    border: none;
    padding: 3px 6px;
    display: inline-block;
    margin: 0 5px 5px 0;
    font-size: 12px !important;
    transition: all .2s;
    color: #fff;
    border: 1px solid rgba(237,241,242,.6);
}
.site-tag a:hover {
  // box-shadow: 0 8px 16px 0 rgba(0,0,0,.2), 0 6px 20px 0 rgba(0,0,0,.19);
  transform: translateY(-1px);
  background-color: #e1e1e1;
}

</style>
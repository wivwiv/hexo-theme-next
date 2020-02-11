<div id="my-header">
  <!-- 首页顶部信息 -->
  {% if is_home() %}
      {% set colors_ = ["rgb(156, 148, 105)", "rgb(136, 148, 127)", "rgb(192, 148, 98)", 
      "rgb(164, 154, 81)", "rgb(152, 104, 121)", "rgb(153, 158, 87)", "rgb(170, 106, 115)",
      "rgb(133, 124, 101)", "rgb(145, 168, 153)"
      ] %}
    <div class="site-tag">
      {% for tag in site.tags %}
        {% if tag.length >= 2 %}
          <a 
            href="{{ url_for(tag.path) }}"
            style="background-color: {{ colors_[loop.index % 9] }}"
            rel="tag" 
            title="共计{{tag.length}}篇"># {{ tag.name }}</a>
        {% endif %}
      {% endfor %}
      <a href="/tags" rel="tag" style="background-color: {{ colors_[0] }}">+ 全部</a>
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
    padding: 4px 8px;
    display: inline-block;
    margin: 0 5px 5px 0;
    font-size: 12px !important;
    transition: all .2s;
    color: #fff;
}
.site-tag a:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,.2), 0 6px 20px 0 rgba(0,0,0,.19);
  transform: translateY(-1px);
  background-color: #e1e1e1;
}

</style>
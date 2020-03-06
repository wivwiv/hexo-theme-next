{% if page.comments %}

  <!-- top-comment-728x90 -->
  <div class="top-comment-ad desktop">
    <ins class="adsbygoogle"
      style="display:inline-block;width:728px;height:80px"
      data-ad-client="ca-pub-3312623505166629"
      data-ad-slot="4810837113"></ins>
  </div>
  <script>
      (adsbygoogle = window.adsbygoogle || []).push({});
  </script>

  <!-- top-comment-320x250 
  <div class="top-comment-ad mobile">
    <ins class="adsbygoogle"
        style="display:inline-block;width:320px;height:250px"
        data-ad-client="ca-pub-3312623505166629"
        data-ad-slot="3144499240"></ins>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>
  </div>
  -->
  

  {% if theme.facebook_sdk.enable and theme.facebook_comments_plugin.enable %}
    <div class="comments" id="comments">
      <div class="fb-comments"
           data-href="{{ page.permalink }}"
           data-numposts="{{ theme.facebook_comments_plugin.num_of_posts }}"
           data-width="{{ theme.facebook_comments_plugin.width }}"
           data-colorscheme="{{ theme.facebook_comments_plugin.scheme }}">
      </div>
    </div>

  {% elif theme.vkontakte_api.enable and theme.vkontakte_api.comments %}
    <div class="comments" id="comments">
      <div id="vk_comments"></div>
    </div>

  {% elif theme.disqus.enable %}
    <div class="comments" id="comments">
      <div id="disqus_thread">
        <noscript>{#
        #}Please enable JavaScript to view the comments powered by Disqus.{#
      #}</noscript>
      </div>
    </div>

  {% elif theme.livere_uid %}
    <div class="comments" id="comments">
      <div id="lv-container" data-id="city" data-uid="{{ theme.livere_uid }}"></div>
    </div>

  {% elif theme.changyan.enable and theme.changyan.appid and theme.changyan.appkey %}
    <div class="comments" id="comments">
      <div id="SOHUCS"></div>
    </div>

  {% elif theme.gitment.enable %}
    <div class="comments" id="comments">
      {% if theme.gitment.lazy %}
        <div onclick="showGitment()" id="gitment-display-button">{{ __('gitmentbutton') }}</div>
        <div id="gitment-container" style="display: none"></div>
      {% else %}
        <div id="gitment-container"></div>
      {% endif %}
    </div>

  {% elif theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
    <div class="comments" id="comments">
    </div>

  {% elif theme.gitalk.enable %}
    <div class="comments" id="gitalk-container">
    </div>

  {% endif %}
{% endif %}

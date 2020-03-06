<div class="copyright">{#
#}{% set current = date(Date.now(), "YYYY") %}{#
#}{% if theme.footer.beian.enable %}{#
#}  {{ next_url('http://www.miitbeian.gov.cn', theme.footer.beian.icp + ' ') }}{#
#}{% endif %}{#
#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} – {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love" id="animate">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || author }}</span>

  {% if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.count_total') + __('symbol.colon') }}</span>
    {% endif %}
    <span title="{{ __('symbols_count_time.count_total') }}">{#
    #}{{ symbolsCountTotal(site) }}{#
  #}</span>
  {% endif %}

  {% if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.time_total')}} &asymp;</span>
    {% endif %}
    <span title="{{ __('symbols_count_time.time_total') }}">{#
    #}{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}{#
  #}</span>
  {% endif %}
</div>

{% if theme.footer.powered.enable %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', next_url('https://hexo.io', 'Hexo', {class: 'theme-link'})) }}{#
  #}{% if theme.footer.powered.version %} v{{ hexo_env('version') }}{% endif %}{#
 #}</div>
{% endif %}

{% if theme.footer.powered.enable and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{% endif %}

{% if theme.footer.theme.enable %}
  <div class="theme-info">{#
  #}{{ __('footer.theme') }} – {{ next_url('https://theme-next.org', 'NexT.' + theme.scheme, {class: 'theme-link'}) }}{#
  #}{% if theme.footer.theme.version %} v{{ version }}{% endif %}{#
#}</div>
{% endif %}

{% if theme.links %}
  <div class="theme-info">
    友情链接：
    {% for blogrollText, blogrollURL in theme.links %}
      {{ next_url(blogrollURL.split('||')[0], blogrollText, {title: blogrollURL.split('||')[1], class: 'theme-link' }) }}
    {% endfor %}
  </div>
{% endif %}

{% if theme.footer.custom_text %}
  <div class="footer-custom">{#
  #}{{ theme.footer.custom_text }}{#
#}</div>
{% endif %}


<!-- Google Adsense -->
<script data-ad-client="ca-pub-3312623505166629" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

<script src="https://ip.ws.126.net/ipquery"></script>
<script>
if (location.hostname !== 'localhost') {
  var _log_ajax = fetch || $.get
  if (_log_ajax) {
    _log_ajax('https://log.bigpar.cn/log/http_request_log?spm=blog&key=' + document.title)
  }
  (function() {
    var hm = document.createElement("script");
    hm.src = "https://s4.cnzz.com/z_stat.php?id=1278634326&web_id=1278634326";
    document.body.appendChild(hm)
  })();

  function __send__(title, content) {
    var f = fetch
    var url = 'https://sc.ftqq.com/SCU87479T1204c04bf8a10cee3be0cf223aa82dd15e5cf8d0783f8.send?text=' + title + '&desp=' + content
    console.log(url)
    f(url)
    localStorage.setItem('__user__meta__', Date.now())
  }

  function __getOperationSys() {
    var OS = '';
    var OSArray = {};
    var UserAgent = navigator.userAgent.toLowerCase();
    OSArray.Windows = (navigator.platform == 'Win32') || (navigator.platform == 'Windows');
    OSArray.Mac = (navigator.platform == 'Mac68K') || (navigator.platform == 'MacPPC')
      || (navigator.platform == 'Macintosh') || (navigator.platform == 'MacIntel');
    OSArray.iphone = UserAgent.indexOf('iPhone') > -1;
    OSArray.ipod = UserAgent.indexOf('iPod') > -1;
    OSArray.ipad = UserAgent.indexOf('iPad') > -1;
    OSArray.Android = UserAgent.indexOf('Android') > -1;
    for (var i in OSArray) {
      if (OSArray[i]) {
        OS = i;
      }
    }
    return OS;
  }
  var __user__meta__ = localStorage.getItem('__user__meta__')
  var __user_type = '新用户'
  if (__user__meta__) {
    try {
      var ts = parseInt(__user__meta__, 10)
      // 老用户
      if (Date.now() - ts > 1 * 86400 * 1000) {
        __user_type = '回访'
      } else {
        __user_type = '老用户'
      }
    } catch(e) {

    }
  } 
  
  if (__user_type !== '老用户') {
    var referrer = document.referrer
    var user_from = '直接访问'

    if (referrer) {
      var url = new URL(referrer)
      user_from = url.hostname.split('.').slice(-2).join('.')
    }
    var title = __user_type + '_' + user_from + '_' + document.title.slice(0, 120)
    var sc = window.screen
    var content = '\n - 操作系统: ' + __getOperationSys() + '\n - 分辨率: ' + sc.width + 'x' + sc.height + '\n - 标题: ' + document.title + '\n - 来源: ' + document.referrer + '\n - 地址: ' + lo + lc
    + '\n - url: ' + location.href + '\n - 时间: ' + new Date().toLocaleDateString() + ' ' + new Date().toLocaleTimeString()
    __send__(encodeURI(title), encodeURI(content))
  }
}

</script>
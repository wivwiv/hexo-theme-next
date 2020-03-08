function send_message() {
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
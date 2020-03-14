(function () {
  if (!location.pathname.includes('/post')) {
    return
  }
  // 获取用户 ID
  var USER_ID_KEY = '__blog__user_id__'
  var userId = localStorage.getItem(USER_ID_KEY);
  var url = 'https://log.bigpar.cn/api'

  if (!userId) {
    userId = Date.now()
    localStorage.setItem(USER_ID_KEY, userId)
  }

  var pathname = location.pathname

  // 获取文章点赞
  function getUp() {
    axios.get('/up-down', {
      params: {
        pathname,
        title: document.title,
        userId: userId,
      },
      baseURL: url,
    }).then(function(resp) {
      var data = resp.data
      setValue(data.up, 'up')
      setValue(data.down, 'down')
      var isUp = data.isUp
      // 点赞
      if (isUp === 1) {
        setActive('up')
      } else if (isUp === 0) { // 踩了
        setActive('down')
      }
    }).catch(function (e) {
      console.log(e)
    })
  }

  function setActive(target = 'up') {
    var fTarget = target === 'up' ? 'down' : 'up'
    var el = $('#up_down .' + target)
    var fEl = $('#up_down .' + fTarget)
    el.addClass('active')
    fEl.removeClass('active')
  }

  getUp()

  function setCount(isUp = 1) {
    axios.post('/up-down', {
      isUp,
      userId,
      pathname,
    }, {
      baseURL: url,
    }).then(getUp).catch(getUp)
  }

  // 点赞
  $('#up_down .up').click(function () {
    var el = $(this)
    // 已经点赞
    if (el.hasClass('active')) {
      return
    }
    setCount(1)
  })


  // 踩
  $('#up_down .down').click(function () {
    var el = $(this)
    // 已经踩了
    if (el.hasClass('active')) {
      return
    }
    setCount(0)
  })

  function setValue(val, target) {
    val = val || 0
    target = target || 'up' // down
    var el = $('#up_down .' + target)
    var fEl = $('#up_down .' + target === 'up' ? 'down' : 'up')
    var valEl = $('#up_down .' + target + '_val')
    if (valEl) {
      valEl.text(val)
    } else {
      console.log('up_down element not exists')
    }
  }
})()
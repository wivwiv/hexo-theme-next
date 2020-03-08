(function() {
  if (!location.pathname.includes('/post')) {
    return
  }
  // 获取用户 ID
  var USER_ID_KEY = '__blog__user_id__'
  var userId =  localStorage.getItem(USER_ID_KEY);

  if (!userId) {
    userId = Date.now()
    localStorage.setItem(USER_ID_KEY, userId)
  }

  var pathname = location.pathname
  var objectId = ''
  
  // 获取文章点赞
  var query = new AV.Query('UpDownPost');
  var userQuery = new AV.Query('UpDownPostUser')
  userQuery.equalTo('pathname', pathname)
  userQuery.equalTo('userId', userId)
  query.equalTo('pathname', pathname)

  var up = 0
  var down = 0
  query.first().then(function (res) {
    objectId = res.id;
    up  = res.get('up');
    down = res.get('down');
    // 获取内置属性
    setValue(up, 'up')
    setValue(down, 'down')

    userQuery.first().then(function(res) {
      if (res.get('isUp')) {
        $('#up_down .up').addClass('active')
      } else {
        $('#up_down .down').addClass('active')
      }
    })
  }).catch(function () {
    var Todo = AV.Object.extend('UpDownPost');
    // 构建对象
    var todo = new Todo();

    // 为属性赋值
    todo.set('title', document.title);
    todo.set('up', 0);
    todo.set('down', 0);
    todo.set('pathname', pathname);
    // 将对象保存到云端
    todo.save()
  });

  // 点赞
  $('#up_down .up').click(function() {
    var el = $(this)
    // 已经点赞
    if (el.hasClass('active')) {
      return
    }
    // 开始点赞
    var todo = AV.Object.createWithoutData('UpDownPost', objectId);
    todo.increment('up', 1);
    todo.save().then(function() {
      // 给自己设置值
      setFlag(userId, pathname, true).then(function() {
        el.addClass('active')
        setValue(up + 1, 'up')
        $('#up_down .down').removeClass('active')
      })
    });
  })


  // 踩
  $('#up_down .down').click(function() {
    var el = $(this)
    // 已经踩了
    if (el.hasClass('active')) {
      return
    }
    // 开始点赞
    var todo = AV.Object.createWithoutData('UpDownPost', objectId);
    todo.increment('down', 1);
    todo.save().then(function() {
      // 给自己设置值
      setFlag(userId, pathname, true).then(function() {
        el.addClass('active')
        setValue(up + 1, 'down')
        $('#up_down .up').removeClass('active')
      })
    });
  })

  function setFlag(userId, pathname, isUp) {
    isUp = isUp || false
    // 查询
    return userQuery.first().then(function(res) {
      var id = res.get('objectId')
      var isUpData = res.get('isUp')
      // 当前值一样
      if (isUpData == isUp) {
        return
      }
      var todo = AV.Object.createWithoutData('UpDownPostUser', id);
      todo.set('isUp', !isUp)
      return todo.save()
    }).catch(function(e) {
      var Todo = AV.Object.extend('UpDownPostUser');
      // 构建对象
      var todo = new Todo();
      todo.set('pathname', pathname);
      todo.set('userId', userId);
      todo.set('title', document.title);
      todo.set('isUp', isUp || false);
      return todo.save();
    })
  }

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
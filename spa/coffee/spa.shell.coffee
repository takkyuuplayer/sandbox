'use strict'

spa.shell = do ->
  configMap =
    main_html: '
      <div class="spa-shell-head">
        <div class="spa-shell-head-logo"></div>
        <div class="spa-shell-head-acct"></div>
        <div class="spa-shell-head-search"></div>
      </div>
      <div class="spa-shell-main">
        <div class="spa-shell-main-nav"></div>
        <div class="spa-shell-main-content"></div>
      </div>
      <div class="spa-shell-foot"></div>
      <div class="spa-shell-chat"></div>
      <div class="spa-shell-modal"></div>
    '
    chat_extend_time: 1000
    chat_retract_time: 300
    chat_extend_height: 450
    chat_retract_height: 15
    chat_extended_title: 'Click to retract'
    chat_retracted_title: 'Click to extend'
  stateMap =
    $container: null
    is_chat_retracted: true

  jqueryMap = {}

  setJqueryMap = ->
    $container = stateMap.$container
    jqueryMap =
      $container: $container
      $chat: $container.find '.spa-shell-chat'

  toggleChat = (do_extend, callback) ->
    px_chat_ht = jqueryMap.$chat.height()
    is_open = px_chat_ht is configMap.chat_extend_height
    is_closed = px_chat_ht is configMap.chat_retract_height
    is_sliding = not (is_open or is_closed)

    if is_sliding
      return false

    if do_extend
      jqueryMap.$chat.animate(
        height: configMap.chat_extend_height
        ,configMap.chat_extend_time
        , ->
          jqueryMap.$chat.attr 'title', configMap.chat_extend_title
          stateMap.is_chat_retracted = false
          callback(jqueryMap.$chat) if callback
        )
      return true

    jqueryMap.$chat.animate(
      height: configMap.chat_retract_height
      ,configMap.chat_retract_time
      , ->
        jqueryMap.$chat.attr 'title', configMap.chat_retracted_title
        stateMap.is_chat_retracted = true
        callback(jqueryMap.$chat) if callback
      )

    true

  onClickChat = (event) ->
    toggleChat stateMap.is_chat_retracted
    false

  initModule = ($container) ->
    stateMap.$container = $container
    $container.html configMap.main_html
    setJqueryMap()

    stateMap.is_chat_retracted = true
    jqueryMap.$chat
      .attr 'title', configMap.chat_retracted_title
      .click onClickChat

  return initModule: initModule

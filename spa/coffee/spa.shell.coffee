'use strict'

spa.shell = do ->
  configMap =
    anchor_schema_map:
      chat:
        open: true
        closed: true
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
    anchor_map: {}

  copyAnchorMap = ->
    $.extend true, {}, stateMap.anchor_schema_map

  changeAnchorPart = (arg_map) ->
    anchor_map_revise = copyAnchorMap()
    bool_return = true


    `KEYVAL://`
    for key_name of arg_map
      continue if not arg_map.hasOwnProperty key_name

      `continue KEYVAL` if key_name.indexOf('_') is 0

      anchor_map_revise[key_name] = arg_map[key_name]

      key_name_dep = "_#{key_name}"
      if arg_map[key_name_dep]
        anchor_map_revise[key_name_dep] = arg_map[key_name_dep]
      else
        delete anchor_map_revise[key_name_dep]
        delete anchor_map_revise["_s#{key_name_dep}"]

    try
      $.uriAnchor.setAnchor anchor_map_revise
    catch error
      $.uriAnchor.setAnchor stateMap.anchor_map, null, true
      bool_return = false

    return bool_return

  onHashchange= (event) ->
    anchor_map_previous = copyAnchorMap()
    try
      anchor_map_proposed = $.uriAnchor.makeAnchorMap()
    catch error
      $.uriAnchor.setAnchor anchor_map_previous, null, true
      return false

    stateMap.anchor_map = anchor_map_proposed

    _s_chat_previous = anchor_map_previous._s_chat
    _s_chat_proposed = anchor_map_proposed._s_chat

    if (not anchor_map_previous) or (_s_chat_previous isnt _s_chat_proposed)
      s_chat_proposed = anchor_map_proposed.chat
      switch s_chat_proposed
        when 'open'
          toggleChat true
        when 'closed'
          toggleChat false
        else
          toggleChat false
          delete anchor_map_proposed.chat
          $.uriAnchor.setAnchor anchor_map_proposed, null, true

    false

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
    changeAnchorPart(
      chat: (if stateMap.is_chat_retracted then 'open' else 'closed')
    )
    false

  initModule = ($container) ->
    stateMap.$container = $container
    $container.html configMap.main_html
    setJqueryMap()

    stateMap.is_chat_retracted = true
    jqueryMap.$chat
      .attr 'title', configMap.chat_retracted_title
      .click onClickChat

    $.uriAnchor.configModule(
      schema_map: configMap.anchor_schema_map
    )
    $(window).on 'hashchange', onHashchange
      .trigger 'hashchange'

  return initModule: initModule

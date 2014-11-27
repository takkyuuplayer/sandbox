'use strict'

chat = do ->
  configMap =
    main_html: '
      <div style="padding:1em; color:#fff">
        Say hello to chat
      </div>
    '
    settable_map: {}
  stateMap = {}
  jqueryMap = {}

  setJqueryMap = ->
    $container = stateMap.$container
    jqueryMap =
      $container: $container

  configModule = (input_map) ->
    spa.util.setCnofigMap
      input_map: input_map
      settable_map: configMap.settable_map
      config_map: configMap
    true

  initModule = ($container) ->
    $container.html configMap.main_html
    stateMap.$container = $container
    setJqueryMap()
    true

  return {
    configModule: configModule
    initModule: initModule
  }

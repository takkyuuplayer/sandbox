'use strict'

spa = do ->
  initModule: ($container) ->
    spa.shell.initModule $container

window.spa = spa

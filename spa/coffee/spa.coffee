'use strict'

spa = do ->
  initModule: ($container) ->
    $container.html '
    <h1 style="display:inline-block;margin:25px">
      hello world!
    </h1>
    '

window.spa = spa

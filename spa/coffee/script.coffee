'use strict'

class spa
  $chatSlider = undefined
  configMap =
    extended_height: 434
    extended_title: 'Click to retract'
    retracted_height: 16
    retracted_title: 'Click to extend'
    template_html: '<div class="spa-slider"></div>'

  toggleSlider = ->
    slider_height = $chatSlider.height()
    if slider_height is configMap.retracted_height
      $chatSlider.animate height:configMap.extended_height
        .attr 'title', configMap.extended_title
      return true
    else if slider_height is configMap.extended_height
      $chatSlider.animate height: configMap.retracted_height
        .attr 'title', configMap.retracted_title
      return true
    else
      return false

  onClickSlider = (event) ->
    toggleSlider()
    false

  @initModule = ($container) ->
    $container.html configMap.template_html
    $chatSlider = $container.find '.spa-slider'
    $chatSlider.attr 'title', configMap.retracted_title
      .click onClickSlider
    true

window.spa = spa

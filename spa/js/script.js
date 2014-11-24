// Generated by CoffeeScript 1.8.0
(function() {
  'use strict';
  var spa;

  spa = (function() {
    var $chatSlider, configMap, onClickSlider, toggleSlider;

    function spa() {}

    $chatSlider = void 0;

    configMap = {
      extended_height: 434,
      extended_title: 'Click to retract',
      retracted_height: 16,
      retracted_title: 'Click to extend',
      template_html: '<div class="spa-slider"></div>'
    };

    toggleSlider = function() {
      var slider_height;
      slider_height = $chatSlider.height();
      if (slider_height === configMap.retracted_height) {
        $chatSlider.animate({
          height: configMap.extended_height
        }).attr('title', configMap.extended_title);
        return true;
      } else if (slider_height === configMap.extended_height) {
        $chatSlider.animate({
          height: configMap.retracted_height
        }).attr('title', configMap.retracted_title);
        return true;
      } else {
        return false;
      }
    };

    onClickSlider = function(event) {
      toggleSlider();
      return false;
    };

    spa.initModule = function($container) {
      $container.html(configMap.template_html);
      $chatSlider = $container.find('.spa-slider');
      $chatSlider.attr('title', configMap.retracted_title).click(onClickSlider);
      return true;
    };

    return spa;

  })();

  window.spa = spa;

}).call(this);

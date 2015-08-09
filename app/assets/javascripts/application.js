// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

// Agency theme javascript files
//= require ./theme/jquery.easing.min.js
//= require ./theme/cbpAnimatedHeader.js
//= require ./theme/jqBootstrapValidation.js
//= require ./theme/agency.js

// Load all Bootstrap JavaScript
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require ./bootstrap-editable.min.js


$(function() {

  $.fn.editable.defaults.mode = 'inline';
  $('.editable-title').editable();

  $(".add-score").click(function() {
    $(this).children("i").toggleClass("fa-plus");
    $(this).children("i").toggleClass("fa-spinner fa-spin");
  })
  $(".subtract-score").click(function() {
    $(this).children("i").toggleClass("fa-minus");
    $(this).children("i").toggleClass("fa-spinner fa-spin");
  })

  // Update the rect's after the Ajax call succeeds
  $(document).ajaxSuccess(function(event, xhr, status, data) {
    var $icon = $("form#goal-"+data.goal_id+"-form i.fa-spinner");
    $icon.removeClass("fa-spinner fa-spin");

    if($icon.parent().hasClass("add-score")) {
      $icon.addClass("fa-plus");
    } else {
      $icon.addClass("fa-minus");
    }

    var tempDate = new Date(data.date);
    var dateString=('0'+(1+tempDate.getMonth())).substr(-2,2)+'-'+('0'+(1+tempDate.getDate())).substr(-2,2)+'-'+tempDate.getFullYear();
    var $rect = $("#goal-"+data.goal_id+" rect[data-date="+dateString+"]");

    $rect.attr("fill",data.range_color);
    $rect.attr("data-score",data.score);
  })

  function focusRect($rect) {
    // Using .attr() instead of .addClass() b/c it's a SVG
    $("rect[data-gid="+$rect.data("gid")+"]").attr("class", "results-rect");
    $rect.attr("class", "results-rect focus-rect");
  }

  $("rect").click(function() {
    var $selectorId = $(".day-selector[data-gid="+$(this).data("gid")+"]")
    $($selectorId).val($(this).data("date"));
    focusRect($(this));
  })

  $(".day-selector").change(function() {
    focusRect($("rect[data-date="+$(this).val()+"]"));
  })

// Select the first Rect of each goal on load
$.each($(".day-selector"), function() {
  focusRect($("rect[data-date="+$(this).val()+"]"));
})


});

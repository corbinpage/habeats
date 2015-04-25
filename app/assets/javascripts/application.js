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
//= require ./bootstrap-editable.js
//= require ./theme/agency.js

// Load all Bootstrap JavaScript
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker

//= require ./home.js


$(function() {

  $.fn.editable.defaults.mode = 'inline';
  $('.editable-title').editable({
    type: 'text',
    url: $(this).data("post"),    
    pk: $(this).data("post"),
    name: 'title',    
    placement: 'top',
    title: 'Enter title'    
  });

  // $('.edit').click(function(e){    
  //   e.stopPropagation();
  //   $('#publicname-change').editable('toggle');
  //   $('.edit').hide();
  // });
  // $(document).on('click', '.editable-cancel, .editable-submit', function(){
  //   $('.edit').show();
  // })        
//ajax emulation. Type "err" to see error message
// $.mockjax({
//   url: '/post',
//   responseTime: 100,
//   response: function(settings) {
//     if(settings.data.value == 'err') {
//      this.status = 500;  
//      this.responseText = 'Validation error!'; 
//    } else {
//      this.responseText = '';  
//    }
//  }
// }); 

  // Update the rect's after the Ajax call succeeds
  $(document).ajaxSuccess(function(event, xhr, status, data) {
    var rect = $("#day-"+data.id);
    rect.attr("fill",data.range_color);
    rect.attr("data-score",data.score);
  })

  var $lastFocusRect;
  $("rect").click(function() {
    if(typeof $lastFocusRect !== 'undefined') {$lastFocusRect.attr("class","results-rect")};
    $(this).attr("class","results-rect focus");
    $lastFocusRect = $(this);
    var selectorId = "#"+$(this).attr("data-g-id")+"-day-selector";
    $(selectorId).val($(this).attr("data-id"));
  })


});

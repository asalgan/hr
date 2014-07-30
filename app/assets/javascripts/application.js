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
//= require fancybox
//= require best_in_place
//= require summernote.min
//= require zeroclipboard
//= require_tree .


$(document).ready(function() { 

  $('.summernote').summernote();
  var sHTML = $('.summernote').code();
  $('.summernote').code(sHTML);

  $(".best_in_place").best_in_place();

  if ($('body').hasClass('show-job')) {
    var clip = new ZeroClipboard($("#d_clip_button"));
  }

  if ($('body').hasClass('applicant')) {
    var favorites = $('.buttons');
    var button_keep = $('.keep-button');
    var button_accept = $('.accept-button');
    var button_reject = $('.reject-button');
    var favoritesTop = favorites.offset().top;
    $(window).scroll(function() {
        var makeItStick = favoritesTop < $(window).scrollTop();
        favorites.toggleClass('stuck', makeItStick);
        button_keep.toggleClass('stuck', makeItStick);
        button_accept.toggleClass('stuck', makeItStick);
        button_reject.toggleClass('stuck', makeItStick);
        favorites.css('center');
    });
  }


});



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
//= require summernote.min
//= require best_in_place
//= require bootstrap
//= require_tree .


$(document).ready(function() { 
	// $('.nav-list li > a').click(function() {
	// 	$('a').addClass('active')
	// });
	var sHTML = $('.summernote').code();
	$('.summernote').code(sHTML);

	// $(".fancybox").fancybox();

	$(".best_in_place").best_in_place();

  // $( "#tabs" ).tabs();

 //  $('#tabs a').on('click', function(e)  {
	//     var currentAttrValue = $(this).attr('href');
	//     $(this).parent('li').addClass('active').siblings().removeClass('active');
	//     e.preventDefault();
	// });

	// $( ".nav-list" ).tabs();
	// $('.nav-list a').on('click', function(e)  {
	// 	var sideNavValue = $(this).attr('href');
	// 	$(this).parent('li').addClass('side-nav-active').siblings().removeClass('side-nav-active');
	// 	// e.preventDefault();
	// 	});

	var favorites = $('.buttons');
	var button_keep = $('.keep-button');
	var button_accept = $('.accept-button');
	var button_reject = $('.reject-button');
  // var favoritesTop = favorites.offset().top;
    $(window).scroll(function() {
        var makeItStick = favoritesTop < $(window).scrollTop();
        favorites.toggleClass('stuck', makeItStick);
        button_keep.toggleClass('stuck', makeItStick);
        button_accept.toggleClass('stuck', makeItStick);
        button_reject.toggleClass('stuck', makeItStick);
        favorites.css('center', makeItStick ? favoritesLeft : 0);
    });

  // This identifies your website in the createToken call below
  Stripe.setPublishableKey('pk_test_wy2ucs4fBGznnLakgeGfeOx6');

  var stripeResponseHandler = function(status, response) {
    console.log('here');
    console.log(response);
    var $form = $('#payment-form');

    if (response.error) {
      // Show the errors on the form
      $form.find('.payment-errors').text(response.error.message);
      $form.find('button').prop('disabled', false);
    } else {
      // token contains id, last4, and card type
      var token = response.id;
      // Insert the token into the form so it gets submitted to the server
      $form.append($('<input type="hidden" name="stripeToken" />').val(token));
      // and re-submit
      $form.get(0).submit();
    }
  };

  jQuery(function($) {
    $('#payment-form').submit(function(e) {
      var $form = $(this);

      // Disable the submit button to prevent repeated clicks
      $form.find('button').prop('disabled', true);

      Stripe.card.createToken($form, stripeResponseHandler);

      // Prevent the form from submitting with the default action
      return false;
    });
  });

});



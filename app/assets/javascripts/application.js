// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bxslider
//= require_tree .


//星評価
$(function(){
	$('#star').raty({
		size: 36,
		starOff: "/assets/star-off.png",
		starOn: "/assets/star-on.png",
		starHalf:"/assets/star-half.png",
		scoreName: 'post[rate]',
		half: true,
	});
});

//星評価平均
$(function(){
 var id = gon.restaurant_id
  $(`#star-rate-${id}`).raty({
		size: 36,
		starOff: "/assets/star-off.png",
		starOn: "/assets/star-on.png",
		starHalf:"/assets/star-half.png",
		half: true,
		readOnly: true,
		score:`${gon.restaurant_average}`,
		});
});


//bxslider
$(function(){
  $('.bxslider').bxSlider({
    auto: true,
    speed: 2000,
    moveSlides: 1,
    pause: 3000,
    maxSlides: 5,
    slideWidth: 100,
    autoHover: true
  });
});



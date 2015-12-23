  /******** TOP LINE SLIDE IN AND OUT *******/
  jQuery(function($) {
  	$(window).load(function(){  
		var slide = $("#header-main");    //id div menu
		var offset_top = $("#header-main").offset().top;  //id div menu
		var opening = false;
		var closing = false;
		$(window).scroll(function() {
		  var pos = $(window).scrollTop();
		  if (pos > offset_top) {
			if (!opening) {
			  opening = true; closing = false;
			  slide.stop().animate({

			  }, 400, function() {
				opening = false;
			  }).css({
				'position':'fixed','top':'0' // css 
			  });
			}
		  } else {
			if (!closing) {
			  closing = true; opening = false;
			  slide.stop().animate({

			  }, 400, function() {
			  closing = false;
			  }).css({'position':'relative'});   
			}
		  }
		});
	});
});
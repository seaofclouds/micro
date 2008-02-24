// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$.fn.scrollTo = function(speed) {
  var offset = $(this).offset().top - 30
  $('html,body').animate({scrollTop: offset}, speed || 1000)
  return this
}

$(document).ready(function(){
   
  (function($) {  // Wrapper to make sure that the $ is used by jQuery and wasn't taken over by another library

    // form style
    $("html body textarea").addClass("text");
    $("html body input").attr("class", function() { return this.type });

    $("form .text").focus(function( ){
      $(this).addClass("active")
    });
    $("form .text").blur(function( ){
      $(this).removeClass("active")
    });
    
    // flash messages
    $(".flash").animate({
      height: "hide", opacity: "hide"
    }, 2000);
    
    // back to top
    $(".backtotop").click(function(){
      $("#header").scrollTo(400);
    });

    // leave a comment
    $('.leaveacommentbutton').click(function() {
        $('#leaveacomment').scrollTo().queue(function() {
          $('#comment_bacon').focus();
        })
        return false
      });
      
    // fix dotted lines around firefox links
    // http://www.crismancich.de/jquery/plugins/linkscrubber/
    $("a").bind("focus",function(){if(this.blur)this.blur();});
    
    // Scale Images
    // http://blog.wittmania.com/2007/11/30/jquery-image-scaler
    
    var post_width = 500; 
    var comment_width = 473;
    
    $(".post-body img").each(function(){
    	var width = $(this).width();
    	var height = $(this).height();
    	if (width > post_width) {
    		//Set variables	for manipulation
    		var ratio = (height / width );
    		var new_width = post_width;
    		var new_height = (new_width * ratio);
    		//Shrink the image and add link to full-sized image
    		$(this).height(new_height).width(new_width);
    		var imagesrc = $(this).attr("src");
    		$(this).after("<p class='caption'><a href='" + imagesrc + "' title='This image has been scaled, view original'>View Source</a></p>");
    	}
    });
    $(".comment-body img").each(function(){
    	var width = $(this).width();
    	var height = $(this).height();
    	if (width > comment_width) {
    		var ratio = (height / width );
    		var new_width = comment_width;
    		var new_height = (new_width * ratio);
    		$(this).height(new_height).width(new_width);
    		var imagesrc = $(this).attr("src");
    		$(this).after("<p class='caption'><a href='" + imagesrc + "' title='This image has been scaled, view original'>View Source</a></p>");
    	}
    });
    
    
  })(jQuery);
});
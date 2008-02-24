$(document).ready(function(){
  
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
  $(".backtotop").attr({target: "#header"});

  // leave a comment
  $('.leaveacommentbutton').click(function() {
      $('#comment_bacon').focus();
      return false
      });
  
  // Scale Images
  // http://blog.wittmania.com/2007/11/30/jquery-image-scaler
      
  var post_width = 280; 
  var comment_width = 260; 

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
});
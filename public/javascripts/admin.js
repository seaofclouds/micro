$(document).ready(function(){
  $("div.post .admin, div.comment .admin").hide();
  $(".comment, .post, .posts-edit .content").mouseover(function(){
    $("div.post .admin, div.comment .admin").hide();
    $(this).children(".admin").show();
  });
  $(".comment, .post, .posts-edit .content").mouseout(function(){
    $("div.post .admin, div.comment .admin").hide();
  });
  $("#admin .menu").hide();
  $("#admin .tab").click(function( ){
    $("#admin .menu").animate({height:'toggle'}, 200);
  });
});
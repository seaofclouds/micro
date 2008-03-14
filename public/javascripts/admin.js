$(document).ready(function(){
  $("div.post .admin, div.comment .admin, div.page .admin").hide();
  $(".comment, .post, .posts-edit .content, .page, .pages-edit .content").mouseover(function(){
    $("div.post .admin, div.comment .admin, div.page .admin").hide();
    $(this).children(".admin").show();
  });
  $(".comment, .post, .posts-edit .content, .page, .pages-edit .content").mouseout(function(){
    $("div.post .admin, div.comment .admin, div.page .admin").hide();
  });
  $("#admin .menu-container").hide();
  $("#admin .tab, #admin .close").click(function( ){
    $("#admin .menu-container").animate({height:'toggle'}, 200);
  });
});
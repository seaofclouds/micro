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
  // toggle admin menu
  $("#admin .close, #admin .tab").click(function() {
    if ($("#admin .close").text() == 'close'){
      $("#admin .close").text("open");
      $("#admin .menu-container").animate({height:'hide'});
      createCookie('adminmenu', "true", 365);
    } else {
      $("#admin .close").text("close");
      createCookie('adminmenu', "false", 365);
      $("#admin .menu-container").animate({height:'show'});
    }
    return false;
  });
  // toggle admin menu with cookie
  var adminmenu = readCookie('adminmenu'); 
  if (adminmenu == 'false' || adminmenu == undefined) {
    $("#admin .close").text("close");
    $("#admin .menu-container").show();
    }else{
    $("#admin .close").text("open");  
    $("#admin .menu-container").hide();
    }
});
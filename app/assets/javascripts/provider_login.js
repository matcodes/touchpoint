$(function() {
  
  $("a.provider-login").click(function(e) {
    popupCenter($(this).attr("href"), 600, 400, "provider-window");
    return false;
  });
  
  function popupCenter(url, width, height, name) {
    var left = window.screenLeft + (window.innerWidth / 2) - (width / 2);
    var top = window.screenTop + (window.innerHeight / 2) - (height / 2);    
    return window.open(url, name, "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top);
  }

  $("a.popup").click(function(e) {
    popupCenter($(this).attr("href"), $(this).attr("data-width"), $(this).attr("data-height"), "authPopup");
    e.stopPropagation(); return false;
  });
})
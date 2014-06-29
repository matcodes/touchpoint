$ ->
  $("body").bind "click", (e) ->
    $('a.menu').parent("li").removeClass("open")

  $("a.menu").click (e) ->
    li = $(this).parent("li").toggleClass('open')
    return false

  $("a.close").click (e) ->
    $(this).parent().fadeOut();
    return false

ready = ->

  if $(".neighbourhoods.show").length > 0
    $(window).scroll ->
      url = $('.pagination .next a[rel=next]').attr('href')

      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Loading more feeds...")
        $.getScript(url)

$(document).on 'turbolinks:load', ->
  ready()


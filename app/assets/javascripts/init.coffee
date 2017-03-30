window.App ||= {}

App.init = ->
  # $("a, span, i, div").tooltip()
  $('[data-toggle="popover"]').popover()

$(document).on "turbolinks:load", ->
  App.init()
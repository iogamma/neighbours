window.App ||= {}

App.init = ->
  # $("a, span, i, div").tooltip()
  $('[data-toggle="popover"]').popover()

$(document).ready App.init
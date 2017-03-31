ready = ->
  unless $(".neighbourhoods.index").length > 0
    room_id = $("body").attr("data-room_id")

    App.alerts = App.cable.subscriptions.create { channel: "AlertsChannel", room_id: room_id },
      # Called when the subscription is ready for use on the server
      connected: ->

      # Called when the subscription has been terminated by the server
      disconnected: ->

      received: (data) ->
        switch data["alert_action"]
          when "POST"
            $(".alerts-feed").append data["alert_message"]
          when "CLEAR"
            $(".alerts-feed").text("")
          else return false

      speak: (message) ->
        @perform "speak", alert_input: message, alert_action: "post"

      clear: (room_id) ->
        @perform "clear", room_id: room_id

    $(document).on "keypress", "[data-behaviour~=alert-speaker]", (event) ->
      if event.keyCode is 13
        App.alerts.speak event.target.value
        event.target.value = ""
        event.preventDefault()

    $(document).on "click", "[data-behaviour~=alert-post]", () ->
      $alert_input = $("[data-behaviour='alert-speaker']")
      App.alerts.speak $alert_input.val()
      $alert_input.value = ""
      event.preventDefault()

    $(document).on "click", "[data-behaviour=alert-clear-all]", () ->
      App.alerts.clear(room_id)
      event.preventDefault()

  else
    unless App.alerts is undefined
      App.alerts.unsubscribe()
      delete App.alerts

$(document).on("turbolinks:load", ready)

ready = ->
  unless $(".neighbourhoods.index").length > 0
    room_id = $("body").attr("data-room_id")

    App.alerts = App.cable.subscriptions.create { channel: "AlertsChannel", room_id: room_id },
      connected: ->
        # Called when the subscription is ready for use on the server
      disconnected: ->
        # Called when the subscription has been terminated by the server
      received: (data) ->
        $(".alerts_feed").append data['alert_message']
      speak: (message) ->
        @perform "speak", alert_input: message

    submit = (event) ->
      App.alerts.speak event.target.value
      event.target.value = ""
      event.preventDefault()

    $(document).on "keypress", "[data-behavior~=alert_speaker]", (event) ->
      if event.keyCode is 13
        submit(event)

  else
    unless App.alerts is undefined
      App.alerts.unsubscribe()
      delete App.alerts

$(document).on('turbolinks:load', ready)

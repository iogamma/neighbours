App.alerts = App.cable.subscriptions.create "AlertsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $(".alerts_box").append data['alert_message']
    $(".alerts_feed").append data['alert_message']

  speak: (message) ->
    @perform "speak", alert_message: message

$(document).on "keypress", "[data-behavior~=alert_speaker]", (event) ->
  if event.keyCode is 13
    App.alerts.speak event.target.value
    event.target.value = ""
    event.preventDefault()

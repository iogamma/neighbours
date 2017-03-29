App.admin_chat = App.cable.subscriptions.create "AdminChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $(".chat_box").append data['chat_message']

  speak: (input) ->
    @perform "speak", chat_input: input

$(document).on "keypress", "[data-behavior~=chat_speaker]", (event) ->
  if event.keyCode is 13
    App.admin_chat.speak event.target.value
    event.target.value = ""
    event.preventDefault()

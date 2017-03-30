ready = ->

  room_id = $(".chat_box").attr("data-room")

  App.admin_chat = App.cable.subscriptions.create { channel: "AdminChatChannel", room: room_id },
    connected: ->

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $(".chat_box").append data['chat_message']

    speak: (input) ->
      @perform "speak", chat_input: input

  $(document).on "keypress", "[data-behavior~=chat_speaker]", (event) ->
    if event.keyCode is 13
      event.preventDefault()
      App.admin_chat.speak event.target.value
      event.target.value = ""

$(document).on('turbolinks:load', ready)
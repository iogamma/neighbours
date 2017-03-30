ready = ->

  if $(".dashboard.index")

    room_id = $(".chat_box").attr("data-room")

    App.admin_chat = App.cable.subscriptions.create { channel: "AdminChatChannel", room: room_id },
      # Called when the subscription has been connected by the server
      connected: ->
      # Called when the subscription has been terminated by the server
      disconnected: ->
      # Called when data is received from server
      received: (data) ->
        $(".chat_box").append data['chat_message']
      # Used to send information to the server
      speak: (input) ->
        @perform "speak", chat_input: input

    # Admin page specific jQuery
    $(document).on "keypress", "[data-behavior~=chat_speaker]", (event) ->
      if event.keyCode is 13
        event.preventDefault()
        App.admin_chat.speak event.target.value
        event.target.value = ""

  else
    unless App.admin_chat is undefined
      App.admin_chat.unsubscribe()
      delete App.admin_chat

$(document).on('turbolinks:load', ready)
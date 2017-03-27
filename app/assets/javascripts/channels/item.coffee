App.item = App.cable.subscriptions.create "ItemChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#to_do_list").append(data["description"])
    # Called when there's incoming data on the websocket for this channel

  create: (description) ->
    # calling perform to dispatch the create function
    # on ItemChannel with hash { description: description }
    @perform 'create', description: description
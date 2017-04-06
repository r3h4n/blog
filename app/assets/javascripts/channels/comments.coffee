App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#messages .comment-fix:first").prepend(data)

<<<<<<< HEAD
=======
    
>>>>>>> 3fbe1046d29e92ab73039366db81cab52d36d264
    # Called when there's incoming data on the websocket for this channel

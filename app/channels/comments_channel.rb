class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "comments"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
end

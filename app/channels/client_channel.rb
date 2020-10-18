class ClientChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "client_channel_#{params[:wsId]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
    p 'a user connected'
  end

  def unsubscribed
    p 'a user disconnected'
  end
end

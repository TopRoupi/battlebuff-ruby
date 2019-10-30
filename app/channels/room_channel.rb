class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
    p "#{current_player} connected"
  end

  def unsubscribed
    stop_all_streams
    p "#{current_player} disconnected"
  end
end

class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:room_id]}_channel"
    p "#{current_player} connected to room #{params[:room_id]}"
  end

  def unsubscribed
    stop_all_streams
    p "#{current_player} disconnected"
  end
end

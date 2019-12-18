class PresenceRoomChannel < ApplicationCable::Channel
  def subscribed
    alter_online_status(status: true, room_id: params[:room_id])
    stream_from "presence_room_#{params[:room_id]}_channel"
    broadcast_players_list(params[:room_id])

    p "#{current_player} is online"
  end

  def unsubscribed
    alter_online_status(status: false, room_id: params[:room_id])
    stop_all_streams
    broadcast_players_list(params[:room_id])

    p "#{current_player} is offline"
  end

  private

  def broadcast_players_list(room_id)
    room = Room.find(room_id)
    ActionCable.server.broadcast "presence_room_#{room_id}_channel", room.online_players
  end

  def alter_online_status(status: nil, room_id: nil)
    player = Player.find(current_player)
    player.set_online_status_by_room(status, room_id)
  end
end

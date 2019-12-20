class PresenceRoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:room_id])

    alter_online_status(room, status: true)
    stream_from "presence_room_#{room.id}_channel"
    broadcast_players_list(room)

    p "#{current_player} is online"
  end

  def unsubscribed
    room = Room.find(params[:room_id])

    alter_online_status(room, status: false)
    stop_all_streams
    broadcast_players_list(room)

    if room.online_players.length == 0
      room.visible = false
      room.save!
    end

    p "#{current_player} is offline"
  end

  private

  def broadcast_players_list(room)
    ActionCable.server.broadcast "presence_room_#{room.id}_channel", room.online_players
  end

  def alter_online_status(room, status: nil)
    player = Player.find(current_player)
    player.set_online_status_by_room(status, room.id)
  end
end

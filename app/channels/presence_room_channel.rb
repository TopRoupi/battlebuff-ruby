class PresenceRoomChannel < ApplicationCable::Channel
  def subscribed
    alter_online_status(status: true, room_id: 1)
    stream_from 'presence_room_channel'
    broadcast_players_list

    p "#{current_player} is online"
  end

  def unsubscribed
    alter_online_status(status: false, room_id: 1)
    stop_all_streams
    broadcast_players_list

    p "#{current_player} is offline"
  end

  private

  def broadcast_players_list
    ActionCable.server.broadcast 'presence_room_channel', Player.online_players_by_room(1)
  end

  def alter_online_status(configs = { status: nil, room_id: nil })
    player = Player.find(current_player)
    player.set_online_status_by_room(configs[:status], configs[:room_id])
  end
end

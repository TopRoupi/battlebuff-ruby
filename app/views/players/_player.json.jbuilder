json.extract! player, :id, :steamid, :avatarid, :name, :mmr, :created_at, :updated_at
json.url player_url(player, format: :json)

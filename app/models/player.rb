class Player < ApplicationRecord
  has_many :messages
  has_many :presences
  has_many :rooms, through: :presences

  def self.from_omniauth(auth)
    info = auth['info']
    player = find_or_initialize_by(uid: auth['uid'])
    player.nickname = info['nickname']
    player.avatar_url = info['image']
    player.profile_url = info['urls']['Profile']
    player.save!
    player
  end

  def presence_by_room(id)
    if presences.find_by(room_id: id).nil?
      rooms << Room.find(id)
    end

    presences.find_by(room_id: id)
  end

  def set_online_status_by_room(status, id)
    presence_by_room(id).update(online: status)
  end
end

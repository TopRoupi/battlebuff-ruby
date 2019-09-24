class Player < ApplicationRecord
  has_many :messages

  def self.from_omniauth(auth)
    info = auth['info']
    player = find_or_initialize_by(uid: auth['uid'])
    player.nickname = info['nickname']
    player.avatar_url = info['image']
    player.profile_url = info['urls']['Profile']
    player.save!
    player
  end
end

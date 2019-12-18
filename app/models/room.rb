class Room < ApplicationRecord
  has_many :presences
  has_many :messages
  has_many :players, through: :presences
  validates :name,
            presence: true,
            length: { maximum: 60 }
  validates :limit,
            presence: true

  def online_players
    Player.joins(:presences).where('presences.room_id': id, 'presences.online': true)
  end

  def is_full?
	online_players.length == limit ? true : false
  end
end

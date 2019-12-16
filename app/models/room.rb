class Room < ApplicationRecord
  has_many :presences
  has_many :messages
  has_many :players, through: :presences
  validates :name,
            presence: true,
            length: { maximum: 60 }
  validates :limit,
            presence: true
end

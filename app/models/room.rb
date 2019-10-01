class Room < ApplicationRecord
  has_many :presences
  has_many :players, through: :presences
end

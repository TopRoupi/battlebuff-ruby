class Presence < ApplicationRecord
  belongs_to :player
  belongs_to :room
end

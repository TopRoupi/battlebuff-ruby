class Message < ApplicationRecord
  belongs_to :player
  belongs_to :room
  validates :content,
            presence: true,
            length: { maximum: 300 }
end

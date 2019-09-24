class Message < ApplicationRecord
  belongs_to :player
  validates :content,
            presence: true,
            length: { maximum: 300 }
end

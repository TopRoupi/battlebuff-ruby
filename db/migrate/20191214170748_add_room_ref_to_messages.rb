class AddRoomRefToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :room, null: false, foreign_key: true
  end
end

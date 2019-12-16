class AddLimitToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :limit, :int
  end
end

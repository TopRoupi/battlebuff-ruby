class AddNameToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :name, :string
  end
end

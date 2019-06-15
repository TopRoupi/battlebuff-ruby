class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :steamid
      t.string :avatarid
      t.string :name
      t.string :mmr

      t.timestamps
    end
  end
end

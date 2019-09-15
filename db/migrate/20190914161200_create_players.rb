class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :uid
      t.string :nickname
      t.string :avatar_url
      t.string :profile_url

      t.timestamps
    end
    add_index :players, :uid, unique: true
  end
end

class AddEmailToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :online, :boolean
  end
end

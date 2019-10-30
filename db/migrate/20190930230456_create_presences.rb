class CreatePresences < ActiveRecord::Migration[6.0]
  def change
    create_table :presences do |t|
      t.belongs_to :room
      t.belongs_to :player
      t.boolean :online, default: false

      t.timestamps
    end
  end
end

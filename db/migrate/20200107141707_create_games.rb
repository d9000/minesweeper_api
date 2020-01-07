class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.belongs_to :user, foreing_key: true
      t.string :status
      t.boolean :board_init, array: true
      t.boolean :board_revealed, array: true
      t.text :board_flagged, array: true
      t.integer :seconds_played
      t.timestamps
    end
  end
end

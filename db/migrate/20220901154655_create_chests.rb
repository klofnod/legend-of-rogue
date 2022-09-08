class CreateChests < ActiveRecord::Migration[6.1]
  def change
    create_table :chests do |t|
      t.belongs_to :gear, null: false, foreign_key: true
      t.belongs_to :character, null: false, foreign_key: true
      t.string :rarity

      t.timestamps
    end
  end
end

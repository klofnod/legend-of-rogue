class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :backstory
      t.integer :health
      t.integer :power
      t.integer :defence
      t.belongs_to :combatant, null: false, foreign_key: true

      t.timestamps
    end
  end
end

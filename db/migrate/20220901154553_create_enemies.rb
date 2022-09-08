class CreateEnemies < ActiveRecord::Migration[6.1]
  def change
    create_table :enemies do |t|
      t.string :name
      t.string :description
      t.integer :health
      t.integer :power
      t.integer :defence
      t.belongs_to :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end

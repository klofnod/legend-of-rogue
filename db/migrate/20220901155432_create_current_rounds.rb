class CreateCurrentRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :current_rounds do |t|
      t.belongs_to :character, null: false, foreign_key: true
      t.belongs_to :game, null: false, foreign_key: true
      t.belongs_to :encounter, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCombatants < ActiveRecord::Migration[6.1]
  def change
    create_table :combatants do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end

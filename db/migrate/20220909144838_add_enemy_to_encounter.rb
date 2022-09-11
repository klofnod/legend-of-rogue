class AddEnemyToEncounter < ActiveRecord::Migration[6.1]
  def change
    add_column :encounters, :enemy, :integer
  end
end

class CreateGears < ActiveRecord::Migration[6.1]
  def change
    create_table :gears do |t|
      t.integer :power
      t.string :name
      t.string :description
      t.string :effect

      t.timestamps
    end
  end
end

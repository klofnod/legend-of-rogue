class CreateEncounters < ActiveRecord::Migration[6.1]
  def change
    create_table :encounters do |t|
      t.string :name
      t.string :setting
      t.string :plot

      t.timestamps
    end
  end
end

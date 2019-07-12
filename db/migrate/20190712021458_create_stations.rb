class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.references :teacher, null: false
      t.string :station_name, null: false
      t.string :station_cd, null: false
      t.string :line_name, null: false
      t.string :line_cd, null: false
      t.string :pref_name, null: false
      t.string :pref_cd, null: false

      t.timestamps
    end


    
    add_foreign_key :stations, :teachers
  end
end

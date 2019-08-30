class CreateStationLines < ActiveRecord::Migration[5.2]
  def change
    create_table :station_lines do |t|
      t.string :name
      t.references :company, foreign_key: true
      t.references :teacher, foreign_key: true


      t.timestamps
    end
  end
end

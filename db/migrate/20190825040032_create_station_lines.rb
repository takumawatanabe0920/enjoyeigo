class CreateStationLines < ActiveRecord::Migration[5.2]
  def change
    create_table :station_lines do |t|
      t.string :name, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end

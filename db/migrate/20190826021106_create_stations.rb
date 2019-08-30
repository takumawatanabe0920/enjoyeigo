class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name
      t.references :prefecture, foreign_key: true
      t.references :station_line, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end

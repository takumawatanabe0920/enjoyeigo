class CreateStationJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :station_joins do |t|
      t.references :station_line, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true

      t.timestamps
    end
  end
end

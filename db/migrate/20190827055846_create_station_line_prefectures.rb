class CreateStationLinePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :station_line_prefectures do |t|
      t.references :station_line, null: false, unique: true
      t.references :prefecture, null: false, unique: true

      t.timestamps
    end
  end
end

class CreateTeacherStations < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_stations do |t|
      t.references :teacher, foreign_key: true
      t.references :station, foreign_key: true

      t.timestamps
      t.index [:teacher_id, :station_id], unique: true
    end
  end
end

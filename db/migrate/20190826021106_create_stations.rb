class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :prefecture
      t.string :line
      t.string :station

      t.timestamps
    end
  end
end

class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.references :teacher, null: false
      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.string :station

      t.timestamps
    end



    add_foreign_key :stations, :teachers
  end
end

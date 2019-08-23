class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zip
      t.string :pref
      t.string :city
      t.string :addr
      t.string :s0
      t.string :s1
      
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end

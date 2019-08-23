class CreatePersonalinfos < ActiveRecord::Migration[5.2]
  def change
    create_table :personalinfos do |t|
      t.string :national
      t.integer :sex
      t.date :birthday
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end

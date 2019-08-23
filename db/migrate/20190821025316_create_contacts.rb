class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :phonenumber
      t.string :mailaddress1
      t.string :mailaddress2
      t.boolean :phonecall
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end

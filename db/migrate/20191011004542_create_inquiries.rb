class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :content, null: false
      t.integer :phone

      t.timestamps
    end
  end
end

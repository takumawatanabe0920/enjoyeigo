class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true
      t.text :message
      t.string :user_type

      t.timestamps
    end
  end
end

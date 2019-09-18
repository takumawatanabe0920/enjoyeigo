class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :messagable, polymorphic: true
      t.references :room, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end

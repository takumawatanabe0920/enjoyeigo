class AddNameToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :name, :string
    add_column :teachers, :zip, :string
    add_column :teachers, :pref, :string
    add_column :teachers, :addr, :string
  end
end

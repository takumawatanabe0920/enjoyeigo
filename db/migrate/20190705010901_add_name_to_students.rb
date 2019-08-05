class AddNameToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :name, :string
    add_column :students, :zip, :string
    add_column :students, :pref, :string
    add_column :students, :addr, :string
    add_column :students, :prefecture, :string
    add_column :students, :line, :string
    add_column :students, :station, :string
  end
end

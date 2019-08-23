class AddBillingToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :billing, :boolean
  end
end

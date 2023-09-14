class AddColsToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :experience, :integer
    add_column :teachers, :salary, :integer
  end
end

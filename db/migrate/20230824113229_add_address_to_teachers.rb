class AddAddressToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :address, :text
  end
end

class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.integer :contact

      t.timestamps
    end
  end
end

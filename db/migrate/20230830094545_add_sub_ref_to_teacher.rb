class AddSubRefToTeacher < ActiveRecord::Migration[7.0]
  def change
    add_reference :teachers, :subjects, foreign_key: true
  end
end

class CreateStudentsTextbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :students_textbooks do |t|
      t.references :student, null: false, foreign_key: true
      t.references :textbook, null: false, foreign_key: true

      t.timestamps
    end
  end
end

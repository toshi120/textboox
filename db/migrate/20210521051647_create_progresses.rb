class CreateProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :progresses do |t|
      t.integer     :progress_page
      t.text        :comment
      t.references  :students_textbook,  null: false, foreign_key: true
      t.timestamps
    end
  end
end

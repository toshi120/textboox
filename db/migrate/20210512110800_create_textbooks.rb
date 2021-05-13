class CreateTextbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :textbooks do |t|
      t.string     :name,       null: false
      t.text       :note
      t.integer    :page,       null: false
      t.references :teacher,    null: false, foreign_key: true


      t.timestamps
    end
  end
end

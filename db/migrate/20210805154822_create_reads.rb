class CreateReads < ActiveRecord::Migration[6.0]
  def change
    create_table :reads do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :progress, null: false, foreign_key: true

      t.timestamps
    end
  end
end

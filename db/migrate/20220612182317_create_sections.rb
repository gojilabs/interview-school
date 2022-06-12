class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true
      t.integer :day, null: false
      t.integer :start_time, null: false
      t.integer :end_time, null: false

      t.timestamps
    end
  end
end

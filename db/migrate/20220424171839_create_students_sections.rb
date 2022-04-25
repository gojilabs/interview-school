class CreateStudentsSections < ActiveRecord::Migration[6.0]
  def change
    create_table :student_sections do |t|
      t.references :student, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.timestamps
    end
    add_index :student_sections, [:student_id, :section_id], unique: true
  end
end

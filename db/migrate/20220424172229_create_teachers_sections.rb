class CreateTeachersSections < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_sections do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
    end
    add_index :teacher_sections, [:teacher_id, :section_id], unique: true
  end
end

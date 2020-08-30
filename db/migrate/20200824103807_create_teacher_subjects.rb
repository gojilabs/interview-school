class CreateTeacherSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_subjects do |t|
      t.references :teacher, foreign_key: true, null: false
      t.references :subject, foreign_key: true, null: false
      t.integer :level, null: false

      t.timestamps
    end
    add_index :teacher_subjects, [:teacher_id, :subject_id], unique: true
  end
end

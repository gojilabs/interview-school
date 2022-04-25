class CreateClassroomsSections < ActiveRecord::Migration[6.0]
  def change
    create_table :classroom_sections do |t|
      t.references :classroom, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
    end
    add_index :classroom_sections, [:classroom_id, :section_id], unique: true
  end
end

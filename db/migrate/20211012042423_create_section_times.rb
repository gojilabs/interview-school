class CreateSectionTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :section_times do |t|
      t.references :section, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true
      t.integer :day
      t.integer :start_time
      t.integer :duration

      t.timestamps
    end
  end
end

class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.timestamp :time_start
      t.integer :time_length
      t.integer :week_days
      t.timestamps
    end
  end
end

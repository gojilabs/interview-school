class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :start_at
      t.integer :duration, limit: 1
      t.integer :days, array: true, default: []

      t.timestamps
    end
  end
end

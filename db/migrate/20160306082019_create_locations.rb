class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :course_id
      t.string :localtion
      t.integer :time

      t.timestamps null: false
    end
  end
end

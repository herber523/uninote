class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.float :num_1
      t.float :num_2
      t.float :num_3
      t.string :comment

      t.timestamps null: false
    end
  end
end

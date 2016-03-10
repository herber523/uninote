class CreateLnventories < ActiveRecord::Migration
  def change
    create_table :lnventories do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end

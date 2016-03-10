class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :course_id
      t.integer :recommend_id
      t.integer :times

      t.timestamps null: false
    end
  end
end

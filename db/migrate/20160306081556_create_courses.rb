class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_id
      t.string :name
      t.string :credit
      t.string :date
      t.string :teacher
      t.string :num
      t.string :note
      t.integer :department_id

      t.timestamps null: false
    end
  end
end

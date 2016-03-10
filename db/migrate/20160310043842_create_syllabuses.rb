class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|
      t.integer :course_id
      t.text :syllabus

      t.timestamps null: false
    end
  end
end

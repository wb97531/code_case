class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :place
      t.string :instructor
      t.text :description
      t.date :start_date
      t.date :completion_date
      t.boolean :certificate
      t.boolean :completed
      t.integer :coder_id

      t.timestamps
    end
  end
end

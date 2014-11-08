class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :github_link
      t.date :deadline
      t.text :description
      t.integer :priority
      t.integer :user_id
      t.boolean :current

      t.timestamps
    end
  end
end

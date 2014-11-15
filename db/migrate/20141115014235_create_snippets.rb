class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :objective
      t.string :image_name
      t.string :github_file_link
      t.integer :project_id
      t.integer :coder_id

      t.timestamps
    end
  end
end

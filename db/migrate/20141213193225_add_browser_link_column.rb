class AddBrowserLinkColumn < ActiveRecord::Migration
  def up
    add_column :projects, :browser_project_link, :string
  end
  def down
    remove_column :projects, :browser_project_link, :string
  end
end

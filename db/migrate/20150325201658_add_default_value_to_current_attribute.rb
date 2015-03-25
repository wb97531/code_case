class AddDefaultValueToCurrentAttribute < ActiveRecord::Migration
  def up
    change_column :projects, :current, :boolean, default: true
  end

  def down
    change_column :projects, :current, :boolean, default: nil
  end
end

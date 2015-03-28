class AddTextVerifiedToCoder < ActiveRecord::Migration
  def change
    add_column :coders, :text_verified, :boolean, default: false
  end
end

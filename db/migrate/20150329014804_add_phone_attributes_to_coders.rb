class AddPhoneAttributesToCoders < ActiveRecord::Migration
  def change
    add_column :coders, :phone_verified, :boolean, default: false
  end
end

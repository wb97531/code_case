class AddPhoneAttributesToCoders < ActiveRecord::Migration
  def change
    add_column :coders, :phone_verification_code, :string
    add_column :coders, :phone_verified, :boolean
  end
end

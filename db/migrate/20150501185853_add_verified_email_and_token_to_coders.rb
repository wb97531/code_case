class AddVerifiedEmailAndTokenToCoders < ActiveRecord::Migration
  def change
    add_column :coders, :verified_email, :boolean, default: false
    add_column :coders, :token, :string, default: ''
  end
end

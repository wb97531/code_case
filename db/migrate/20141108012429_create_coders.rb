class CreateCoders < ActiveRecord::Migration
  def change
    create_table :coders do |t|
      t.string :coder_name
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end

class AddPhoneToCoder < ActiveRecord::Migration
  def change
    add_column :coders, :phone, :string
  end
end

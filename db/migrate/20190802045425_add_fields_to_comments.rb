class AddFieldsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :email, :string
    add_column :comments, :picture, :string
  end
end

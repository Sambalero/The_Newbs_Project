class AddRoleMailTelephoneCommentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :mail, :string
    add_column :users, :telephone, :string
    add_column :users, :comment, :text
  end
end

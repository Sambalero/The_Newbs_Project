class RenameUsersPasswordHashPasswordDigest < ActiveRecord::Migration
  def up
  	rename_column :users, :password_hash, :password_digest
  end

  def down
  end
end

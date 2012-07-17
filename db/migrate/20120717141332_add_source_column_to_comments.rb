class AddSourceColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :source, :string
  end
end

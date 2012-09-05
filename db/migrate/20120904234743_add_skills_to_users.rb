class AddSkillsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :PHP, :integer
    add_column :users, :Ruby_on_rails, :integer
    add_column :users, :Javascript, :integer
    add_column :users, :HTML, :integer
    add_column :users, :CSS, :integer
    add_column :users, :Flash, :integer
    add_column :users, :jquery, :integer
    add_column :users, :MySQL, :integer
    add_column :users, :Postgresql, :integer
    add_column :users, :GitHub, :integer
    add_column :users, :WordPress, :integer
    add_column :users, :Graphics, :integer
    add_column :users, :Video, :integer
    add_column :users, :Audio, :integer
    add_column :users, :Adobe_photoshop, :integer
    add_column :users, :Gimp, :integer
    add_column :users, :SEO, :integer
    add_column :users, :SEM, :integer
  end
end

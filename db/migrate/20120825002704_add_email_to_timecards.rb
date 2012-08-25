class AddEmailToTimecards < ActiveRecord::Migration
  def change
    add_column :timecards, :email, :string
  end
end

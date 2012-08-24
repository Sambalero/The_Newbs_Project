class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.string :name
      t.string :task
      t.text :description
      t.float :hours
      t.datetime :date
      t.float :rate
      t.boolean :approved

      t.timestamps
    end
  end
end

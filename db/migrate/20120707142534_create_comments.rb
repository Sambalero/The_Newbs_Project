class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :contact
      t.text :comment
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end

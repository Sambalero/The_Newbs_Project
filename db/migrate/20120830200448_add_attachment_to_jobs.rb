class AddAttachmentToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :attachment, :string
  end
end

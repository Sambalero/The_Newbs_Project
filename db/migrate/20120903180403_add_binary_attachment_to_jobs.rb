class AddBinaryAttachmentToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :binary_attachment, :binary
  end
end

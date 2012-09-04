require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "attachment is added on create" do
    mock_file = mock()
    mock_file.expects(:original_filename).returns("file-name")
    params = {attached_file: mock_file}
    j = Job.new params
    j.save!
    assert_equal "file-name", j.attachment
  end
end

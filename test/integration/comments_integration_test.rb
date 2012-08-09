require 'test_helper'

class CommentsIntegrationTest < ActionDispatch::IntegrationTest
  # setup do
 
  # end

	test "comments are shown" do
		visit hire_path
#		assert page.has_selector?("note")
		assert page.has_content?("Job description")
	end

end
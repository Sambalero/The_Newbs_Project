require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase

  test "comment_notice" do
  	comment = Comment.new(
  	  name: "MyName1",
		  contact: "MyContact1",
		  comment: "MyText1",
		  approved: false,
		  source: "comment"
		)

  	email = AdminMailer.comment_notice(comment.notice(comment.source + "created")).deliver
  	assert !ActionMailer::Base.deliveries.empty?

  	assert_equal ['Noobs'], email.from
  	assert_equal ['kpswallow2@gmail.com'], email.to
  	assert_equal "MyName1 commentcreated", email.subject
  	assert_match(/comment: MyText1/, email.encoded)
		assert_match(/from: MyContact1/, email.encoded)

  end

end   
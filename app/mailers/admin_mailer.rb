class AdminMailer < ActionMailer::Base
  default from: "Noobs"

  def comment_added(commenthash)		
  mail(to: 'kpswallow2@gmail.com', subject: commenthash[:name], body: "comment: " + commenthash[:comment] +"\n from: " + commenthash[:contact])
	end
end

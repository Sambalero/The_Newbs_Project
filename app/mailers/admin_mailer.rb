class AdminMailer < ActionMailer::Base

  def comment_notice(notice)	
  	
  mail( from: 'Noobs', 
		  	to: 'kpswallow2@gmail.com', 
		  	subject: notice[:name] + notice[:action], 
		  	body: "comment: " + notice[:comment] +"\n from: " + notice[:contact])
	end
end

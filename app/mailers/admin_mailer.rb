class AdminMailer < ActionMailer::Base

  def comment_notice(notice)	
  	
	  mail( from: 'Noobs', 
			  	to: 'kpswallow2@gmail.com', 
			  	subject: notice[:name] + " " + notice[:action], 
			  	body: "comment: " + notice[:comment] +"\n \n from: " + notice[:contact])
	end

	def password_reset(user)
	  @user = user
	  mail :to => user.email, :subject => "Password Reset"
	end
end

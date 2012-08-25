class AdminMailer < ActionMailer::Base

  def comment_notice(notice)	
  	
	  mail( from: 'Noobs', 
			  	to: 'kpswallow2@gmail.com', 
			  	subject: notice[:name] + " " + notice[:action], 
			  	body: "comment: " + notice[:comment] + "\n \n from: " + notice[:contact])
	end

	def password_reset(user)
	  @user = user
	  mail :to => user.email, :subject => "Password Reset"
	end

	def join_notice(user)
		@user = user
	  mail( from: 'Noobs', 
			  	to: 'kpswallow2@gmail.com', 
			  	subject: "Newby Alert!", 
			  	body: "name: " + user.name + "\n \n email: " + user.email)
	end

	def job_notice(user)
		@user = user #is this needed?
	  mail( from: 'Noobs', 
			  	to: 'kpswallow2@gmail.com', 
			  	subject: "Newby Alert!", 
			  	body: "name: " + user.name + "\n \n email: " + user.email + "\n \n description: " + user.description)
	end
end

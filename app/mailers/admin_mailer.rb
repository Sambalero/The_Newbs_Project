class AdminMailer < ActionMailer::Base

  def comment_notice(notice)	
  	
	  mail( from: 'Noobs', 
			  	to: 'kpswallow2@gmail.com', 
			  	subject: notice[:name] + " " + notice[:action], 
			  	body: "comment: " + notice[:comment] + "\n \n from: " + notice[:contact])
	end

	def password_reset(user)
	  @user = user #is this needed?
	  mail :to => user.email, :subject => "Password Reset"
	end

	def join_notice(user)

	  mail( from: 'Noobs', 
			  	to: 'kpswallow2@gmail.com', 
			  	subject: "Newby Alert!", 
			  	body: "name: " + user.name + "\n \n email: " + user.email)
	end

	def job_notice(job)

	  mail( from: 'Noobs', 
			  	to: 'kpswallow2@gmail.com', 
			  	subject: "Job Alert!", 
			  	body: "name: " + job.client_name + "\n \n email: " + job.client_email + "\n \n description: " + job.description)
	end
end

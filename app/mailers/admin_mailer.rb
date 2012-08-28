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

	def time_notice(card)

	  mail( from: 'Noobs', 
			  	to: timecard.email,
			  	subject: "Time Posted!", 
			  	body: "name: " + 
			  				timecard.name + 
			  				"\n \n hours: " + 
			  				timecard.hours + 
			  				"\n \n description: " + 
			  				timecard.description)
	  	  mail( from: 'Noobs', 
			  	to: 'kpswallow2@gmail.com', 
			  	subject: "Time Posted!", 
			  	body: "name: " + 
			  				timecard.name + 
			  				"\n \n hours: " + 
			  				timecard.hours + 
			  				"\n \n description: " + 
			  				timecard.description)
	end
end

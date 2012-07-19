class Comment < ActiveRecord::Base
  attr_accessible :approved, :comment, :contact, :name, :source

  def notice(action)
    notice = {approved: approved, 
    					comment: comment, 
    					contact: contact, 
    					name: name, 
    					source: source,
    					action: action
    }
  end
end

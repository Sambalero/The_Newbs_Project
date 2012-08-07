# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  contact    :string(255)
#  comment    :text
#  approved   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  source     :string(255)
#

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

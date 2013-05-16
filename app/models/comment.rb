class Comment < ActiveRecord::Base
  belongs_to :employee
  attr_accessible :body, :commenter
end

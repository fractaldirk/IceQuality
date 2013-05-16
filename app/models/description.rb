class Description < ActiveRecord::Base
  belongs_to :employee
  attr_accessible :job_description
end

class Survey < ActiveRecord::Base
  has_many :questions
  belongs_to :creator, :foreign_key => "user_id", :class_name => "User"
  has_many :takers, :foreign_key => "user_id", :class_name => "Survey_taken"
  

end

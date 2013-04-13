class Survey < ActiveRecord::Base
  has_many :questions
  has_many :takers, :through => :survey_takens, :source => :user
  has_many :survey_takens
  # has_and_belongs_to_many :takers, :association_foreign_key => "user_id", :join_table => "surveys_taken"
  belongs_to :creator, :foreign_key => "user_id", :class_name => "User"
  

end

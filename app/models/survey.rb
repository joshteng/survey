class Survey < ActiveRecord::Base
  has_many :questions
  belongs_to :creator
  has_many :takers
end

class User < ActiveRecord::Base
  has_and_belongs_to_many :choices
  has_and_belongs_to_many :surveys

  include BCrypt

  attr_accessor :password_confirmation

  validates :name, :presence => true
  validates :email, :uniqueness => true, :presence => true
                            

  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates_confirmation_of :password, :message => "should match confirmation"



  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end


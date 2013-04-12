require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  attr_accessor :password_confirmation

  validates :name, :email,  :uniqueness => true, :presence => true
                            

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


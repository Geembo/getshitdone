class User < ActiveRecord::Base
  has_secure_password
  
  has_many :tasks
  attr_accessible :email, :password, :password_confirmation
  
  validates :email, uniqueness: { case_sensitive: false }, presence: true 
end

class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation

  has_many :tasks

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, uniqueness: { case_sensitive: false }, presence: true,
                    format: { with: VALID_EMAIL_REGEX } 
end
class User < ActiveRecord::Base
  has_many :questions 
  has_many :answers

  validates :email, presence: true
  validates :password, presence: true
end

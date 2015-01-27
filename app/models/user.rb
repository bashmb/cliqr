class User < ActiveRecord::Base
  has_many :questions 
  has_many :answers
  has_many :downvotes
  has_many :upvotes

  validates :email, presence: true
  validates :password, presence: true
  validates :presenter, inclusion: {in: [true, false]}
end

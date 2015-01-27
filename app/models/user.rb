class User < ActiveRecord::Base
  has_many :questions 
  has_many :answers
  has_many :upvotes
  has_many :downvotes
end

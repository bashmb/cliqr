class Vote < ActiveRecord::Base
  has_many :users
  has_many :questions, :through => :content
  has_many :answers, :through => :content
  has_many :upvotes, :through => :vote
  has_many :downvotes, :through => :vote
end

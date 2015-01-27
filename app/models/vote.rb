class Vote < ActiveRecord::Base
  has_many :users
  has_many :questions, :through => :content
  has_many :answers, :through => :content
  has_many :upvotes, :through => :votes
  has_many :downvotes, :through => :votes
end

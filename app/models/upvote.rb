class Upvote < ActiveRecord::Base
  belongs_to :user
  has_many :questions, :through => :content
  has_many :answers, :through => :content
end

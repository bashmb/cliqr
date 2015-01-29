class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes, :as => :content

  # has_many :upvotes #, :through => :content
  # has_many :downvotes #, :through => :content
end

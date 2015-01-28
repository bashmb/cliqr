class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :content, polymorphic: true

  has_many :upvotes, :through => :content
  has_many :downvotes, :through => :content
end

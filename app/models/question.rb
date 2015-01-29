class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true

  has_many :answers
  has_many :upvotes, :through => :content
  has_many :downvotes, :through => :content

  validates :user_id, presence:  true
  validates :text, presence: true
	
end

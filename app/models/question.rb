class Question < ActiveRecord::Base
  belongs_to :user

  has_many :answers
  has_many :votes, :as => :content

  validates :user_id, presence:  true
  validates :text, presence: true

  # you may not need the lines below
  #
  # def upvotes
  #   opts = {
  #     content_id: self.id,
  #     content_type: "Question",
  #     vote_type: "Upvote"
  #   }
  #   Vote.where opts
  # end

  # def downvotes
  #   opts = {
  #     content_id: self.id,
  #     content_type: "Question",
  #     vote_type: "Downvote"
  #   }
  #   Vote.where opts
  # end
end

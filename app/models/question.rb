class Question < ActiveRecord::Base
  belongs_to :user

  has_many :answers
  has_many :votes, :as => :content

  validates :user_id, presence:  true
  validates :text, presence: true

end

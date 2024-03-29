class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes, :as => :content

  validates :text, presence: true
end

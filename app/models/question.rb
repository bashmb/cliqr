class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true

  has_many :answers
end

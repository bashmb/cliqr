class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :content, polymorphic: true
end

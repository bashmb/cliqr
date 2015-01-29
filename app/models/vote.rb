class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true
end

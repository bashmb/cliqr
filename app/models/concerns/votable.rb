module Votable
  extend ActiveSupport::Concern

  included do
    has_many :upvotes
    has_many :downvotes

    belongs_to :answer
    belongs_to :question
  end

  def load_content
    content_type, content_id, vote_type = request.path.split('/')[1,2,3]
    @content = [content_type.singularize.classify.constantize.find(content_id),
                vote_type.singularize.classify.constantize]
  end
end

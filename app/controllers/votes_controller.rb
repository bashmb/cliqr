class VotesController < ApplicationController
  before_filter :load_content

  def create
    if current_user.id
      vote = @content.votes.new
      vote.user_id = current_user.id
      vote.vote_type = params[:vote][:vote_type] 
      vote.save
      
      upvotes = @content.upvote
      downvotes = @content.downvote

      params[:vote][:vote_type] == 'upvote' ? @content.update(upvote: upvotes + 1) : @content.update(downvote: downvotes + 1)
    end
    redirect_to :back 
  end

  private

  def load_content
    content_type, content_id = request.path.split('/')[1,2]
    @content = content_type.singularize.classify.constantize.find(content_id)
  end
end

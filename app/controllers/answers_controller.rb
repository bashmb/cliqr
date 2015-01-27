class AnswersController < ApplicationController
  def create
    Answer.create(answer_params)
    redirect_to root_path
  end

  def destroy
  end

  def edit
  end

  def index
  end

  def new
  end

  def show
    @answer = Answer.find_by question_id:15
    @answerContent = @answer['content']
    @answerUpvotes = @answer['upvote']
    @answerDownvotes = @answer['downvote']
  end

  def update
  end

    def question_params
    params.require(:answer).permit(:content, :upvote, :downvote)
  end
end

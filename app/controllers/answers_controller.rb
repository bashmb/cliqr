class AnswersController < ApplicationController
  def create
<<<<<<< HEAD
    Answer.create(answer_params)
=======
    answer = Answer.create(answer_params)
>>>>>>> origin/master
    redirect_to root_path
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to root_path
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def show
<<<<<<< HEAD
    @answer = Answer.find_by question_id:15
    @answerContent = @answer['content']
    @answerUpvotes = @answer['upvote']
    @answerDownvotes = @answer['downvote']
=======
    @answer = Answer.find(params[:id])
>>>>>>> origin/master
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    redirect_to root_path
  end

  private
  def answer_params
    answer.require(:answer).permit(:text, :upvote, :downvote)
  end

    def question_params
    params.require(:answer).permit(:content, :upvote, :downvote)
  end
end

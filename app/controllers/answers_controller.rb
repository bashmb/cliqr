class AnswersController < ApplicationController
  def create
    answer = Answer.create(answer_params)
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
    @answer = Answer.find(params[:id])
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
end

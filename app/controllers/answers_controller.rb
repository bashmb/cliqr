class AnswersController < ApplicationController
  def create
     # binding.pry
     answer = Answer.new
     answer.text = params[:answer][:text]
     answer.upvote = 1
     answer.downvote = 0
     answer.question_id = params[:answer][:question_id]
     answer.save
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
end

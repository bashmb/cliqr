class AnswersController < ApplicationController
  def create
     answer = Answer.new
     answer.text = answer_params[:text]
     answer.upvote = 1
     answer.downvote = 0
     answer.question_id = answer_params[:question_id]
     answer.save

     question = Question.find(answer_params[:question_id])
     redirect_to question_path(question)
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
  
  def vet
    answer = Answer.find(params[:id])
    answer.update(vetted: true)
    redirect_to question_path(answer.question)
  end

  private
  def answer_params
    params.require(:answer).permit(:text, :question_id)
  end
end

class QuestionsController < ApplicationController
  def create
    # binding.pry
    question = Question.create(question_params)
    redirect_to question_path(question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order('upvote - downvote DESC')
    @answer = @question.answers.new
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_path(@question)
  end

  private
  def question_params
    params.require(:question).permit(:text, :upvote, :downvote, :user_id)
  end
end

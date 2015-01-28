class QuestionsController < ApplicationController
  def create
    question = Question.create(question_params)
    redirect_to "/questions"
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
    puts "in index"
    @questions = Question.all
    @answers = @questions.each{|question| question.answers}
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
    redirect_to root_path
  end

  private
  def question_params
    params.require(:question).permit(:text, :upvote, :downvote)
  end
end

class QuestionsController < ApplicationController
  def create
    question = Question.create(question_params)
    redirect_to root_path
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

    @questionContent = @question['text']
    @questionUpvotes = @question['upvote']
    @questionDownvotes = @question['downvote']
    @answers = @question.answers

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
